<?php
class Cart extends CartCore
{
    /*
    * module: quantitydiscountpro
    * date: 2022-04-28 09:46:11
    * version: 2.1.37
    */
    public function addCartRule($id_cart_rule, bool $useOrderPrices = false)
    {
        $result = parent::addCartRule($id_cart_rule, $useOrderPrices);
        if (Module::isEnabled('quantitydiscountpro')) {
            include_once(_PS_MODULE_DIR_.'quantitydiscountpro/quantitydiscountpro.php');
            $quantityDiscountRulesAtCart = QuantityDiscountRule::getQuantityDiscountRulesAtCart((int)Context::getContext()->cart->id);
            if (is_array($quantityDiscountRulesAtCart) && count($quantityDiscountRulesAtCart)) {
                foreach ($quantityDiscountRulesAtCart as $quantityDiscountRuleAtCart) {
                    $quantityDiscountRuleAtCartObj = new QuantityDiscountRule((int)$quantityDiscountRuleAtCart['id_quantity_discount_rule']);
                    if (!$quantityDiscountRuleAtCartObj->compatibleCartRules()) {
                        QuantityDiscountRule::removeQuantityDiscountCartRule($quantityDiscountRuleAtCart['id_cart_rule'], (int)Context::getContext()->cart->id);
                    }
                }
            }
        }
        return $result;
    }
    /*
    * module: quantitydiscountpro
    * date: 2022-04-28 09:46:11
    * version: 2.1.37
    */
    public function getCartRules($filter = CartRule::FILTER_ACTION_ALL, $autoAdd = true, $useOrderPrices = false)
    {
        $cartRules = parent::getCartRules($filter, $autoAdd, $useOrderPrices);
        if (Module::isEnabled('quantitydiscountpro')) {
            include_once(_PS_MODULE_DIR_.'quantitydiscountpro/quantitydiscountpro.php');
            foreach ($cartRules as &$cartRule) {
                if (QuantityDiscountRule::isQuantityDiscountRule($cartRule['id_cart_rule'])
                    && !QuantityDiscountRule::isQuantityDiscountRuleWithCode($cartRule['id_cart_rule'])) {
                    $cartRule['code'] = '';
                }
            }
            unset($cartRule);
        }
        return $cartRules;
    }
}
