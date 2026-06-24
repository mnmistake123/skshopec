<?php

/**
 * Gateway Request.
 * @version 2.0.0
 * @since   2.0.0
 */


class Datafast_request
{
    public $module = false;
    public $context = false;
    public $environment = false;
    public $datafast_url = '';

    public function __construct($module)
    {
        $this->module = $module;
        $this->context = Context::getContext();
        $this->environment = Configuration::get('VEX_DATAFAST_ENVIRONMENT');
        if ($this->environment == '1') {
            $this->datafast_url = "https://eu-prod.oppwa.com";
        } else {
            $this->datafast_url = "https://test.oppwa.com";
        }
    }

    public static function checkIfSubscriptionProduct($id_product)
    {
        try {
            Shop::addTableAssociation(
                'wk_subscription_products',
                array('type' => 'shop', 'primary' => 'id_wk_subscription_products')
            );
            return Db::getInstance(_PS_USE_SQL_SLAVE_)->getValue(
                'SELECT a.`id_wk_subscription_products`
                FROM `' . _DB_PREFIX_ . 'wk_subscription_products` a '
                    . Shop::addSqlAssociation('wk_subscription_products', 'a') .
                    'WHERE a.`id_product` = ' . (int)$id_product
            );
        } catch (Exception $e) {
            return false;
        }
    }

    public function getTokenDatafast($cart, $customer, $currency)
    {
        $entityId = Configuration::get('VEX_DATAFAST_ENTITYID');
        $mid = Configuration::get('VEX_DATAFAST_MID');
        $tid = Configuration::get('VEX_DATAFAST_TID');
        $bearer = Configuration::get('VEX_DATAFAST_BEARER');
        $commerceName = Configuration::get('VEX_DATAFAST_COMMERCE_NAME');

        $billingAddres = new Address((int)$cart->id_address_invoice);
        $shippingAddress = new Address((int)$cart->id_address_delivery);

        $cedula = $billingAddres->dni;
        if (strlen((string) $cedula > 10)) {
            $cedula = substr($cedula, 0, 10);
        }

        $cedula = str_pad($cedula, 10, "0", STR_PAD_LEFT);
        $cart_amount = $cart->getOrderTotal(true, Cart::BOTH);
        $amount = number_format((float)$cart_amount, 2, '.', '');
        $tax =  $cart_amount - $cart->getOrderTotal(false);

        $params = [];
        $params['entityId'] = $entityId;
        $params['currency'] = $currency->iso_code;
        $params['paymentType'] = 'DB';
        $params['amount'] = $amount;
        $params['customer.givenName'] = $this->context->customer->firstname;
        $params['customer.ip'] = Tools::getRemoteAddr();
        $params['customer.middleName'] = $this->context->customer->firstname;
        $params['customer.surname'] = $this->context->customer->lastname;
        $params['customer.merchantCustomerId'] = $this->context->customer->id;
        $params['merchantTransactionId'] = $cart->id;
        $params['customer.email'] = $this->context->customer->email;
        $params['customer.identificationDocType'] = 'IDCARD';
        $params['customer.identificationDocId'] =  $cedula;
        $params['customer.phone'] = '0000000000';
        $params['billing.street1'] = $billingAddres->address1;
        $params['billing.country'] = 'EC';
        $params['shipping.street1'] = $shippingAddress->address1;
        $params['shipping.country'] = 'EC';
        $i = 0;
        $hasSubProd = true;
        $baseImp = 0;
        $base0 = 0;

        foreach ($cart->getProducts() as $product) {
            $params['cart.items[' . $i . '].name'] = substr($product['name'], 0, 254);
            $params['cart.items[' . $i . '].description'] = substr(trim(strip_tags($product['description_short'])), 0, 254);
            $params['cart.items[' . $i . '].price'] =  number_format($product['total'], 2, '.', '');
            $params['cart.items[' . $i . '].quantity'] = $product['quantity'];
            $i++;

            if (($product['total_wt'] - $product['total']) > 0) {
                $baseImp += $product['price_with_reduction_without_tax'] * $product['quantity'];
            } else {
                $base0 +=  $product['total'];
            }



            $idProduct = $product['id_product'];
            if (!Datafast_request::checkIfSubscriptionProduct($idProduct)) {
                $hasSubProd = false;
            }
        }
        if ($hasSubProd) {
            $params['recurringType'] = "INITIAL";
        }

        $price_shipping = $cart->getTotalShippingCost(null, false);
        if ($price_shipping > 0) {
            $price_shipping_wt = $cart->getTotalShippingCost();

            if (($price_shipping_wt - $price_shipping) > 0) {
                $baseImp += $price_shipping;
            } else {
                $base0 += $price_shipping;
            }
        }

        if ($tax > 0) {
            $rules = $cart->getCartRules();
            foreach ($rules as $rule) {
                $baseImp -= $rule['value_tax_exc'];
            }



            $params['customParameters[SHOPPER_VAL_BASE0]'] =  number_format((float)$base0, 2, '.', '');
            $params['customParameters[SHOPPER_VAL_BASEIMP]'] =  number_format((float)$baseImp, 2, '.', '');
            $params['customParameters[SHOPPER_VAL_IVA]'] = number_format((float)($tax), 2, '.', '');
        } else {
            $params['customParameters[SHOPPER_VAL_BASE0]'] =  number_format((float)$amount, 2, '.', '');
            $params['customParameters[SHOPPER_VAL_BASEIMP]'] =  '0';
            $params['customParameters[SHOPPER_VAL_IVA]'] = "0";
        }


        $params['customParameters[SHOPPER_MID]'] = $mid;
        $params['customParameters[SHOPPER_TID]'] = $tid;

        $params['customParameters[SHOPPER_ECI]'] = '0103910';
        $params['customParameters[SHOPPER_PSERV]'] = '17913101';
        $params['customParameters[SHOPPER_VERSIONDF]'] = '2';

        $params['risk.parameters[USER_DATA2]'] = $commerceName;
        if (!$this->environment) {
            $params['testMode'] = 'EXTERNAL';
        }

        $data_cc = $this->getSavedCc($customer->id);
        if ($data_cc) {
            foreach ($data_cc as $k => $token) {
                $params['registrations[' . $k . '].id'] = $token['token'];
            }
        }

        $this->module->log("[cart_id{$cart->id}] REQUEST TOKEN . " . json_encode($params));
        $response = $this->requestToken($params, $bearer, $hasSubProd);
        $this->module->log("[cart_id{$cart->id}] RESPONSE REQUEST TOKEN . " . json_encode($response));
        return [
            "response" => $response,
            "hasSubProd" => $hasSubProd
        ];
    }

    private function requestToken($params, $bearer)
    {
        $url = "{$this->datafast_url}/v1/checkouts";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization:Bearer ' . $bearer));
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, Configuration::get('VEX_DATAFAST_ENVIRONMENT') == '1' ? true : false); // this should be set to true in production
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $responseData = curl_exec($ch);

        if (curl_errno($ch)) {
            return curl_error($ch);
        }

        curl_close($ch);
        return json_decode($responseData, true);
    }

    private function getSavedCc($customerId)
    {
        if (Configuration::get('VEX_DATAFAST_SAVE_CC')) {
            $sql = new DbQuery();
            $sql->select('*');
            $sql->from('customer_cc_vex', 'uc');
            $sql->where('uc.id_customer = ' . $customerId);

            return Db::getInstance()->executeS($sql);
        }
        return false;
    }
}