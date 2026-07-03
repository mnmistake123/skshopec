<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class SkcourseVideoModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();

        $productId = (int)Tools::getValue('id_product');
        $customerId = (int)$this->context->customer->id;
        $link = Context::getContext()->link;

        // 1. Must be logged in
        if (!$this->context->customer->isLogged()) {
            $currentUrl = 'https://' . Tools::getShopDomainSsl() . $_SERVER['REQUEST_URI'];
            $back = urlencode($currentUrl);
            Tools::redirect($link->getPageLink('authentication', true, null, ['back' => $back]));
        }

        // 2. Product must exist in videoMap
        $videoMap = $this->module->getVideoMap();
        if (!isset($videoMap[$productId])) {
            Tools::redirect(Context::getContext()->link->getPageLink('pagenotfound'));
            // Tools::redirect('index.php?controller=404');
        }

        // 3. Get order date for this purchase
        $query = new DbQuery();
        $query->select('o.date_add')
            ->from('order_detail', 'od')
            ->innerJoin('orders', 'o', 'o.id_order = od.id_order')
            ->where('o.id_customer = ' . $customerId)
            ->where('od.product_id = ' . $productId)
            ->where('o.current_state = 2')
            // ->orderBy('o.date_add', 'DESC');
            ->orderBy('o.date_add DESC'); 
            // ->limit(1);

        $orderDate = Db::getInstance()->getValue($query);

        // 4. Not purchased
        if (!$orderDate) {
            Tools::redirect($link->getProductLink($productId));
        }
        // // 3. Customer must have purchased this product
        // if (!$this->customerHasPurchased($productId)) {
        //     // Tools::redirect($link->getProductLink($productId));
        //     Tools::redirect($link->getPageLink('product', true, null, ['id_product' => $productId]));
        //     // Tools::redirect('index.php?controller=product&id_product=' . $productId);
        // }

        // 5. Check if access has expired
        $expiration = strtotime($orderDate) + ($this->module->getTokenExpirySeconds());

        if (time() > $expiration) {
            // Show expired message instead of redirecting
            $this->context->smarty->assign([
                'product_id'  => $productId,
                'expired'     => true,
                'expires_at'  => date('d/m/Y H:i', $expiration),
            ]);
            $this->setTemplate('module:skcourse/views/templates/front/video.tpl');
            return;
        }

        // 6. Generate signed URL with fixed expiration
        $videoUrl = $this->module->generateBunnyURLWithExpiry($videoMap[$productId], $expiration);

        // 7. Pass to template
        $this->context->smarty->assign([
            'video_url'   => $videoUrl,
            'product_id'  => $productId,
            'expired'     => false,
            'expires_at'  => date('d/m/Y H:i', $expiration),
        ]);

        $this->setTemplate('module:skcourse/views/templates/front/video.tpl');
    }

    private function customerHasPurchased($productId)
    {
        $customerId = (int)$this->context->customer->id;

        // Query orders that are paid (state 2 = payment accepted)
        // and contain this product
        $query = new DbQuery();
        $query->select('od.id_order_detail')
              ->from('order_detail', 'od')
              ->innerJoin('orders', 'o', 'o.id_order = od.id_order')
              ->where('o.id_customer = ' . $customerId)
              ->where('od.product_id = ' . $productId)
              ->where('o.current_state = 2');

        return (bool)Db::getInstance()->getValue($query);
    }
}