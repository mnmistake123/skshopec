<?php

/**
 * 2007-2019 PrestaShop
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
 *  @author    PrestaShop SA <contact@prestashop.com>
 *  @copyright 2007-2019 PrestaShop SA
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

class DatafastAjaxModuleFrontController extends ModuleFrontController
{
    public function __construct()
    {

        parent::__construct();
        $this->ajax = true;
        $this->context = Context::getContext();
    }

    public function postProcess()
    {

        if (Tools::getValue('action') == 'getRegistros') {

            $params = [];
            if ($data = $this->getSavedCc(Tools::getValue('id'))) {
                foreach ($data as $k => $token) {
                    $params['registrations[' . $k . '].id'] = $token['token'];
                }
            }
            die(json_encode([
                'data' => $params,
            ]));
        }

        if (Tools::getValue('action') == 'getToken') {

            $cart = $this->context->cart;
            $customer = new Customer($cart->id_customer);
            $datafast_request = new Datafast_request($this->module);

            $this->datafast_url = $datafast_request->datafast_url;

            $currency = new Currency($cart->id_currency);

            $rest =  $datafast_request->getTokenDatafast($cart, $customer, $currency);
            $response = $rest['response'];
            $this->log("[cart_id{$cart->id}] RESPONSE REQUEST TOKEN . " . json_encode($response));
            $errors = false;
            if (!in_array($response['result']['code'], ['000.200.100', '000.100.112', '000.000.000'])) {
                if ($response['result']) {
                    $errors = $response['result']['code'] . " " . $response['result']['description'];
                    $this->log("[cart_id{$cart->id}] Cant make a token. Error " . $errors);
                } else {
                    $this->log("[cart_id{$cart->id}] Cant make a token. Unknown error");
                    $errors = "Unknown error!";
                }
            }

            die(json_encode([
                'url' => "{$this->datafast_url}/v1/paymentWidgets.js?checkoutId=" . $response['id'],
                'id' => $response['id'],
                'errors' => $errors,
                // 'data' => [$tax_shipping, $shipping]
            ]));
        }
    }



    public function setCustomMedia($tokenId)
    {

        $this->registerJavascript(
            'datafast-js',
            "{$this->datafast_url}/v1/paymentWidgets.js?checkoutId=" . $tokenId,
            [
                'priority' => 200,
                'position' => 'head',
                'server' => 'remote'
            ]
        );

        $this->registerJavascript(
            'jQuery',
            "https://code.jquery.com/jquery-3.5.1.min.js",
            [
                'priority' => 201,
                'position' => 'head',
                'server' => 'remote'
            ]
        );
    }

    /**
     * save log file
     *
     * @param $string
     */
    private function log($string)
    {
        if ($this->debug_mode) {
            file_put_contents($this->log_file, date('Y-m-d H:i:s') . " - " . $string . "\n", FILE_APPEND | LOCK_EX);
        }
    }

    private function getLog()
    {
        return file_get_contents($this->log_file);
    }
}