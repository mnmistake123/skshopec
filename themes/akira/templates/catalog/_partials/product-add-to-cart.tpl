{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
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
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="product-add-to-cart js-product-add-to-cart">
  	{if !$configuration.is_catalog}
		{block name='product_minimal_quantity'}
		  <p class="product-minimal-quantity js-product-minimal-quantity">
			{if $product.minimal_quantity > 1}
			  <span>
			  {l
			  s='The minimum purchase order quantity for the product is %quantity%.'
			  d='Shop.Theme.Checkout'
			  sprintf=['%quantity%' => $product.minimal_quantity]
			  }
			  </span>
			{/if}
		  </p>
		{/block}
	{/if}
    {block name='product_quantity'}
      <div class="product-quantity">
		{if !$configuration.is_catalog}  
			{block name='product_availability'}
			  <div id="product-availability" class="js-product-availability">
				{if $product.show_availability && $product.availability_message}
					<div class="label{if $product.availability == 'available'} type-available{elseif $product.availability == 'last_remaining_items'} type-last-remaining-items{else} type-out-stock{/if}">
						{$product.availability_message}
						{if $product.show_quantities}
						<span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">
							{$product.quantity} {$product.quantity_label}
						</span>
						{/if}
					</div>
				{/if}
			  </div>	  
			{/block}
		{/if}  
		{if !$configuration.is_catalog}   
			<div class="qty">
				<div class="input-group bootstrap-touchspin">	
                    <input
                        type="number"
                        name="qty"
                        id="quantity_wanted"
                        inputmode="numeric"
                        pattern="[0-9]*"
                        {if $product.quantity_wanted}
                        value="{$product.quantity_wanted}"
                        min="{$product.minimal_quantity}"
                        {else}
                        value="1"
                        min="1"
                        {/if}
                        class="input-group"
                        aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
                    >
					<span class="input-group-btn-vertical">
						<button class="btn btn-touchspin js-touchspin bootstrap-touchspin-up" type="button">
							<i class="material-icons touchspin-up"></i>
						</button>
						<button class="btn btn-touchspin js-touchspin bootstrap-touchspin-down" type="button">	  
							<i class="material-icons touchspin-down"></i>
						</button>
					</span>
				</div>
			</div>
			<div class="add">
			  <button class="add-to-cart btn btn-primary" data-button-action="add-to-cart" type="submit"{if !$product.add_to_cart_url} disabled{/if}>
				{l s='Add to cart' d='Shop.Theme.Actions'}
			  </button>
              {if isset($opThemect.product_show_buy_now) && $opThemect.product_show_buy_now}
                <button class="add-to-cart btn btn-primary js-buy-now" data-button-action="add-to-cart" type="submit"{if !$product.add_to_cart_url} disabled{/if}>
                    {l s='Buy Now' d='Shop.Theme.Axon'}
                </button>
              {/if}
			</div>
		  	{hook h='displayProductActions' product=$product}
		{/if}  
      </div>
    {/block}
</div>
