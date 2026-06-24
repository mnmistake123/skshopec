<?php

/**
 * 2020 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

class DatafastCallbackModuleFrontController extends ModuleFrontController
{
    public $log_file = "";
    public $debug_mode = false;

    public function initContent()
    {
        parent::initContent();

        $this->log_file = $this->module->getLocalPath() . "log.txt";
        $this->debug_mode = Configuration::get('VEX_DATAFAST_DEBUG');

        $entityId = Configuration::get('VEX_DATAFAST_ENTITYID');
        $bearer = Configuration::get('VEX_DATAFAST_BEARER');

        $cart = new Cart(Tools::getValue('cart_id'));
        $customer = new Customer($cart->id_customer);

        $this->log("[cart_id{$cart->id}] REQUEST CAPTURE ID: " . Tools::getValue('id'));
        $result = $this->processPayment(Tools::getValue('id'), $entityId, $bearer);
        $this->log("[cart_id{$cart->id}] RESPONSE REQUEST CAPTURE" . json_encode($result));

        if ((empty($result)) || (!in_array($result['result']['code'], ['000.100.110', '000.100.112', '000.000.000']))) {

            if ($result['result']) {
                $errors = $result['result']['code'] . " " . $result['result']['description'];
                $this->log("[cart_id{$cart->id}] Cant capture payment. Error " . $errors);
            } else {
                $errors = "Unknown error!";
                $this->log("[cart_id{$cart->id}] Cant capture payment. Unknown error");
            }

            $this->context->smarty->assign('errors', [$errors]);
            $orderState = Configuration::get('VEX_DATAFAST_REJECTED_STATE');
            $this->module->validateOrder($cart->id, $orderState, 0, 'Datafast', $errors, '', '', true, $customer->secure_key);
            $this->setTemplate('module:datafast/views/templates/front/ps17/payment_error.tpl');
        } else {
            $this->log("[cart_id{$cart->id}] Order captured!: " . json_encode($result));
            $this->saveCc($result, $customer->id);

            $orderState = Configuration::get('VEX_DATAFAST_APROVED_STATE');
            $total = $result['amount'];
            $message = $result['result']['code'] . " " . $result['result']['description'];
            $trans = $result['id'];

            $verifit = $this->verificPayment($trans, $entityId, $bearer);
            $this->log("[cart_id{$cart->id}] RESPONSE REQUEST VERIFICATION" . json_encode($verifit));
            $cart_amount = $cart->getOrderTotal(true);
            $amount = number_format((float)$cart_amount, 2, '.', '');

            $this->module->validateOrder($cart->id, $orderState, $total, 'Datafast', $message, ['transaction_id' => $trans], '', true, $customer->secure_key);

            if (Configuration::get('VEX_DATAFAST_SUBSCRIPTION')) {
                $this->saveDataSubs($cart, $result, $this->module->currentOrder, $customer->id);
            }

            $this->saveOrder($result, $amount, $this->module->id);
            Tools::redirect('index.php?controller=order-confirmation&id_cart=' . $cart->id . '&id_module=' . $this->module->id . '&id_order=' . $this->module->currentOrder . '&key=' . $customer->secure_key);
        }
    }

    private function processPayment($id, $entityId, $bearer)
    {
        // @todo: update production endpoint
        if (Configuration::get('VEX_DATAFAST_ENVIRONMENT') == '1') {
            $base_url = "https://eu-prod.oppwa.com";
        } else {
            $base_url = "https://test.oppwa.com";
        }


        $url = $base_url . "/v1/checkouts/{$id}/payment?entityId={$entityId}";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization:Bearer ' . $bearer));
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, Configuration::get('VEX_DATAFAST_ENVIRONMENT') == '1' ? true : false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $responseData = curl_exec($ch);

        if (curl_errno($ch)) {
            return curl_error($ch);
        }

        curl_close($ch);

        return json_decode($responseData, true);
    }

    private function saveDataSubs($cart, $response, $oder_id, $customerId)
    {
        $hasSubProd = true;
        foreach ($cart->getProducts() as $productData) {
            $idProduct = $productData['id_product'];
            if (!Datafast_request::checkIfSubscriptionProduct($idProduct)) {
                $hasSubProd = false;
            }
        }

        if ($hasSubProd) {
            if (isset($response['registrationId']) && $token = $response['registrationId']) {
                Db::getInstance()->execute(
                    "INSERT INTO `" . _DB_PREFIX_ . "customer_subs` (`id_customer`, `order`, `token`)
                    VALUES ('{$customerId}', '{$oder_id}', '{$token}')"
                );
            }
        }
    }


    private function verificPayment($id, $entityId, $bearer)
    {
        // @todo: update production endpoint
        if (Configuration::get('VEX_DATAFAST_ENVIRONMENT') == '1')
            $base_url = "https://eu-prod.oppwa.com";
        else
            $base_url = "https://test.oppwa.com";


        $url = $base_url . "/v1/query/{$id}?entityId={$entityId}";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization:Bearer ' . $bearer));
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, Configuration::get('VEX_DATAFAST_ENVIRONMENT') == '1' ? true : false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $responseData = curl_exec($ch);

        if (curl_errno($ch)) {
            return curl_error($ch);
        }

        curl_close($ch);

        return json_decode($responseData, true);
    }

    private function saveCc($response, $customerId)
    {
        if (Configuration::get('VEX_DATAFAST_SAVE_CC')) {
            if (isset($response['registrationId']) && $token = $response['registrationId']) {
                $this->log(" Saving CC user:{$customerId} token: {$token}");
                return Db::getInstance()->execute(
                    "INSERT INTO `" . _DB_PREFIX_ . "customer_cc_vex` (`id_customer`, `token`)
                        VALUES ('{$customerId}', '{$token}')
                        ON DUPLICATE KEY UPDATE token='{$token}'"
                );
            }
        }
        return false;
    }

    private function saveOrder($response, $amount, $id)
    {
        if ($idT = $response['id']) {
            return Db::getInstance()->execute(
                "INSERT INTO `" . _DB_PREFIX_ . "orders_datafast` (`id_order`, `amount`, `transaction_id`)
                    VALUES ('{$id}', '{$amount}', '{$idT}')"
            );
        }
        return false;
    }

    private function log($string)
    {
        if ($this->debug_mode) {
            file_put_contents($this->log_file, date('Y-m-d H:i:s') . " - " . $string . "\n", FILE_APPEND | LOCK_EX);
        }
    }
}