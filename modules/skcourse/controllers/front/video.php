<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class SkcourseVideoModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();

        $productId  = (int)Tools::getValue('id_product');
        $moduleId   = (int)Tools::getValue('id_module'); // 0 if not in URL
        $customerId = (int)$this->context->customer->id;
        $link       = Context::getContext()->link;

        // Get product name
        $product     = new Product($productId, false, $this->context->language->id);
        $productName = $product->name;

        // 1. Must be logged in
        if (!$this->context->customer->isLogged()) {
            $currentUrl = 'https://' . Tools::getShopDomainSsl() . $_SERVER['REQUEST_URI'];
            $back = urlencode($currentUrl);
            Tools::redirect($link->getPageLink('authentication', true, null, ['back' => $back]));
        }

        // 2. Product must exist in courseMap
        $courseMap = $this->module->getCourseMap();
        if (!is_array($courseMap) || !isset($courseMap[$productId])) {
            Tools::redirect($link->getPageLink('pagenotfound'));
        }

        $course = $courseMap[$productId];

        // 3. Get order date for this purchase
        $query = new DbQuery();
        $query->select('o.date_add')
            ->from('order_detail', 'od')
            ->innerJoin('orders', 'o', 'o.id_order = od.id_order')
            ->where('o.id_customer = ' . $customerId)
            ->where('od.product_id = ' . $productId)
            ->where('o.current_state = 2')
            ->orderBy('o.date_add DESC');

        $orderDate = Db::getInstance()->getValue($query);

        // 4. Not purchased
        if (!$orderDate) {
            Tools::redirect($link->getProductLink($productId));
        }

        // 5. Check if access has expired
        $expiration = strtotime($orderDate) + $this->module->getTokenExpirySeconds();

        if (time() > $expiration) {
            $this->context->smarty->assign([
                'expired'      => true,
                'product_id'   => $productId,
                'product_name' => $productName,
                'expires_at'   => date('d/m/Y H:i', $expiration),
                'show_modules' => false,
            ]);
            $this->setTemplate('module:skcourse/views/templates/front/video.tpl');
            return;
        }

        // 6. Build base course URL
        $baseUrl   = rtrim($this->context->shop->getBaseURL(true), '/');
        $courseUrl = $baseUrl . '/ver-curso/' . $productId;

        // 7. No module ID → show modules list
        if (!$moduleId) {
            $modules = [];
            foreach ($course['modules'] as $id => $mod) {
                $modules[] = [
                    'id'    => $id,
                    'title' => $mod['title'],
                    'description' => $mod['description'] ?? '',
                    'url'   => $courseUrl . '/modulo/' . $id,
                ];
            }

            $this->context->smarty->assign([
                'expired'      => false,
                'product_id'   => $productId,
                'product_name' => $productName,
                'course_title' => $course['title'],
                'modules'      => $modules,
                'expires_at'   => date('d/m/Y H:i', $expiration),
                'show_modules' => true,
            ]);

            $this->setTemplate('module:skcourse/views/templates/front/video.tpl');
            return;
        }

        // 8. Module ID in URL → validate module exists
        if (!isset($course['modules'][$moduleId])) {
            Tools::redirect($courseUrl);
        }

        $currentModule = $course['modules'][$moduleId];

        // 9. Generate signed Bunny URL for this module
        $videoUrl = $this->module->generateBunnyURLWithExpiry($currentModule['videoId'], $expiration);

        // 10. Build prev/next navigation
        $moduleIds  = array_keys($course['modules']);
        $currentPos = array_search($moduleId, $moduleIds);
        $prevUrl    = $currentPos > 0
            ? $courseUrl . '/modulo/' . $moduleIds[$currentPos - 1]
            : null;
        $nextUrl    = $currentPos < count($moduleIds) - 1
            ? $courseUrl . '/modulo/' . $moduleIds[$currentPos + 1]
            : null;

        // 11. Pass to template
        $this->context->smarty->assign([
            'expired'        => false,
            'product_id'     => $productId,
            'product_name'   => $productName,
            'course_title'   => $course['title'],
            'module_title'   => $currentModule['title'],
            'module_id'      => $moduleId,
            'video_url'      => $videoUrl,
            'expires_at'     => date('d/m/Y H:i', $expiration),
            'show_modules'   => false,
            'course_url'     => $courseUrl,
            'prev_url'       => $prevUrl,
            'next_url'       => $nextUrl,
            'total_modules'  => count($course['modules']),
            'current_module' => $currentPos + 1,
            'module_description' => $currentModule['description'] ?? '',
        ]);

        $this->setTemplate('module:skcourse/views/templates/front/video.tpl');
    }

    private function customerHasPurchased($productId)
    {
        $customerId = (int)$this->context->customer->id;

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