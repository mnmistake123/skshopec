<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Skcourse extends Module
{
    private $bunnyCDNHost = 'sk-shop-pull-zone.b-cdn.net';

    private $courseMap = [
        1100 => [
            'title'   => 'Curso de Colorimetría Saruka',
            'modules' => [
                1 => [
                    'title'   => 'Introducción',
                    'description' => 'Introducción: Aquí no vas a aprender teoría para memorizar. Vas a descubrir por qué algunos colores potencian tu imagen y otros la apagan, cómo identificar lo que realmente te favorece y por qué nunca fue un problema de estilo, sino de claridad. En esta introducción entenderás cómo funciona el curso, qué vas a lograr al finalizarlo y empezarás a ver tu imagen desde una perspectiva completamente diferente. Este será el primer paso para construir una forma de vestir más estratégica, auténtica y alineada contigo.',
                    'videoId' => '29896e65-3909-43c2-a65f-d335b36b9178',
                ],
                2 => [
                    'title'   => 'MÓDULO 1 – TEORÍA DEL COLOR',
                    'description' => 'En este módulo descubrirás los principios fundamentales del color y entenderás por qué una misma prenda puede hacer que una persona se vea espectacular y otra completamente diferente. Aprenderás cómo la temperatura, la saturación y la luminosidad influyen en tu imagen, cómo tu cerebro percibe la armonía visual y por qué el color correcto puede potenciar tu rostro sin necesidad de cambiar tu ropa. Además, realizarás ejercicios prácticos para empezar a identificar patrones dentro de tu propio clóset y desarrollar un criterio que te permitirá elegir tus colores con seguridad y estrategia. Este es el módulo donde dejarás de vestirte por intuición y comenzarás a hacerlo con conocimiento.',
                    'videoId' => '4574dc73-d86d-4392-a767-d97a37888100',
                ],
                3 => [
                    'title'   => 'MÓDULO 2 – IDENTIDAD CROMÁTICA',
                    'description' => 'En este módulo aprenderás a identificar tu identidad cromática y descubrirás por qué el subtono y el contraste de tu piel son la base para elegir los colores que realmente te favorecen. Entenderás cómo reconocer las señales que ya existen en tus rasgos, interpretarás cómo reaccionan los colores en tu rostro y realizarás ejercicios prácticos para descubrir tu perfil cromático. Al finalizar este módulo dejarás de elegir colores por intuición y comenzarás a hacerlo con criterio, seguridad y una comprensión mucho más profunda de tu propia imagen.',
                    'videoId' => '2cf25c0c-3b11-4099-9471-6d24e717d9da',
                ], 
                4 => [
                    'title'   => 'MÓDULO 3 – SISTEMA DE 12 ESTACIONES',
                    'description' => 'En este módulo descubrirás cómo identificar tu estación cromática y entenderás por qué encontrar tu paleta correcta hace que vestirte sea mucho más fácil y natural. Aprenderás a reconocer las características de cada estación, interpretar la relación entre tu temperatura, contraste e intensidad, y descubrirás cómo construir una paleta que refleje tu esencia. A través de ejercicios prácticos y un análisis guiado, desarrollarás el criterio visual necesario para elegir colores que armonicen contigo, logrando que combinar tu ropa deje de ser una tarea complicada y se convierta en una decisión intuitiva y estratégica. Aquí empezarás a construir una identidad visual coherente que te acompañará cada vez que abras tu clóset.',
                    'videoId' => '8476c0c5-6083-42c7-92bd-85bd6e8d3e66',
                ],
                5 => [
                    'title'   => 'MÓDULO 4 – APLICACIÓN REAL',
                    'description' => 'En este módulo aprenderás a transformar todo lo que has descubierto sobre tu identidad cromática en decisiones reales dentro de tu clóset. Descubrirás cómo construir una base de prendas estratégicas, elegir colores que potencien tu imagen, crear combinaciones con intención y organizar tu ropa para que todo funcione en armonía. A través de ejercicios prácticos analizarás las prendas que ya tienes, aprenderás a identificar qué realmente te favorece y desarrollarás un método para crear outfits con mayor coherencia, seguridad y facilidad. Al finalizar este módulo dejarás de pensar que necesitas comprar más ropa y entenderás que la verdadera diferencia está en saber elegir y combinar lo que ya tienes.',
                    'videoId' => '468e1339-76fc-476d-8f9d-0dfcd69c5753',
                ],  
                6 => [
                    'title'   => 'MÓDULO 5 – TRANSFORMACIÓN FINAL',
                    'description' => 'En este módulo final integrarás todo lo aprendido y transformarás tu forma de vestir en una herramienta de proyección personal. Identificarás los errores más comunes que afectan tu imagen, validarás tu paleta, revisarás tus combinaciones y crearás un outfit final alineado con tu esencia, tu contraste y tus colores ideales. Este cierre no solo busca que te veas mejor, sino que entiendas cómo tomar decisiones con intención, seguridad y claridad cada vez que abras tu clóset. Aquí dejarás de improvisar y empezarás a proyectar una imagen más coherente, auténtica y poderosa.',
                    'videoId' => '32929b7b-a67d-4acd-91f7-ee358eb80af4',
                ],                
                6 => [
                    'title'   => 'CIERRE',
                    'description' => 'Este es el cierre de tu transformación. En esta lección consolidarás todo lo aprendido a lo largo del curso, validarás los cambios que has logrado y descubrirás cómo convertir este conocimiento en un hábito para toda la vida. Además, recibirás las recomendaciones finales para seguir fortaleciendo tu estilo, compartir tu evolución y formar parte de una comunidad que continúa aprendiendo y creciendo. Porque este curso no termina aquí: es el inicio de una nueva forma de vestir, de elegir y, sobre todo, de proyectarte con seguridad y autenticidad.',
                    'videoId' => '2f922857-877f-4373-a1ac-831f9712bf10',
                ],
            ],
        ],
    ];

    // in hours its 90 days
    private $tokenExpiryHours = 2160;

    public function __construct()
    {
        $this->name          = 'skcourse';
        $this->tab           = 'content_management';
        $this->version       = '1.0.0';
        $this->author        = 'SKShop';
        $this->need_instance = 0;
        $this->bootstrap     = true;

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

    // -----------------------------------------------
    // HOOKS
    // -----------------------------------------------
    public function hookActionOrderStatusUpdate($params)
    {
        $newStatus = $params['newOrderStatus'];
        $order     = new Order($params['id_order']);

        if ((int)$newStatus->id !== 2) {
            return;
        }

        $products = $order->getProducts();

        foreach ($products as $product) {
            $productId = (int)$product['product_id'];

            if (!isset($this->courseMap[$productId])) {
                continue;
            }

            $productObj = new Product($productId);
            if (!$productObj->is_virtual) {
                continue;
            }

            $course   = $this->courseMap[$productId];
            $customer = new Customer($order->id_customer);

            // Link to course modules list page
            $baseUrl   = rtrim($this->context->shop->getBaseURL(true), '/');
            $courseUrl = $baseUrl . '/ver-curso/' . $productId;

            $this->sendCourseAccessEmail(
                $customer,
                $course['title'],
                $courseUrl
            );
        }
    }

    public function hookModuleRoutes()
    {
        return [
            // Course modules list: /ver-curso/1100
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
            // Single module player: /ver-curso/1100/modulo/1
            'module-skcourse-player' => [
                'controller' => 'video',
                'rule'       => 'ver-curso/{id_product}/modulo/{id_module}',
                'keywords'   => [
                    'id_product' => [
                        'regexp' => '[0-9]+',
                        'param'  => 'id_product',
                    ],
                    'id_module' => [
                        'regexp' => '[0-9]+',
                        'param'  => 'id_module',
                    ],
                ],
                'params' => [
                    'fc'     => 'module',
                    'module' => 'skcourse',
                ],
            ],
            'module-skcourse-landing' => [
                'controller' => 'landing',
                'rule'       => 'curso-colorimetria',
                'keywords'   => [],
                'params'     => [
                    'fc'     => 'module',
                    'module' => 'skcourse',
                ],
            ],
        ];
    }

    // -----------------------------------------------
    // PUBLIC METHODS (used by front controller)
    // -----------------------------------------------
    public function getCourseMap()
    {
        return $this->courseMap;
    }

    // Keep for backward compatibility
    public function getVideoMap()
    {
        $map = [];
        foreach ($this->courseMap as $productId => $course) {
            $firstModule = reset($course['modules']);
            $map[$productId] = $firstModule['videoId'];
        }
        return $map;
    }

    public function getTokenExpirySeconds()
    {
        return $this->tokenExpiryHours * 3600;
    }

    public function generateBunnyURL($videoId)
    {
        $expiration = time() + ($this->tokenExpiryHours * 3600);
        $path       = '/' . $videoId . '/play_720p.mp4';

        $raw   = Configuration::get('BUNNY_SECURITY_KEY') . $path . $expiration;
        $hash  = hash('sha256', $raw, true);
        $token = base64_encode($hash);
        $token = str_replace(['+', '/', '='], ['-', '_', ''], $token);

        return sprintf(
            'https://%s%s?token=%s&expires=%d',
            $this->bunnyCDNHost,
            $path,
            $token,
            $expiration
        );
    }

    public function generateBunnyURLWithExpiry($videoId, $expiration)
    {
        $path  = '/' . $videoId . '/play_720p.mp4';
        $raw   = Configuration::get('BUNNY_SECURITY_KEY') . $path . $expiration;
        $hash  = hash('sha256', $raw, true);
        $token = base64_encode($hash);
        $token = str_replace(['+', '/', '='], ['-', '_', ''], $token);

        return sprintf(
            'https://%s%s?token=%s&expires=%d',
            $this->bunnyCDNHost,
            $path,
            $token,
            $expiration
        );
    }

    // -----------------------------------------------
    // PRIVATE METHODS
    // -----------------------------------------------
    private function sendCourseAccessEmail($customer, $courseName, $courseUrl)
    {
        $templateVars = [
            '{firstname}'    => $customer->firstname,
            '{lastname}'     => $customer->lastname,
            '{product_name}' => $courseName,
            '{video_url}'    => $courseUrl,
            '{shop_name}'    => Configuration::get('PS_SHOP_NAME'),
        ];

        Mail::Send(
            (int)Configuration::get('PS_LANG_DEFAULT'),
            'course_access',
            $this->l('Your course access link'),
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