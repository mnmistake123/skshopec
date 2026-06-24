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
{block name='cart_detailed_product'}
  <div class="cart-overview js-cart" data-refresh-url="{url entity='cart' params=['ajax' => true, 'action' => 'refresh']}">
    {if $cart.products}
		<table class="shop_table shop_table_responsive" cellspacing="0">
			<thead>
				<tr>
					<th class="product-remove"></th>
					<th class="product-thumbnail"></th>
					<th class="product-name">{l s='Product' d='Shop.Theme.Axon'}</th>
					<th class="product-c-price">{l s='Price' d='Shop.Theme.Axon'}</th>
					<th class="product-quantity">{l s='Quantity' d='Shop.Theme.Axon'}</th>
					<th class="product-subtotal">{l s='Subtotal' d='Shop.Theme.Axon'}</th>
				</tr>
			</thead>
			<tbody>
				{foreach from=$cart.products item=product}
					<tr class="cart-item">
						{block name='cart_detailed_product_line'}
							{include file='checkout/_partials/cart-detailed-product-line.tpl' product=$product}
						{/block}
					</tr>
				{/foreach}
			</tbody>
		</table>
		<a href="{$urls.pages.index}" class="btn btn-secondary hidden-md-down">
			<i class="las la-reply"></i>
			{l s='Continue shopping' d='Shop.Theme.Actions'}
		</a>
        {if Module::isEnabled('nrtshoppingcart')}
            <br class="hidden-lg-up"/>
            <a href="javascript:void(0)" class="btn btn-secondary hidden-lg-up btn-full" data-link-action="delete-all-cart">
                <i class="las la-times-circle"></i>
                {l s='Empty cart' d='Shop.Theme.Axon'}
            </a>
            <a href="javascript:void(0)" class="btn btn-secondary hidden-md-down pull-right" data-link-action="delete-all-cart">
                <i class="las la-times-circle"></i>
                {l s='Empty cart' d='Shop.Theme.Axon'}
            </a>
        {/if}
    {else}
		{block name='continue_shopping'}
			<div class="empty-products">
				<p class="empty-title empty-title-cart">
					{l s='Your cart is currently empty.' d='Shop.Theme.Axon'}				
				</p>
				<div class="empty-text">
					{l s='Before proceed to checkout you must add some products to your shopping cart.' d='Shop.Theme.Axon'}
				</div>
				<p class="return-to-home">
					<a href="{$urls.pages.index}" class="btn btn-primary">
						<i class="las la-reply"></i>
						{l s='Continue shopping' d='Shop.Theme.Actions'}
					</a>
				</p>
			</div>
	  	{/block}
    {/if}
  </div>
{/block}
