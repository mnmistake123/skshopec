<style>
    .wpwl-registration {
        width: 100% !important;
    }

    select {
        background-image: initial !important;
        appearance: none !important;

    }

    .wpwl-wrapper-brand {
        padding-right: 15px;
    }

    .wpwl-form-card {
        background-color: black !important;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
</script>

<div class="modal fade" style="background-color: rgba(0, 0, 0, 0.8);" id="dataFormDatafast" tabindex="-1" role="dialog"
    aria-labelledby="dataFormDatafast" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="background: transparent;">
        <div class="modal-content" style="background: border-box;">
            <div class="modal-body">
                <form action="{$action}" id="payment-form-datafast" class="paymentWidgets"
                    data-brands="VISA MASTER AMEX DINERS DISCOVER">
                </form>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="
                position: absolute;
                top: 0;
                right: 10%;
                font-size: 60px;
                color: #FFF;
                opacity: 0.9;
            ">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    var wpwlOptions = {
        onReady: function() {
            {if $tasas}
                var banks =
                    '<div class="wpwl-label wpwl-label-custom" >Banco:</div>' +
                    '<div class="wpwl-wrapper wpwl-wrapper-custom">' +
                    '<select id="bank" name="" style="width: 60%; border-radius: .3rem; padding: 5px; appearance: none;  margin-bottom: 4px;" onchange=getNewValBanck(this.value);>' +
                    {foreach from=$tasas item=item key=key name=name}
                        '<option value="{l s=$key}">{l s=$key}</option>'+
                    {/foreach}

                    '</select>' +
                    '</div>';
                $('form.wpwl-form-card').find('.wpwl-button').before(banks);

                var frecuente =
                    '<div class="wpwl-label wpwl-label-custom">Intereses:</div>' +
                    '<div class="wpwl-wrapper wpwl-wrapper-custom" >' +
                    '<select id="interes" name="customParameters[SHOPPER_TIPOCREDITO]" onchange=getNewVal(this.options[this.selectedIndex]); style="width: 60%; border-radius: .3rem; padding: 5px; appearance: none;  margin-bottom: 4px;"">' +
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
                    '<div class="wpwl-label wpwl-label-custom" >Diferidos:</div>' +
                    '<div class="wpwl-wrapper wpwl-wrapper-custom" >' +
                    '<select id="diferido" name="recurring.numberOfInstallments" style="width: 60%; border-radius: .3rem; padding: 5px; appearance: none;  margin-bottom: 4px;"">' +
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
                jQuery(".wpwl-button-pay").addClass("wpwl-button-error").attr("disabled",
                    "disabled");
                return false;
            } else {
                return true;
            }
        }
    }


    let datos = '{$tasas|json_encode}';
    diferidos = JSON.parse(datos.replace(/&quot;/g, '"'));

    function getNewValBanck(banck) {
        jQuery("#interes").empty();
        jQuery("#diferido").empty();
        if (diferidos[banck].hasOwnProperty('sin_interes')) {

            jQuery("#interes").append('<option value="00">Sin intereses</option>');
        }

        if (diferidos[banck].hasOwnProperty('diferidos_c')) {
            jQuery("#interes").append(
                '<option data-type="diferidos_c" value="01">Diferido corriente</option>');

        }

        if (diferidos[banck].hasOwnProperty('diferidos_cc')) {
            jQuery("#interes").append(
                '<option data-type="diferidos_cc" value="02">Diferido con Interés</option>');

        }

        if (diferidos[banck].hasOwnProperty('diferidos_sc')) {
            jQuery("#interes").append(
                '<option data-type="diferidos_sc" value="03">Diferido sin Interés</option>');

        }

        if (diferidos[banck].hasOwnProperty('sin_interes')) {
            jQuery("#diferido").append('<option value="0">Corriente</option>');


        } else if (diferidos[banck].hasOwnProperty('diferidos_c')) {
            diferidos[banck].diferidos_c.forEach((dia) => {
                jQuery("#diferido").append('<option  value="' + dia + '">' + dia +
                    ' Meses</option>');
            })
        } else if (diferidos[banck].hasOwnProperty('diferidos_cc')) {
            diferidos[banck].diferidos_cc.forEach((dia) => {
                jQuery("#diferido").append('<option  value="' + dia + '">' + dia +
                    ' Meses</option>');
            })
        } else if (diferidos[banck].hasOwnProperty('diferidos_sc')) {
            diferidos[banck].diferidos_sc.forEach((dia) => {
                jQuery("#diferido").append('<option  value="' + dia + '">' + dia +
                    ' Meses</option>');
            })
        }

    }

    function getNewVal(data) {
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