<?php
/**
 * Gateway License.
 * @version 2.0.0
 * @since   2.0.0
 */

require_once 'class-curl.php';

/**
 * Gateway License.
 *
 * @since 2.0.0
 */
class Vex_License_Datafast
{

    const LICENSE_SECRET_KEY = '587423b988e403.69821411';
    const LICENSE_SERVER_URL = 'https://www.pasarelasdepagos.com';
    const ITEM_REFERENCE = 'Datafasr - Prestashop Gateway';

    /**
     * Parent module class.
     *
     * @since 2.0.0
     *
     */
    protected $module = null;

    /**
     * @var Context
     */
    protected $context;

    /**
     * Constructor.
     *
     * @since  2.0.0
     *
     */
    public function __construct($module)
    {
        $this->module = $module;
        $this->context = Context::getContext();
    }

    /**
     * Initiate our verify.
     *
     * @since  2.0.0
     */
    public function verify()
    {

        return Configuration::updateValue('VEX_ACTIVATED', '1');

        $license = Configuration::get('VEX_LICENSE', null, null, null, '');

        if (!empty($license)) {
            Tools::refreshCACertFile();

            $data = array(
                'slm_action' => 'slm_check',
                'secret_key' => self::LICENSE_SECRET_KEY,
                'license_key' => $license,
            );

            $curl = new Vex_Curl_Datafast();
            $curl->setOpt(CURLOPT_CAINFO, _PS_CACHE_CA_CERT_FILE_);
            $curl->get(self::LICENSE_SERVER_URL, $data);

            if ($curl->isSuccess()) {
                $license_data = @json_decode($curl->response);

                if ($license_data !== null && json_last_error() === JSON_ERROR_NONE) {
                    if ($license_data->result == 'success') {
                        if ($license_data->max_allowed_domains > count($license_data->registered_domains)) {
                            // validated license
                            return true;
                        } else {
                            foreach ($license_data->registered_domains as $item) {
                                if ($item->registered_domain == $_SERVER['SERVER_NAME']) {
                                    return true;
                                }
                            }

                            $this->context->controller->errors[] = $this->module->l('Reached maximum allowable domains.');
                        }
                    } else {
                        $this->context->controller->errors[] = $license_data->message;
                    }
                } else {
                    $this->context->controller->errors[] = $this->module->l('Communication error.');
                }
            } else {
                $this->context->controller->errors[] = $this->module->l('Unexpected Error! The query returned with an error.');
            }
        }

        $this->disabled();
        return false;
    }

    private function disabled()
    {
        Configuration::updateValue('VEX_ACTIVATED', '0');
        Configuration::updateValue('VEX_LAST_DATE', '');
    }

    public function activate($license)
    {
        return Configuration::updateValue('VEX_ACTIVATED', '1');

        Tools::refreshCACertFile();

        $data = array(
            'slm_action' => 'slm_activate',
            'secret_key' => self::LICENSE_SECRET_KEY,
            'license_key' => $license,
            'registered_domain' => $_SERVER['SERVER_NAME'],
            'item_reference' => urlencode(self::ITEM_REFERENCE),
        );

        $curl = new Vex_Curl_Datafast();
        $curl->setOpt(CURLOPT_CAINFO, _PS_CACHE_CA_CERT_FILE_);
        $curl->get(self::LICENSE_SERVER_URL, $data);

        if ($curl->isSuccess()) {
            $license_data = @json_decode($curl->response);

            if ($license_data !== null && json_last_error() === JSON_ERROR_NONE) {
                if ($license_data->result == 'success') {
                    Configuration::updateValue('VEX_ACTIVATED', '1');
                    Configuration::updateValue('VEX_LAST_DATE', time());

                    $this->context->controller->confirmations[] = $license_data->message;
                    return true;
                } else {
                    $this->context->controller->errors[] = $license_data->message;
                }
            } else {
                $this->context->controller->errors[] = $this->module->l('Communication error.');
            }
        } else {
            $this->context->controller->errors[] = $this->module->l('Unexpected Error! The query returned with an error.');
        }

        $this->disabled();
        return false;
    }
}
