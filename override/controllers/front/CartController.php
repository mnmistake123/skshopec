<?php
class CartController extends CartControllerCore
{
    /*
    * module: quantitydiscountpro
    * date: 2022-04-28 09:46:09
    * version: 2.1.37
    */
    protected function updateCart()
    {
        if (Module::isEnabled('quantitydiscountpro')) {
            include_once(_PS_MODULE_DIR_.'quantitydiscountpro/quantitydiscountpro.php');
            if ($this->context->cookie->exists() && !$this->errors && !($this->context->customer->isLogged() && !$this->isTokenValid())) {
                if (Tools::getIsset('add') || Tools::getIsset('update')) {
                    $this->processChangeProductInCart();
                } elseif (Tools::getIsset('delete')) {
                    $this->processDeleteProductInCart();
                } elseif (CartRule::isFeatureActive()) {
                    if (Tools::getIsset('addDiscount') || Tools::getIsset('searchcoupon')) {
                        if (!($code = trim((Tools::getValue('discount_name') ? Tools::getValue('discount_name') : Tools::getValue('coupon'))))) {
                            $this->errors[] = $this->trans('You must enter a voucher code.', array(), 'Shop.Notifications.Error');
                        } elseif (!Validate::isCleanHtml($code)) {
                            $this->errors[] = $this->trans('The voucher code is invalid.', array(), 'Shop.Notifications.Error');
                        } else {
                            $quantityDiscount = new QuantityDiscountRule();
                            if (($quantityDiscount = new quantityDiscountRule(QuantityDiscountRule::getQuantityDiscountRuleByCode($code))) && Validate::isLoadedObject($quantityDiscount)) {
                                if ($quantityDiscount->createAndRemoveRules($code) !== true) {
                                    $this->errors[] = $this->trans('The voucher code is invalid.', array(), 'Shop.Notifications.Error');
                                }
                            } elseif (($cartRule = new CartRule(CartRule::getIdByCode($code))) && Validate::isLoadedObject($cartRule)) {
                                if ($quantityDiscount->cartRuleGeneratedByAQuantityDiscountRuleCode($code)) {
                                    $this->errors[] = $this->trans('The voucher code is invalid.', array(), 'Shop.Notifications.Error');
                                } elseif ($error = $cartRule->checkValidity($this->context, false, true)) {
                                    $this->errors[] = $error;
                                } else {
                                    $this->context->cart->addCartRule($cartRule->id);
                                }
                            } else {
                                $this->errors[] = $this->trans('This voucher does not exist.', array(), 'Shop.Notifications.Error');
                            }
                        }
                    } elseif (($id_cart_rule = (int)Tools::getValue('deleteDiscount')) && Validate::isUnsignedId($id_cart_rule)) {
                        if (!QuantityDiscountRule::removeQuantityDiscountCartRule($id_cart_rule, (int)$this->context->cart->id)) {
                            $this->context->cart->removeCartRule($id_cart_rule);
                        }
                        CartRule::autoAddToCart($this->context);
                    }
                }
            } elseif (!$this->isTokenValid() && Tools::getValue('action') !== 'show' && !Tools::getValue('ajax')) {
                Tools::redirect('index.php');
            }
        } else {
            parent::updateCart();
        }
    }
    
    
    
}
