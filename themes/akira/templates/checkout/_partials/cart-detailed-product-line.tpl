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
	 
{$imageType	= 'cart_default'}

{if isset($opThemect.general_product_image_type_small) && $opThemect.general_product_image_type_small}
	{$imageType = $opThemect.general_product_image_type_small}
{/if}
	 
<td class="product-remove">
	{if empty($product.is_gift)}
	<a
		class                       = "remove-from-cart"
		rel                         = "nofollow"
		href                        = "{$product.remove_from_cart_url}"
		data-link-action            = "delete-from-cart"
		data-id-product             = "{$product.id_product|escape:'javascript'}"
		data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
		data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
	>
		<i class="las la-times"></i>
	</a>
	{/if}
	{block name='hook_cart_extra_product_actions'}
		{hook h='displayCartExtraProductActions' product=$product}
	{/block}
</td>
<td class="product-thumbnail">
	<a class="product-image" href="{$product.url}">
		<div class="img-placeholder {$imageType}">
			{if $product.default_image}
				{$image = $product.default_image}
			{else}
				{$image = $urls.no_picture_image}
			{/if}
			<img
				class="img-loader lazy-load" 
				data-src="{$image.bySize.{$imageType}.url}"
				src="{if isset($opThemect.placeholder)}{$opThemect.placeholder}{/if}" 
				alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
				title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
				width="{$image.bySize.{$imageType}.width}"
				height="{$image.bySize.{$imageType}.height}"
			>
		</div>
	</a>
</td>
<td class="product-name" data-title="{l s='Product' d='Shop.Theme.Axon'}">
	<a class="product-title" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>
	<div class="text-muted">
		{foreach from=$product.attributes key="attribute" item="value"}
			<div><small class="label">{$attribute}: </small><small>{$value}</small></div>
		{/foreach}
	</div>
	{if is_array($product.customizations) && $product.customizations|count}
		{block name='cart_detailed_product_line_customization'}
			<div class="customizations">
				<ul>
					{foreach from=$product.customizations item='customization'}
						<li>
							<ul>
								{foreach from=$customization.fields item='field'}
									<li>
										<small class="label">{$field.label}: </small>
										{if $field.type == 'text'}
											<small class="text">{$field.text nofilter}</small>
										{else if $field.type == 'image'}
											<a href="{$field.image.large.url}" target="_blank">
												<img class="img-responsive" src="{$field.image.small.url}" alt="">
											</a>
										{/if}
									</li>
								{/foreach}
							</ul>
						</li>
					{/foreach}
				</ul>
			</div>
		{/block}
	{/if}
</td>
<td class="product-c-price" data-title="{l s='Price' d='Shop.Theme.Axon'}">
	<div class="amount {if $product.has_discount}has-discount{/if}">
		<span>{$product.price}</span>
		{if $product.unit_price_full}
			<div class="unit-price-cart">{$product.unit_price_full}</div>
		{/if}
	</div>
    {hook h='displayProductPriceBlock' product=$product type="unit_price"}
</td>
<td class="product-quantity" data-title="{l s='Quantity' d='Shop.Theme.Axon'}">
	{if !empty($product.is_gift)}
		<span class="gift-quantity">{$product.quantity}</span>
	{else}
		<div class="input-group bootstrap-touchspin">
			<span class="input-group-btn">
				<button class="btn btn-touchspin js-touchspin js-increase-product-quantity bootstrap-touchspin-down" type="button">-</button>
			</span>
              <input
                class="js-cart-line-product-quantity form-control"
                data-down-url="{$product.down_quantity_url}"
                data-up-url="{$product.up_quantity_url}"
                data-update-url="{$product.update_quantity_url}"
                data-product-id="{$product.id_product}"
                type="number"
                inputmode="numeric"
                pattern="[0-9]*"
                value="{$product.quantity}"
                name="product-quantity-spin"
                aria-label="{l s='%productName% product quantity field' sprintf=['%productName%' => $product.name] d='Shop.Theme.Checkout'}"
              />
			<span class="input-group-btn">
				<button class="btn btn-touchspin js-touchspin js-decrease-product-quantity bootstrap-touchspin-up" type="button">+</button>
			</span>
		</div>
	{/if}
</td>
<td class="product-subtotal" data-title="{l s='Subtotal' d='Shop.Theme.Axon'}">
	<span class="product-price">
		<strong>
			{if !empty($product.is_gift)}
				<span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
			{else}
				{$product.total}
			{/if}
		</strong>
	</span>
</td>
	