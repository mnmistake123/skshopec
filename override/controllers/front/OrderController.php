<?php
class OrderController extends OrderControllerCore
{
    /*
    * module: quantitydiscountpro
    * date: 2022-04-28 09:46:09
    * version: 2.1.37
    */
    protected function bootstrap()
    {
        parent::bootstrap();
        if (Module::isEnabled('quantitydiscountpro') && Tools::getValue('action') == 'updateCarrier') {
            include_once(_PS_MODULE_DIR_.'quantitydiscountpro/quantitydiscountpro.php');
            $quantityDiscount = new QuantityDiscountRule();
            $quantityDiscount->createAndRemoveRules();
        }
    }
}
