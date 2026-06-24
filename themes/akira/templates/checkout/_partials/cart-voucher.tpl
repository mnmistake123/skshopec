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
{if $cart.vouchers.allowed}
  {block name='cart_voucher'}
      <div class="block-promo cart-voucher js-cart-voucher">
        {if $cart.vouchers.added}
          {block name='cart_voucher_list'}
            <ul class="promo-name">
              {foreach from=$cart.vouchers.added item=voucher}
                <li class="cart-summary-line">
                  <span class="label">{$voucher.name}</span>
					{if isset($voucher.code) && $voucher.code !== ''}
					  <a href="{$voucher.delete_url}" data-link-action="remove-voucher">
						  <i class="las la-times-circle"></i>
					  </a>
					{/if}
                  <div class="float-xs-right">
                    {$voucher.reduction_formatted}
                  </div>
                </li>
              {/foreach}
            </ul>
          {/block}
        {/if}
		  
        <div class="promo-code" id="promo-code">
          {block name='cart_voucher_form'}
            <form action="{$urls.pages.cart}" data-link-action="add-voucher" method="post">
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="addDiscount" value="1">
              <input class="promo-input form-control" type="text" name="discount_name" placeholder="{l s='Have a promo code?' d='Shop.Theme.Checkout'}">
              <button type="submit" class="btn btn-primary-r"><span>{l s='Add' d='Shop.Theme.Actions'}</span></button>
            </form>
          {/block}

          {block name='cart_voucher_notifications'}
            <div class="alert alert-danger js-error" role="alert">
              <i class="las la-exclamation-circle"></i><span class="js-error-text"></span>
            </div>
          {/block}
        </div>

        {if $cart.discounts|count > 0}
          <p class="block-promo promo-highlighted">
            {l s='Take advantage of our exclusive offers:' d='Shop.Theme.Actions'}
          </p>
          <ul class="js-discount card-block promo-discounts">
          {foreach from=$cart.discounts item=discount}
            <li class="cart-summary-line">
              <span class="label"><span class="code">{$discount.code}</span> - {$discount.name}</span>
            </li>
          {/foreach}
          </ul>
        {/if}
      </div>
  {/block}
{/if}
