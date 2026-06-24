/**
 * 2007-2020 PrestaShop
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
 *  @copyright 2007-2020 PrestaShop SA
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 *
 * Don't forget to prefix your containers with your own identifier
 * to avoid any conflicts with others containers.
 */

$("#payment-form-datafast").on("submit", (e) => {

    e.preventDefault();
    let url = 'index.php?fc=module&module=datafast&controller=ajax';
    $.ajax({
        url: url,
        dataType: 'json',
        type: 'POST',
        data: {
            action: "getToken"
        },
        success: function(rest) {
            console.log(rest);
            if (!rest.errors) {
                let script = document.createElement('script');
                script.type = 'text/javascript';
                script.src = rest.url;
                document.head.appendChild(script);
                setTimeout(() => {
                    $("select[name='paymentBrand']").css("appearance", "none");
                    $("#bank").trigger("change");
                    $(".modal-content form").css("background-color", "#e8e8e8");
                    $(".modal-content form button").css("width", "80%");
                    $(".modal-content form button").css("border-radius", ".8rem");
                    $(".modal-content form button").css("margin-right", "35px");
                    $(".modal-content form button").css("margin-top", "10px");
                }, 2000);

                if (typeof bootstrap !== 'undefined') {
                    const modalDatafast = new bootstrap.Modal('#dataFormDatafast');
                    modalDatafast.show();
                } else {
                    $("#dataFormDatafast").modal({
                        show: true,
                    });
                }

            } else {
                alert(rest.errors);
            }

        },
        error: function(e) {
            console.log(e);
        }

    });
    $('#dataFormDatafast').on('hidden.bs.modal', function(e) {
        // do something...
        location.reload();
    })


    if (prestashop.page.page_name == "checkout") {


    }


});