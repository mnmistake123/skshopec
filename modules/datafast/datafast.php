<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

use PrestaShop\PrestaShop\Core\Payment\PaymentOption;

require_once dirname(__FILE__) . '/classes/class-license.php';
require_once dirname(__FILE__) . '/classes/class-request.php';

class Datafast extends PaymentModule
{
    public $log_file = "";
    public $debug_mode = false;
    public $path;


    public function __construct()
    {
        $this->name = 'datafast';
        $this->tab = 'payments_gateways';
        $this->version = '2.0.6';
        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
        $this->author = 'dataTest';
        $this->controllers = array('validation', 'callback');
        $this->is_eu_compatible = 1;
        $this->path = __FILE__;

        $this->currencies = true;
        $this->currencies_mode = 'checkbox';
        $this->template_dir = '../../../../modules/' . $this->name;

        $this->bootstrap = true;
        parent::__construct();

        $this->displayName = $this->l('Datafast');
        $this->description = $this->l('Pay using datafast ');

        if (!count(Currency::checkPaymentCurrencies($this->id))) {
            $this->warning = $this->l('No currency has been set for this module.');
        }

        $this->log_file = $this->getLocalPath() . "log.txt";
        $this->debug_mode = Configuration::get('VEX_DATAFAST_DEBUG');
    }

    public function install()
    {
        $this->createAdminTabs();
        Configuration::updateValue('VEX_DATAFAST_FORM', '1');

        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader') &&
            $this->registerHook('displayAdminOrder') &&
            $this->registerHook('paymentOptions') &&
            $this->registerHook('paymentReturn');
    }

    public function uninstall()
    {
        $this->uninstallTab();
        if (!parent::uninstall()) {
            return false;
        }
        return true;
    }

    public function createAdminTabs()
    {
        // Parent hidden class
        $this->installTab('AdminDatafast', 'Datafast');
        $this->installTab('AdminDatafastModule', 'Datafast Module', 'AdminDatafast');
        $this->installTab('AdminDatafastConfig', 'Configuración', 'AdminDatafastModule');
        $this->installTab('AdminDeleteOrderDatafast', 'Reversos', 'AdminDatafastModule');
        $this->installTab('AdminInteresesDatafast', 'Intereses', 'AdminDatafastModule');
        $this->installTab('AdminBancksDatafast', 'Bancos', 'AdminDatafastModule');
    }

    public function installTab($className, $tabName, $tabParentName = false)
    {
        // Create instance of Tab class
        $tab = new Tab;
        $tab->name = array();
        $tab->class_name = $className;
        $tab->active = 1;
        // Set tab name for all installed languages
        foreach (Language::getLanguages(true) as $lang) {
            $tab->name[$lang['id_lang']] = $tabName;
        }

        // Set parent tab ID
        if ($tabParentName) {
            $tab->id_parent = (int) Tab::getIdFromClassName($tabParentName);
        } else {
            $tab->id_parent = 0;
        }

        if ($className == 'AdminDatafastModule') {
            $tab->icon = 'settings_applications';
        }

        // Assing module name
        $tab->module = $this->name;
        return $tab->add();
    }

    public function uninstallTab()
    {
        $moduleTabs = Tab::getCollectionFromModule($this->name);
        if (!empty($moduleTabs)) {
            foreach ($moduleTabs as $moduleTab) {
                $moduleTab->delete();
            }
        }
        return true;
    }

    public function installDb()
    {
        // Saved cc
        $db[] =  'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'customer_subs` (
            `id_customer` int(100) NOT NULL,
            `order` int(100) NOT NULL,
            `token` varchar(100) NOT NULL,
            PRIMARY KEY (`order`)
            )ENGINE=InnoDB' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8 AUTO_INCREMENT=1';


        $db[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'customer_cc_vex` (
                `id_customer` int(100) NOT NULL,
                `token` varchar(100) NOT NULL,
                PRIMARY KEY (`token`)
                )ENGINE=InnoDB' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8 AUTO_INCREMENT=1';

        $db[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'orders_datafast` (
                `id_order` int(100) NOT NULL,
                `amount` float NOT NULL,
                `transaction_id` varchar(255) NOT NULL,
                PRIMARY KEY (`id_order`)
                )ENGINE=InnoDB' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8 AUTO_INCREMENT=1';

        foreach ($db as $query) {
            if (!Db::getInstance()->execute($query)) {
                return false;
            }
        }
    }

    public function uninstallDb()
    {

        $db[] = 'DROP TABLE IF EXISTS`' . _DB_PREFIX_ . 'customer_cc_subs`';
        foreach ($db as $query) {
            if (!Db::getInstance()->execute($query)) {
                return false;
            }
        }
    }


    /**
     * Load the configuration form
     */
    public function getContent()
    {
        $this->registerHook('actionValidateOrder');
        $this->context->smarty->assign('module_dir', $this->_path);
        $output = $this->context->smarty->fetch($this->local_path . 'views/templates/admin/configure.tpl');
        /**
         * If values have been submitted in the form, process.
         */
        if (((bool)Tools::isSubmit('submitDatafastModule')) == true) {
            if ($this->postProcess()) {
                $m = $this->displayConfirmation($this->l('Your data was saved successfully')) . $output;
                return $m . $this->renderForm();
            } else {
                $m = $output . $this->displayError($this->l('At least one of the fields is incorrect, please check'));
                return $m . $this->renderForm();
            }
        }


        return $output . $this->renderForm();
    }

    /**
     * Create the form that will be displayed in the configuration of your module.
     */
    protected function renderForm()
    {
        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitDatafastModule';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            . '&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(), /* Add values for your inputs */
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );

        return $helper->generateForm(array($this->getConfigForm()));
    }

    /**
     * Create the structure of your form.
     */
    protected function getConfigForm()
    {
        $licenseCtrl = new Vex_License_Datafast($this);
        $licenseCtrl->verify();

        $image = Configuration::get('VEX_DATAFAST_IMAGE');
        $image_path = $image ? _PS_UPLOAD_DIR_ . $image : false;
        $image_url = ImageManager::thumbnail(
            $image_path,
            $this->name . "_" . Configuration::get('VEX_DATAFAST_IMAGE'),
            150,
            'jpg',
            true,
            false
        );

        $image_size = file_exists($image_path) ? filesize($image_path) / 1000 : false;
        $switch = (version_compare(_PS_VERSION_, '1.6.0', '>=') === true) ? 'switch' : 'radio';
        return array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Settings'),
                    'icon' => 'icon-cogs',
                ),
                'tabs' => array(
                    'config' => $this->l('Configuration'),
                    'debug' => $this->l('Debug'),
                ),
                'input' => array(
                    array(
                        'type' => 'select',
                        'label' => $this->l('Environment'),
                        'name' => 'VEX_DATAFAST_ENVIRONMENT',
                        'tab' => 'config',
                        'options' => array(
                            'query' => array(
                                array(
                                    'id' => 0,
                                    'name' => $this->l('Test Mode')
                                ),
                                array(
                                    'id' => 1,
                                    'name' => $this->l('Live Mode')
                                )
                            ),
                            'id' => 'id',
                            'name' => 'name',
                        )
                    ),
                    array(
                        'col' => 3,
                        'type' => 'text',
                        'tab' => 'config',
                        'prefix' => '<i class="icon icon-key"></i>',
                        'desc' => $this->l('Enter your Entity ID '),
                        'name' => 'VEX_DATAFAST_ENTITYID',
                        'label' => $this->l('Entity ID'),
                    ),
                    array(
                        'col' => 3,
                        'type' => 'text',
                        'tab' => 'config',
                        'prefix' => '<i class="icon icon-key"></i>',
                        'desc' => $this->l('Enter your commerce ID (MID) '),
                        'name' => 'VEX_DATAFAST_MID',
                        'label' => $this->l('Commerce ID (MID)'),
                    ),
                    array(
                        'col' => 3,
                        'tab' => 'config',
                        'type' => 'text',
                        'prefix' => '<i class="icon icon-key"></i>',
                        'desc' => $this->l('Enter your Terminal ID (TID) '),
                        'name' => 'VEX_DATAFAST_TID',
                        'label' => $this->l('Terminal ID'),
                    ),
                    array(
                        'col' => 3,
                        'type' => 'text',
                        'tab' => 'config',
                        'prefix' => '<i class="icon icon-key"></i>',
                        'desc' => $this->l('Enter your Bearer Token '),
                        'name' => 'VEX_DATAFAST_BEARER',
                        'label' => $this->l('Bearer Token'),
                    ),
                    array(
                        'col' => 3,
                        'tab' => 'config',
                        'type' => 'text',
                        'prefix' => '<i class="icon icon-key"></i>',
                        'desc' => $this->l('Enter your Commerce Name '),
                        'name' => 'VEX_DATAFAST_COMMERCE_NAME',
                        'label' => $this->l('Commerce Name'),
                    ),
                    array(
                        'type' => $switch,
                        'tab' => 'config',
                        'class' => 't',
                        'label' => $this->l('Save customer cards'),
                        'name' => 'VEX_DATAFAST_SAVE_CC',
                        'is_bool' => true,
                        'desc' => $this->l('Select if you want to enable pay with saved card'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->l('YES')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->l('NO')
                            )
                        ),
                    ),
                    array(
                        'type' => $switch,
                        'tab' => 'config',
                        'class' => 't',
                        'label' => $this->l('Activar pagos por subscripción'),
                        'name' => 'VEX_DATAFAST_SUBSCRIPTION',
                        'is_bool' => true,
                        'desc' => $this->l('Select if you want to enable pay with saved card'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->l('YES')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->l('NO')
                            )
                        ),
                    ),
                    // array(
                    //     'type' => 'select',
                    //     'class' => 'select-status-subs',
                    //     'tab' => 'config',
                    //     'desc' => $this->l('Estado de la orden para pago por subscripcion.'),
                    //     'label' => $this->l('Estado de subscripción'),
                    //     'name' => 'VEX_DATAFAST_SUBSCRIPTION_STATE',
                    //     'options' => array(
                    //         'query' => OrderState::getOrderStates($this->context->language->id),
                    //         'id' => 'id_order_state',
                    //         'name' => 'name'
                    //     )
                    // ),
                    array(
                        'type' => 'select',
                        'tab' => 'config',
                        'desc' => $this->l('Order state after payment rejected'),
                        'label' => $this->l('Payment Rejected status'),
                        'name' => 'VEX_DATAFAST_REJECTED_STATE',
                        'options' => array(
                            'query' => OrderState::getOrderStates($this->context->language->id),
                            'id' => 'id_order_state',
                            'name' => 'name'
                        )
                    ),
                    array(
                        'type' => 'select',
                        'tab' => 'config',
                        'desc' => $this->l('Order state after payment aproved'),
                        'label' => $this->l('Payment Aproved status'),
                        'name' => 'VEX_DATAFAST_APROVED_STATE',
                        'options' => array(
                            'query' => OrderState::getOrderStates($this->context->language->id),
                            'id' => 'id_order_state',
                            'name' => 'name'
                        )
                    ),
                    array(
                        'type' => 'select',
                        'tab' => 'config',
                        'desc' => $this->l('Tipo de formulario de pago.'),
                        'label' => $this->l('Formulario de pago.'),
                        'name' => 'VEX_DATAFAST_FORM',
                        'options' => array(
                            'query' => array(
                                array(
                                    'id' => 1,
                                    'name' => 'Modal'
                                ),
                                array(
                                    'id' => 2,
                                    'name' => 'Redireccionar'
                                )
                            ),
                            'id' => 'id',
                            'name' => 'name'
                        )
                    ),
                    array(
                        'type' => 'text',
                        'tab' => 'config',
                        'label' => $this->l('Enter payment title'),
                        'desc' => $this->l('Enter the payment title that will be shown to customers'),
                        'name' => 'VEX_DATAFAST_TITLE'
                    ),
                    array(
                        'type' => 'file',
                        'tab' => 'config',
                        'label' => $this->l('Upload an image'),
                        'desc' => $this->l('Upload an image that will be displayed next to the title of the payment method'),
                        'name' => 'VEX_DATAFAST_IMAGE',
                        'display_image' => true,
                        'image' => $image_url ? $image_url : false,
                        'file' => empty($image) ? $image : null,
                        'size' => $image_size
                    ),
                    array(
                        'type' => $switch,
                        'tab' => 'config',
                        'class' => 't',
                        'label' => $this->l('Delete image'),
                        'name' => 'VEX_DATAFAST_DELETE',
                        'is_bool' => true,
                        'desc' => $this->l('Select if you want to delete uploaded image'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->l('YES')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->l('NO')
                            )
                        ),
                    ),
                    array(
                        'type' => 'textarea',
                        'tab' => 'config',
                        'label' => $this->l('Payment instructions'),
                        'desc' => $this->l('Enter payment instructions'),
                        'name' => 'VEX_DATAFAST_INFO_MESSAGE',
                        ''
                    ),
                    // array(
                    //     'type' => $switch,
                    //     'tab' => 'config',
                    //     'class' => 't',
                    //     'label' => $this->l('Allow deferred payments'),
                    //     'name' => 'VEX_DATAFAST_DIFERRED',
                    //     'is_bool' => true,
                    //     'desc' => $this->l('Select if you want to allow deferred payments'),
                    //     'values' => array(
                    //         array(
                    //             'id' => 'active_on',
                    //             'value' => 1,
                    //             'label' => $this->l('YES')
                    //         ),
                    //         array(
                    //             'id' => 'active_off',
                    //             'value' => 0,
                    //             'label' => $this->l('NO')
                    //         )
                    //     ),
                    // ),
                    // array(
                    //     'type' => $switch,
                    //     'tab' => 'config',
                    //     'class' => 't',
                    //     'label' => $this->l('Allow interest'),
                    //     'name' => 'VEX_DATAFAST_INTEREST',
                    //     'is_bool' => true,
                    //     'desc' => $this->l('Select if you want to allow interest'),
                    //     'values' => array(
                    //         array(
                    //             'id' => 'active_on',
                    //             'value' => 1,
                    //             'label' => $this->l('YES')
                    //         ),
                    //         array(
                    //             'id' => 'active_off',
                    //             'value' => 0,
                    //             'label' => $this->l('NO')
                    //         )
                    //     ),
                    // ),
                    // array(
                    //     'type' => $switch,
                    //     'tab' => 'config',
                    //     'class' => 't',
                    //     'label' => $this->l('Allow grace'),
                    //     'name' => 'VEX_DATAFAST_GRACE',
                    //     'is_bool' => true,
                    //     'desc' => $this->l('Select if you want to allow grace'),
                    //     'values' => array(
                    //         array(
                    //             'id' => 'active_on',
                    //             'value' => 1,
                    //             'label' => $this->l('YES')
                    //         ),
                    //         array(
                    //             'id' => 'active_off',
                    //             'value' => 0,
                    //             'label' => $this->l('NO')
                    //         )
                    //     ),
                    // ),
                    array(
                        'type' => $switch,
                        'tab' => 'debug',
                        'class' => 't',
                        'label' => $this->l('Debug mode'),
                        'name' => 'VEX_DATAFAST_DEBUG',
                        'is_bool' => true,
                        'desc' => $this->l('Log traces such as API requests'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Enabled')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('Disabled')
                            )
                        ),
                    ),
                    array(
                        'type' => $switch,
                        'tab' => 'debug',
                        'label' => $this->l('Clear Log File'),
                        'name' => 'VEX_DATAFAST_CLEAR_LOG',
                        'is_bool' => true,
                        'class' => 't',
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->l('Yes')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->l('No')
                            )
                        ),
                        'desc' => $this->l('Select "yes" and click Save to clear the log file.')
                    ),
                    array(
                        'tab' => 'debug',
                        'type' => 'textarea',
                        'label' => $this->trans('Log'),
                        'name' => 'VEX_DATAFAST_LOG',
                        'cols' => 40,
                        'rows' => 10,
                        'style' => 'height: 90px'
                    )
                ),

                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }

    /**
     * Set values for the inputs.
     */
    protected function getConfigFormValues()
    {
        return array(
            'VEX_DATAFAST_ENVIRONMENT' => Configuration::get('VEX_DATAFAST_ENVIRONMENT'),
            'VEX_DATAFAST_ENTITYID' => Configuration::get('VEX_DATAFAST_ENTITYID'),
            'VEX_DATAFAST_MID' => Configuration::get('VEX_DATAFAST_MID'),
            'VEX_DATAFAST_TID' => Configuration::get('VEX_DATAFAST_TID'),
            'VEX_DATAFAST_BEARER' => Configuration::get('VEX_DATAFAST_BEARER'),
            'VEX_DATAFAST_COMMERCE_NAME' => Configuration::get('VEX_DATAFAST_COMMERCE_NAME'),
            'VEX_DATAFAST_SAVE_CC' => Configuration::get('VEX_DATAFAST_SAVE_CC'),
            'VEX_DATAFAST_DIFERRED' => Configuration::get('VEX_DATAFAST_DIFERRED'),
            'VEX_DATAFAST_INTEREST' => Configuration::get('VEX_DATAFAST_INTEREST'),
            'VEX_DATAFAST_GRACE' => Configuration::get('VEX_DATAFAST_GRACE'),
            'VEX_DATAFAST_REJECTED_STATE' => Configuration::get('VEX_DATAFAST_REJECTED_STATE'),
            'VEX_DATAFAST_APROVED_STATE' => Configuration::get('VEX_DATAFAST_APROVED_STATE'),
            'VEX_DATAFAST_TITLE' => Configuration::get('VEX_DATAFAST_TITLE'),
            'VEX_DATAFAST_IMAGE' => Configuration::get('VEX_DATAFAST_IMAGE'),
            'VEX_DATAFAST_DELETE' => Configuration::get('VEX_DATAFAST_DELETE'),
            'VEX_DATAFAST_INFO_MESSAGE' => Configuration::get('VEX_DATAFAST_INFO_MESSAGE'),
            'VEX_DATAFAST_DEBUG' => Configuration::get('VEX_DATAFAST_DEBUG'),
            'VEX_DATAFAST_LOG_FILE' => Configuration::get('VEX_DATAFAST_LOG_FILE'),
            'VEX_DATAFAST_CLEAR_LOG' => Configuration::get('VEX_DATAFAST_CLEAR_LOG'),
            'VEX_DATAFAST_FORM' => Configuration::get('VEX_DATAFAST_FORM'),
            'VEX_DATAFAST_SUBSCRIPTION_STATE' => Configuration::get('VEX_DATAFAST_SUBSCRIPTION_STATE'),
            'VEX_DATAFAST_SUBSCRIPTION' => Configuration::get('VEX_DATAFAST_SUBSCRIPTION'),
            'VEX_DATAFAST_LOG' => $this->getLog(),
            'VEX_LICENSE' => Configuration::get('VEX_LICENSE')
        );
    }

    /**
     * Save form data.
     */
    protected function postProcess()
    {
        $form_values = $this->getConfigFormValues();
        unset($form_values['VEX_DATAFAST_LOG']);

        $all_values = true;


        if (Tools::getValue('VEX_DATAFAST_DELETE') == '1') {
            Configuration::updateValue('VEX_DATAFAST_IMAGE', '');
            unset($form_values['VEX_DATAFAST_DELETE']);
            unset($form_values['VEX_DATAFAST_IMAGE']);
        }

        if (!$this->upload_image()) {
            unset($form_values['VEX_DATAFAST_IMAGE']);
        }

        foreach (array_keys($form_values) as $key) {
            Configuration::updateValue($key, Tools::getValue($key), true);
        }

        if (Tools::getValue('VEX_DATAFAST_CLEAR_LOG') == '1') {
            Configuration::updateValue('VEX_DATAFAST_CLEAR_LOG', '0');
            $file = $this->log_file;
            file_put_contents($file, "");
        }

        return $all_values;
    }

    /**
     * Add the CSS & JavaScript files you want to be loaded in the BO.
     */
    public function hookBackOfficeHeader()
    {
        $this->context->controller->addJS($this->_path . 'views/js/back.6.js');
        $this->context->controller->addCSS($this->_path . 'views/css/back.css');
    }


    /**
     * Add the CSS & JavaScript files you want to be added on the FO.
     */
    public function hookHeader()
    {
        $this->context->controller->addJS($this->_path . '/views/js/front.js');
        $this->context->controller->addCSS($this->_path . '/views/css/front.css');
    }

    // public function hookActionValidateOrder($params)
    // {
    //     return
    // }


    /**
     * Show payment options in version 1.7
     *
     * @param $params
     * @return array|string|mixed
     */
    public function hookPaymentOptions($params)
    {

        // if (!$this->canBeUsed($params)) {
        //     $this->log("Module can be used");
        //     return false;
        // }

        $this->context->smarty->assign([
            'message' => (Configuration::get('VEX_DATAFAST_INFO_MESSAGE')),
        ]);

        $module = $this->context->smarty->fetch('module:' . $this->name . '/views/templates/front/ps17/payment_infos.tpl');
        $title = empty(Configuration::get('VEX_DATAFAST_TITLE')) ? $this->l('Pay with Datafast') : Configuration::get('VEX_DATAFAST_TITLE');
        $externalOption = new PrestaShop\PrestaShop\Core\Payment\PaymentOption();
        $externalOption->setCallToActionText($title)
            ->setAdditionalInformation($module)
            ->setLogo(empty(Configuration::get('VEX_DATAFAST_IMAGE')) ? '' : 'upload/' . Configuration::get('VEX_DATAFAST_IMAGE'));
        if (Configuration::get('VEX_DATAFAST_FORM') == '1') {
            $externalOption->setForm($this->generateForm());
        } else {
            $externalOption->setAction($this->context->link->getModuleLink($this->name, 'redirect', array(), true));
        }

        return array($externalOption);
    }

    protected function generateForm()
    {
        $postAction = Context::getContext()->link->getModuleLink('datafast', 'callback', ['cart_id' => $this->context->cart->id]);
        $tasas = Configuration::get('DATAFAST_INTERES', false);
        $data_smar = [];

        if ($tasas) {
            $tasas = json_decode($tasas, true);
            $data_smar['tasas'] = $tasas;
            $data_smar['banck1'] = reset($tasas);
        }
        $hasSubProd = true;


        foreach ($this->context->cart->getProducts() as $productData) {
            $idProduct = $productData['id_product'];
            if (!Datafast_request::checkIfSubscriptionProduct($idProduct)) {
                $hasSubProd = false;
            }
        }

        $data_smar['action'] = $postAction;
        $data_smar['hasSubProd'] = $hasSubProd;
        $data_smar['save_cc'] = Configuration::get('VEX_DATAFAST_SAVE_CC');
        $data_smar['subscription'] = Configuration::get('VEX_DATAFAST_SUBSCRIPTION');

        $this->context->smarty->assign($data_smar);

        $this->context->controller->registerJavascript(
            'jQuery',
            "https://code.jquery.com/jquery-3.5.1.min.js",
            [
                'priority' => 201,
                'position' => 'head',
                'server' => 'remote'
            ]
        );

        return $this->context->smarty->fetch('module:datafast/views/templates/front/ps17/formulario.tpl');
    }

    private function canBeUsed($params)
    {
        if (!$this->active) {
            return false;
        }

        $currency = new Currency($params['cart']->id_currency);
        $currency->iso_code;

        //        if (in_array($currency->iso_code, $this->limited_currencies) == false) {
        //            $this->log("Module cant be used in this country {$currency->iso_code}");
        //            return false;
        //        }

        $license = Configuration::get('VEX_LICENSE', null, null, null, '');
        $activated = Configuration::get('VEX_ACTIVATED', null, null, null, '0');

        // validate license
        if (empty($license) || !$activated) {
            $this->log("Module hasnt a valid license");
            return false;
        }

        if (
            empty(Configuration::get('VEX_DATAFAST_ENTITYID'))
            || empty(Configuration::get('VEX_DATAFAST_MID'))
            || empty(Configuration::get('VEX_DATAFAST_TID'))
            || empty(Configuration::get('VEX_DATAFAST_BEARER'))
            || empty(Configuration::get('VEX_DATAFAST_COMMERCE_NAME'))
        ) {
            $this->log("Entity ID, MID, TID, Bearer Token and Commerce name are requiered values");
            return false;
        }

        return true;
    }

    /**
     * save log file
     *
     * @param $string
     */
    public function log($string)
    {
        if ($this->debug_mode) {
            file_put_contents($this->log_file, date('Y-m-d H:i:s') . " - " . $string . "\n", FILE_APPEND | LOCK_EX);
        }
    }

    public function getLog()
    {
        return file_get_contents($this->log_file);
    }

    private function upload_image()
    {
        if (isset($_FILES['VEX_DATAFAST_IMAGE']) && !empty($_FILES['VEX_DATAFAST_IMAGE']["tmp_name"])) {
            $target_dir = _PS_UPLOAD_DIR_;
            $target_file = $target_dir . basename($_FILES['VEX_DATAFAST_IMAGE']["name"]);
            $imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);

            $check = getimagesize($_FILES['VEX_DATAFAST_IMAGE']["tmp_name"]);
            if ($check === false) {
                return false;
            }

            if (file_exists($target_file)) {
                unlink($target_file);
            }

            if (
                $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
                && $imageFileType != "gif"
            ) {
                return false;
            }

            if (move_uploaded_file($_FILES['VEX_DATAFAST_IMAGE']["tmp_name"], $target_file)) {
                Configuration::updateValue('VEX_DATAFAST_IMAGE', basename($_FILES['VEX_DATAFAST_IMAGE']["name"]));
                return true;
            }
        }
        return false;
    }
}
