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

        // 1. Must be logged in
        if (!$this->context->customer->isLogged()) {
            $loginUrl = Context::getContext()->link->getPageLink('authentication');
            Tools::redirect($loginUrl . '?back=' . urlencode($_SERVER['REQUEST_URI']));
            // Tools::redirect('index.php?controller=authentication&back=' . urlencode($_SERVER['REQUEST_URI']));
        }

        // 2. Product must exist in videoMap
        $videoMap = $this->module->getVideoMap();
        if (!isset($videoMap[$productId])) {
            Tools::redirect(Context::getContext()->link->getPageLink('pagenotfound'));
            // Tools::redirect('index.php?controller=404');
        }

        // 3. Customer must have purchased this product
        if (!$this->customerHasPurchased($productId)) {
            Tools::redirect($link->getProductLink($productId));
            // Tools::redirect('index.php?controller=product&id_product=' . $productId);
        }

        // 4. Generate fresh signed Bunny URL
        $videoUrl = $this->module->generateBunnyURL($videoMap[$productId]);

        // 5. Pass to template
        $this->context->smarty->assign([
            'video_url'  => $videoUrl,
            'product_id' => $productId,
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