<?php
if (!defined('_PS_VERSION_')) {
    exit;
}
 
class SkcourseLandingModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();
 
        $productId = 1100;
        $link      = Context::getContext()->link;
 
        $product = new Product($productId, false, $this->context->language->id);
        $buyUrl  = $link->getProductLink($productId);
 
        $this->context->smarty->assign([
            'buy_url'      => $buyUrl,
            'product_name' => $product->name,
            'price'        => $product->getPrice(true, null, 2),
        ]);
 
        $this->setTemplate('module:skcourse/views/templates/front/landing.tpl');
    }
}
 