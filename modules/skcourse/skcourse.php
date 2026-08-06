<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Skcourse extends Module
{
    private $bunnyCDNHost = 'sk-shop-pull-zone.b-cdn.net';

    // Prestashop -> contifico ID's match
    private $contificoProductoIds = [
        1100 => '0yelYvpX4fgDqaER',
    ];

    // Fixed seller data confirmed by client. If this ever needs to change
    // per-shop, move it to Configuration instead.
    private $contificoVendedor = [
        'ruc'           => '1307042968001',
        'cedula'        => '1307042968',
        'razon_social'  => 'Saruka María Rodríguez Félix',
        'telefonos'     => '02-382-6040',
        'direccion'     => 'N67 De Los Ciruelos Oe1-127',
        'tipo'          => 'N',
        'email'         => 'vendedor@contifico.com',
        'es_extranjero' => false,
    ];

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
        // CONTIFICO_POS_ID / CONTIFICO_CAJA_ID: confirmed working values from
        // client's tested Postman sample. Update via Configuration if Contifico
        // ever issues new ones.
        // CONTIFICO_LAST_DOCUMENT: seed sequence, format 001-001-000000000.
        // CONTIFICO_ADMIN_ALERT_EMAIL: where invoicing failures get reported.
        if (!Configuration::get('CONTIFICO_POS_ID')) {
            Configuration::updateValue('CONTIFICO_POS_ID', '2c9e5160-f360-44e4-9dfe-bed082c1d41d');
        }
        if (!Configuration::get('CONTIFICO_CAJA_ID')) {
            Configuration::updateValue('CONTIFICO_CAJA_ID', 'gArb6965jUQxlayR');
        }
        if (!Configuration::get('CONTIFICO_LAST_DOCUMENT')) {
            Configuration::updateValue('CONTIFICO_LAST_DOCUMENT', '001-001-000008089');
        }
        if (!Configuration::get('CONTIFICO_ADMIN_ALERT_EMAIL')) {
            Configuration::updateValue('CONTIFICO_ADMIN_ALERT_EMAIL', 'rhrh1723@gmail.com');
        }

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
        $customer = new Customer($order->id_customer);
        $courseLineItems = []; // products that belong to courseMap, for the invoice

        foreach ($products as $product) {
            $productId = (int)$product['product_id'];

            if (!isset($this->courseMap[$productId])) {
                continue;
            }

            $productObj = new Product($productId);
            if (!$productObj->is_virtual) {
                continue;
            }

            $course = $this->courseMap[$productId];

            // Link to course modules list page
            $baseUrl   = rtrim($this->context->shop->getBaseURL(true), '/');
            $courseUrl = $baseUrl . '/ver-curso/' . $productId;

            $this->sendCourseAccessEmail(
                $customer,
                $course['title'],
                $courseUrl
            );

            $courseLineItems[] = $product;
        }

        if (!empty($courseLineItems)) {
            $this->sendContificoInvoice($order, $customer, $courseLineItems);
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

    // -----------------------------------------------
    // CONTIFICO INVOICING
    // -----------------------------------------------

    /**
     * Builds the Contifico payload for this order and sends it.
     * $courseLineItems is the subset of $order->getProducts() that matched courseMap.
     */
    private function sendContificoInvoice($order, $customer, $courseLineItems)
    {
        $posId = Configuration::get('CONTIFICO_POS_ID');
        if (empty($posId)) {
            $this->notifyContificoFailure(
                $order,
                'CONTIFICO_POS_ID no está configurado todavía.',
                null
            );
            return;
        }

        $cajaIdCheck = Configuration::get('CONTIFICO_CAJA_ID');
        if (empty($cajaIdCheck)) {
            $this->notifyContificoFailure(
                $order,
                'CONTIFICO_CAJA_ID no está configurado todavía.',
                null
            );
            return;
        }

        // Missing producto_id mapping stops the whole invoice rather than
        // sending an invoice with a wrong/blank line.
        foreach ($courseLineItems as $item) {
            $pid = (int)$item['product_id'];
            if (empty($this->contificoProductoIds[$pid])
                || $this->contificoProductoIds[$pid] === 'REPLACE_ME_CONTIFICO_PRODUCTO_ID'
            ) {
                $this->notifyContificoFailure(
                    $order,
                    "Falta el producto_id de Contifico para el producto PrestaShop #{$pid}.",
                    null
                );
                return;
            }
        }

        // Cliente data: pulled from the order's invoice address, since the
        // checkout form (Datos Personales / Direcciones step) is where
        // cédula/RUC is actually captured, not on the Customer object.
        $address = new Address((int)$order->id_address_invoice);

        $cedula = trim((string)$address->dni);
        if ($cedula === '') {
            $this->notifyContificoFailure(
                $order,
                'El cliente no tiene cédula/RUC registrado en su dirección de facturación.',
                null
            );
            return;
        }

        $phone = $address->phone_mobile ?: $address->phone;

        // Ecuador convention: a natural person's RUC is their cédula (10 digits)
        // + "001" establishment suffix, unless a full 13-digit RUC was captured.
        $ruc = strlen($cedula) === 13 ? $cedula : $cedula . '001';

        $cliente = [
            'ruc'           => $ruc,
            'cedula'        => $cedula,
            'razon_social'  => trim($address->firstname . ' ' . $address->lastname),
            'telefonos'     => (string)$phone,
            'direccion'     => trim($address->address1 . ' ' . $address->address2),
            'tipo'          => 'N',
            'email'         => $customer->email,
            'es_extranjero' => false,
        ];

        // Totals: course prices are tax-included; Ecuador IVA is 15%.
        $ivaRate    = 0.15;
        $detalles   = [];
        $subtotal12 = 0.0;
        $ivaTotal   = 0.0;

        foreach ($courseLineItems as $item) {
            $pid          = (int)$item['product_id'];
            $qty          = (float)$item['product_quantity'];
            $totalTaxIncl = (float)$item['total_price_tax_incl'];

            $baseGravable = round($totalTaxIncl / (1 + $ivaRate), 2);
            $ivaLine      = round($totalTaxIncl - $baseGravable, 2);
            $precioUnit   = $qty > 0 ? round($baseGravable / $qty, 2) : $baseGravable;

            $subtotal12 += $baseGravable;
            $ivaTotal   += $ivaLine;

            $detalles[] = [
                'producto_id'          => $this->contificoProductoIds[$pid],
                'cantidad'             => $qty,
                'precio'               => $precioUnit,
                'porcentaje_iva'       => 15,
                'porcentaje_descuento' => 0.00,
                'base_cero'            => 0.00,
                'base_gravable'        => $baseGravable,
                'base_no_gravable'     => 0.00,
                'porcentaje_ice'       => 0,
                'valor_ice'            => 0,
                'serie'                => null,
                'descripcion'          => null,
            ];
        }

        $total = round($subtotal12 + $ivaTotal, 2);

        $documento = $this->getNextContificoDocumentNumber();
        $cajaId    = Configuration::get('CONTIFICO_CAJA_ID');

        $payload = [
            'pos'                  => $posId,
            'electronico'          => true,
            'reserva_relacionada'  => null,
            'fecha_emision'        => date('d/m/Y'),
            'hora_emision'         => date('H:i:s'),
            'tipo_registro'        => 'CLI',
            'tipo_documento'       => 'FAC',
            'documento'            => $documento,
            // "G" = pagado, per client instructions for now. Later this may
            // need to start as "P"/"E" and be updated via PUT once payment
            // is confirmed asynchronously.
            'estado'               => 'G',
            // Left blank: Contifico/SRI issues the real authorization number
            // once the electronic document is processed; we don't invent one.
            'autorizacion'         => '',
            'referencia'           => '',
            'caja_id'              => $cajaId,
            'cliente'              => $cliente,
            'vendedor'             => $this->contificoVendedor,
            'descripcion'          => 'FACTURA ORDEN ' . $order->id,
            'subtotal_0'           => 0.00,
            'subtotal_12'          => round($subtotal12, 2),
            'iva'                  => round($ivaTotal, 2),
            'ice'                  => 0.00,
            'servicio'             => 0.00,
            'total'                => $total,
            'adicional1'           => '',
            'adicional2'           => '',
            'detalles'             => $detalles,
            'cobros'               => [
                [
                    'forma_cobro'    => 'TC',
                    'monto'          => $total,
                    'numero_cheque'  => null,
                    'tipo_ping'      => 'D',
                ],
            ],
        ];

        $this->postContificoInvoice($order, $payload, $documento);
    }

    /**
     * Increments and persists the last used document number.
     * Format: [0-9]{3}-[0-9]{3}-[0-9]{1,9}, zero-padded on the last segment.
     */
    private function getNextContificoDocumentNumber()
    {
        $last  = Configuration::get('CONTIFICO_LAST_DOCUMENT');
        $parts = explode('-', $last);

        $serie1 = $parts[0] ?? '001';
        $serie2 = $parts[1] ?? '001';
        $seq    = isset($parts[2]) ? (int)$parts[2] : 0;

        $seq++;
        $next = $serie1 . '-' . $serie2 . '-' . str_pad($seq, 9, '0', STR_PAD_LEFT);

        Configuration::updateValue('CONTIFICO_LAST_DOCUMENT', $next);

        return $next;
    }

    private function postContificoInvoice($order, $payload, $documento)
    {
        $apiKey = Configuration::get('CONTIFICO_API_KEY');
        if (empty($apiKey)) {
            $this->notifyContificoFailure($order, 'CONTIFICO_API_KEY no está configurada.', null);
            return;
        }

        $ch = curl_init('https://api.contifico.com/sistema/api/v1/documento/');
        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST           => true,
            CURLOPT_POSTFIELDS     => json_encode($payload),
            CURLOPT_HTTPHEADER     => [
                'Content-Type: application/json',
                'Authorization: ' . $apiKey,
            ],
            CURLOPT_TIMEOUT        => 20,
        ]);

        $response  = curl_exec($ch);
        $httpCode  = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        if ($curlError || $httpCode < 200 || $httpCode >= 300) {
            $this->notifyContificoFailure(
                $order,
                "Fallo al crear factura Contifico (documento {$documento}). HTTP {$httpCode}. cURL error: {$curlError}",
                $response
            );
        }
    }

    private function notifyContificoFailure($order, $message, $responseBody)
    {
        $to      = Configuration::get('CONTIFICO_ADMIN_ALERT_EMAIL') ?: 'rhrh1723@gmail.com';
        $subject = '[SKShop] Fallo al facturar orden #' . $order->id;

        $templateVars = [
            '{order_id}'      => $order->id,
            '{customer_id}'   => $order->id_customer,
            '{date}'          => date('Y-m-d H:i:s'),
            '{message}'       => $message,
            '{response_body}' => $responseBody ? $responseBody : '(sin respuesta)',
        ];

        Mail::Send(
            (int)Configuration::get('PS_LANG_DEFAULT'),
            'contifico_failure',
            $subject,
            $templateVars,
            $to,
            null,
            null,
            null,
            null,
            null,
            _PS_MODULE_DIR_ . $this->name . '/mails/'
        );

        PrestaShopLogger::addLog(
            'Skcourse Contifico invoicing failed for order #' . $order->id . ': ' . $message,
            3, // severity: error
            null,
            'Order',
            (int)$order->id
        );
    }
}
