<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Skcourse extends Module
{
    // Map product IDs to Bunny video IDs
    private $videoMap = [
        1100 => '9080cf5e-f778-4b22-89b7-80d44b686dc4', // product ID => bunny video ID
    ];

    // Bunny Stream config
    private $bunnySecurityKey = '9b53ec7f-ddd0-4668-86f6-9fd8ccbacdee';
    private $bunnyLibraryID   = '689912';
    private $tokenExpiryHours = 48; // how long the link stays valid

    public function __construct()
    {
        $this->name                   = 'skcourse';
        $this->tab                    = 'content_management';
        $this->version                = '1.0.0';
        $this->author                 = 'SKShop';
        $this->need_instance          = 0;
        $this->bootstrap              = true;

        parent::__construct();

        $this->displayName = $this->l('SK Course Access');
        $this->description = $this->l('Sends video access link after course purchase.');
    }

    public function install()
    {
        return parent::install()
            && $this->registerHook('actionOrderStatusUpdate')
            && $this->registerHook('moduleRoutes'); 
    }

    public function uninstall()
    {
        return parent::uninstall();
    }

    // Fires every time an order status changes
    public function hookActionOrderStatusUpdate($params)
    {
        $newStatus = $params['newOrderStatus'];
        $order     = new Order($params['id_order']);

        // Only act when payment is accepted (status ID 2)
        if ((int)$newStatus->id !== 2) {
            return;
        }

        // Get all products in this order
        $products = $order->getProducts();

        foreach ($products as $product) {
            $productId = (int)$product['product_id'];

            // Check if this product has a video assigned
            if (!isset($this->videoMap[$productId])) {
                continue;
            }

            // verify it's a virtual/digital product
            $productObj = new Product($productId);
            if (!$productObj->is_virtual) {
                continue;
            }

            $videoId = $this->videoMap[$productId];

            // Generate signed Bunny URL
            $videoUrl = $this->generateBunnyURL($videoId);

            // Get customer info
            $customer = new Customer($order->id_customer);

            // Send access email
            $this->sendCourseAccessEmail($customer, $product['product_name'], $videoUrl);
        }
    }

    public function hookModuleRoutes()
    {
        return [
            'module-skcourse-video' => [
                'controller' => 'video',
                'rule'       => 'ver-curso/{id_product}',
                'keywords'   => [
                    'id_product' => [
                        'regexp' => '[0-9]+',
                        'param'  => 'id_product',
                    ],
                ],
                'params' => [
                    'fc'     => 'module',
                    'module' => 'skcourse',
                ],
            ],
        ];
    }

    public function getVideoMap() { return $this->videoMap; }

    public function generateBunnyURL($videoId)
    {
        $expiration = time() + ($this->tokenExpiryHours * 3600);
        $raw        = $this->bunnySecurityKey . $videoId . $expiration;
        $token      = hash('sha256', $raw);

        return sprintf(
            'https://iframe.mediadelivery.net/embed/%s/%s?token=%s&expires=%d',
            $this->bunnyLibraryID,
            $videoId,
            $token,
            $expiration
        );
    }

    private function sendCourseAccessEmail($customer, $productName, $videoUrl)
    {
        $templateVars = [
            '{firstname}'    => $customer->firstname,
            '{lastname}'     => $customer->lastname,
            '{product_name}' => $productName,
            '{video_url}'    => $videoUrl,
            '{shop_name}'    => Configuration::get('PS_SHOP_NAME'),
        ];

        Mail::Send(
            (int)Configuration::get('PS_LANG_DEFAULT'),
            'course_access',                        // email template name
            $this->l('Your course access link'),    // email subject
            $templateVars,
            $customer->email,
            $customer->firstname . ' ' . $customer->lastname,
            null,
            null,
            null,
            null,
            _PS_MODULE_DIR_ . $this->name . '/mails/'
        );
    }
}