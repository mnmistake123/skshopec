{extends file='page.tpl'}
{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation" class="card">
        <div class="card-block">
            <div class="row">
                <div class="col-md-12">

                    <h3 class="h1 card-title">
                        {l s='Pagar Orden' mod='vex_credomatic'}
                    </h3>

                    <p>
                        {l s='Ha elegido pagar con Datafast' mod='vex_credomatic'}
                    </p>

                </div>
            </div>
        </div>
    </section>
{/block}

{block name='content'}

    {if $errors|count}
        {* {if false} *}
            <div class="help-block">
                {block name='form_errors'}
                    <ul>
                        {foreach $errors as $error}
                            <li class="alert alert-danger">{$error|nl2br nofilter}</li>
                        {/foreach}
                    </ul>
                {/block}
            </div>
        {else}
            <div class="content-form">
                <form action="{$url}" class="paymentWidgets" data-brands="VISA MASTER AMEX DINERS DISCOVER"></form>

                <div class="row content-data" style="">
                    <div class="col-md-9">
                        <div class="alert alert-primary" role="alert"
                            style="width: 91%; font-size: 1.2rem;font-weight: bold;text-align: center;">
                            A PAGAR
                        </div>
                        <div class="definition-list">


                            <dl>
                                {* <dt>{l s='Metodo de Pago' mod='vex_credomatic'}</dt>
                        <dd>{$paymentMethod nofilter}</dd> *}
                                <dt>{l s='SubTotal' mod='vex_credomatic'}</dt>
                                <dd>{$subtotal}</dd>
                                <dt>{l s='Impuestos' mod='vex_credomatic'}</dt>
                                <dd>{$tax_amount nofilter}</dd>
                                {* <dt>{l s='Gastos de envío' mod='vex_credomatic'}</dt>
                                <dd>{$shipping_cost nofilter}</dd> *}
                                <dt>{l s='Total a pagar' mod='vex_credomatic'}</dt>
                                <dd>{$displayTotal}</dd>

                            </dl>
                        </div>
                        <a type="button" href="{$url_check}" style=" width: 91%;" class="btn btn-primary btn-block btn-lg">
                            REGRESAR AL CHECKOUT
                        </a>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                var wpwlOptions = {
                    onReady: function() {
                        {if isset($tasas)}
                            var banks =
                                '<div class="wpwl-label wpwl-label-custom" style="display:inline-block; width: 20%;">Banco:</div>' +
                                '<div class="wpwl-wrapper wpwl-wrapper-custom" style="display:inline-block; width: 80%;">' +
                                '<select id="bank" name="" style="width: 100%; margin-bottom: 4px;" onchange=getNewValBanck(this.value);>' +
                                {foreach from=$tasas item=item key=key name=name}
                                    '<option value="{l s=$key}">{l s=$key}</option>'+
                                {/foreach}

                                '</select>' +
                                '</div>';
                            $('form.wpwl-form-card').find('.wpwl-button').before(banks);

                            var frecuente =
                                '<div class="wpwl-label wpwl-label-custom" style="display:inline-block;  width: 20%;">Intereses:</div>' +
                                '<div class="wpwl-wrapper wpwl-wrapper-custom" style="display:inline-block; width: 80%;">' +
                                '<select id="interes" name="customParameters[SHOPPER_TIPOCREDITO]" onchange=getNewVal(this.options[this.selectedIndex]); style="margin-bottom: 4px; width: 100%;">' +
                                {foreach from=$banck1 item=item key=key}
                                    {if $key == 'sin_interes'}    '<option data-type="0" value="00">Sin intereses</option>'+{/if} 
                                    {if $key == 'diferidos_c'}   '<option data-type="diferidos_c" value="01">Diferido corriente</option>'+{/if} 
                                    {if $key == 'diferidos_cc'}  '<option data-type="diferidos_cc" value="02">Diferido con Interés</option>'+{/if} 
                                    {if $key == 'diferidos_sc'}  '<option data-type="diferidos_sc" value="03">Diferido sin Interés</option>'+{/if} 
                                {/foreach}
                                '</select>' +
                                '</div>';
                            jQuery('form.wpwl-form-card').find('.wpwl-button').before(frecuente);
                            var numberOfInstallmentsHtml =
                                '<div class="wpwl-label wpwl-label-custom" style="display:inline-block; width: 20%;">Diferidos:</div>' +
                                '<div class="wpwl-wrapper wpwl-wrapper-custom" style="display:inline-block;  width: 80%;">' +
                                '<select id="diferido" name="recurring.numberOfInstallments" style="margin-bottom: 4px; width: 100%;">' +
                                {if $banck1['sin_interes']}
                                    '<option value="0">Corriente</option>'
                            {else if $banck1['diferidos_c']}
                                {foreach $banck1['diferidos_c'] as $dc}
                                    '<option value="$dc">{l s=$dc} Meses</option>'+
                                {/foreach}
                            {else if $banck1['diferidos_cc']}
                                {foreach $banck1['diferidos_cc'] as $dcc}
                                    '<option value="$dcc">{l s=$dcc} Meses</option>'+
                                {/foreach}
                            {else if $banck1['diferidos_sc']}
                                {foreach $banck1['diferidos_sc'] as $dsc}
                                    '<option value="$dsc">{l s=$dsc} Meses</option>'+
                                {/foreach}
                            {/if}
                            '</select>' +
                            '</div>';
                            jQuery('form.wpwl-form-card').find('.wpwl-button').before(numberOfInstallmentsHtml);
                        {/if}

                        {if $subscription}
                            {if $hasSubProd}
                                var createRegistrationHtml =
                                    '<div class="customInput" style="display: none;"><input checked type="checkbox" name="createRegistration"/></div>';
                                $('form.wpwl-form-card').find('.wpwl-button').before(createRegistrationHtml);
                            {else if $save_cc}
                                var createRegistrationHtml =
                                    '<div class="customLabel" style="padding-top: 20px;">Desea guardar de manera segura sus datos?</div>' +
                                    '<div class="customInput"><input type="checkbox" name="createRegistration"/></div>';
                                $('form.wpwl-form-card').find('.wpwl-button').before(createRegistrationHtml);
                            {/if}

                        {else if $save_cc}
                            var createRegistrationHtml =
                                '<div class="customLabel" style="padding-top: 20px;">Desea guardar de manera segura sus datos?</div>' +
                                '<div class="customInput"><input type="checkbox" name="createRegistration"/></div>';
                            $('form.wpwl-form-card').find('.wpwl-button').before(createRegistrationHtml);
                        {/if}

                        var dfast =
                            '<br/><br/><img src="https://www.datafast.com.ec/images/verified.png" style="display:block;margin:0 auto; width:100%;">';

                        jQuery("form.wpwl-form-card").find(".wpwl-button").before(dfast);

                    },
                    registrations: {
                        requiereCvv: true,
                        hideInitialPaymentForms: true
                    },
                    style: "card",
                    locale: "es",
                    labels: { cvv: "CVV", cardHolder: "Nombre (Igual que en la tarjeta)" },
                    onBeforeSubmitCard: function() {
                        if (jQuery(".wpwl-control-cardHolder").val() === "") {
                            jQuery(".wpwl-control-cardHolder").addClass("wpwl-has-error");
                            jQuery(".wpwl-control-cardHolder").after(
                                "<div class='wpwl-hint-cardHolderError'>Campo Requerido</div>");
                            jQuery(".wpwl-button-pay").addClass("wpwl-button-error").attr("disabled", "disabled");
                            return false;
                        } else {
                            return true;
                        }
                    }
                }
            </script>

            <script>
                let datos = '{$tasas|json_encode}';
                var diferidos = JSON.parse(datos.replace(/&quot;/g, '"'));

                function getNewValBanck(banck) {
                    jQuery("#interes").empty();
                    jQuery("#diferido").empty();
                    if (diferidos[banck].hasOwnProperty('sin_interes')) {

                        jQuery("#interes").append('<option value="00">Sin intereses</option>');
                    }

                    if (diferidos[banck].hasOwnProperty('diferidos_c')) {
                        jQuery("#interes").append('<option data-type="diferidos_c" value="01">Diferido corriente</option>');

                    }

                    if (diferidos[banck].hasOwnProperty('diferidos_cc')) {
                        jQuery("#interes").append('<option data-type="diferidos_cc" value="02">Diferido con Interés</option>');

                    }

                    if (diferidos[banck].hasOwnProperty('diferidos_sc')) {
                        jQuery("#interes").append('<option data-type="diferidos_sc" value="03">Diferido sin Interés</option>');

                    }

                    if (diferidos[banck].hasOwnProperty('sin_interes')) {
                        jQuery("#diferido").append('<option value="0">Corriente</option>');


                    } else if (diferidos[banck].hasOwnProperty('diferidos_c')) {
                        diferidos[banck].diferidos_c.forEach((dia) => {
                            jQuery("#diferido").append('<option  value="' + dia + '">' + dia + ' Meses</option>');
                        })
                    } else if (diferidos[banck].hasOwnProperty('diferidos_cc')) {
                        diferidos[banck].diferidos_cc.forEach((dia) => {
                            jQuery("#diferido").append('<option  value="' + dia + '">' + dia + ' Meses</option>');
                        })
                    } else if (diferidos[banck].hasOwnProperty('diferidos_sc')) {
                        diferidos[banck].diferidos_sc.forEach((dia) => {
                            jQuery("#diferido").append('<option  value="' + dia + '">' + dia + ' Meses</option>');
                        })
                    }

                }

                function getNewVal(data) {
                    diferidos = JSON.parse(datos.replace(/&quot;/g, '"'));
                    if (data.value == '00') {
                        jQuery("#diferido").empty();
                        jQuery("#diferido").append('<option value="0">Corriente</option>');
                    } else {
                        jQuery("#diferido").empty();
                        let banck = jQuery("#bank").val();
                        let type = data.dataset.type;
                        console.log(type)
                        console.log(diferidos[banck][type]);

                        diferidos[banck][type].forEach((dia) => {
                            let data = '<option value="' + dia + '">' + dia + ' Meses</option>';
                            jQuery("#diferido").append(data);

                        })

                    }

                }
            </script>
            <style>
                .wpwl-registration {
                    width: 100% !important;
                }

                .content-form {
                    display: flex;
                    justify-content: flex-end;
                }

                .content-data {
                    margin-left: 10%;
                    width: 45%;
                }

                .wpwl-button-pay {
                    float: none;
                    margin-left: auto;
                    margin-right: auto;
                    display: block;
                    margin-top: 20px;
                    width: 80%;
                    border-radius: 20px;
                    text-transform: uppercase;
                }

                .wpwl-brand-card {
                    float: right;
                    margin-left: -20px;
                }

                .form-control-select,
                select {
                    border-color: #ccc;
                    border-radius: 4px;
                    height: 34px;
                    background: white;
                }

                .wpwl-form-card {
                    background-color: #e8e8e8;
                }

                .wpwl-control {
                    height: 34px;
                }

                .wpwl-label-brand,
                .wpwl-wrapper-brand,
                .wpwl-wrapper-registration-registrationId,
                .wpwl-wrapper-registration-brand,
                .wpwl-wrapper-registration-number,
                .wpwl-wrapper-registration-expiry {
                    padding-right: 10px;
                }

                select {
                    background-image: initial !important;
                }

                @media(max-width: 780px) {
                    .content-form {
                        display: block;
                    }

                    .content-data {
                        margin: unset;
                        margin: auto;
                        width: 100%;
                        margin-left: 15px;
                        margin-top: 20px;
                    }
                }
            </style>
        {/if}
    {/block}