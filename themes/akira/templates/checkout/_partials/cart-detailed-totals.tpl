{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='cart_detailed_totals'}
<div class="cart-detailed-totals js-cart-detailed-totals">
  <div class="cart-detailed-subtotals js-cart-detailed-subtotals">  
    <h2>{l s='Cart totals' d='Shop.Theme.Axon'}</h2>
    
    {***{if null !== $cart.products}
        {$axps_weight_type = 'axps_weight'}
        {$axps_weight_label = {l s='Weight' d='Shop.Theme.Axon'}}
        {$axps_weight_amount = 0}
        {foreach from=$cart.products item="product"}
            {if !isset($product.weight_attribute) || null === $product.weight_attribute}
                {$axps_weight_amount = $axps_weight_amount + $product.weight * $product.cart_quantity}
            {else}
                {$axps_weight_amount = $axps_weight_amount + $product.weight_attribute * $product.cart_quantity}
            {/if}
        {/foreach}

        {$axps_weight_value = "{$axps_weight_amount|string_format:"%.2f"|replace:'.':'.'} {Configuration::get("PS_WEIGHT_UNIT")}"}

        {if $axps_weight_amount}
            {$cart.subtotals.axps_weight.type = $axps_weight_type}
            {$cart.subtotals.axps_weight.label = $axps_weight_label}
            {$cart.subtotals.axps_weight.value = $axps_weight_value}
        {/if}
    {/if}***}
    
    {foreach from=$cart.subtotals item="subtotal"}
        {if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax'}
        <div class="cart-summary-line" id="cart-subtotal-{$subtotal.type}">
        <span class="label{if 'products' === $subtotal.type} js-subtotal{/if}">
            {if 'products' == $subtotal.type}
            {$cart.summary_string}
            {else}
            {$subtotal.label}
            {/if}
        </span>
        <span class="value">
            {if 'discount' == $subtotal.type}- {/if}{$subtotal.value}
        </span>
        {if $subtotal.type === 'shipping'}
            <div><small class="value">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
        {/if}
        </div>
        {/if}
    {/foreach}
  </div>
  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}

</div>
{/block}
