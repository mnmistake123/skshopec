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
	 
<div id="quickview-modal-{$product.id}-{$product.id_product_attribute}" class="modal quickview" tabindex="-1" role="dialog" aria-hidden="true"><div class="modal-dialog quick-view-wrapper popup-wrapper" role="document">
	<div class="modal-content">
		<button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}"><span aria-hidden="true">&times;</span></button>
		<div class="modal-body">
			<div class="row quick-view-row">
				<div class="col-xl-6 col-lg-7 col-md-6 col-12 quick-view-images">
					{block name='page_content_container'}
						{block name='page_content'}		
							<div class="horizontal-thumb images-cover-slider">	  
								{block name='product_cover_tumbnails'}
									{include file='catalog/_partials/product-cover-thumbnails.tpl'}
								{/block}
							</div>
						{/block}
					{/block}
				</div>
				<div class="col-xl-6 col-lg-5 col-md-6 col-12 quick-view-summary">
					<div class="summary-container">
						{block name='page_header_container'}
							{block name='page_header'}
								<h1 class="product_title">
									<a href="{$product.url}" title="{$product.name}">
										{$product.name}
									</a>
								</h1>
							{/block}
						{/block}
						{if isset($product_manufacturer->id) && isset($manufacturer_image_url)}
							<div class="product-brands">
								<div class="product-brand">
									<a href="{$product_brand_url}">
										<img class="img-responsive" src="{$manufacturer_image_url}" title="{$product_manufacturer->name}" alt="{$product_manufacturer->name}">
									</a>
								</div>
							</div>
						{/if}
						{hook h='displayProductRating' product=$product}
						{block name='product_prices'}
							{include file='catalog/_partials/product-prices.tpl'}
						{/block} 
						{block name='product_description_short'}
							<div id="product-description-short-{$product.id}" class="product-short-description">
								{$product.description_short nofilter}
							</div>
						{/block}
						<div class="product-information">
							<div class="product-actions js-product-actions">
								{block name='product_buy'}
									<form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
										<input type="hidden" name="token" value="{$static_token}">
										<input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
										<input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id" class="js-product-customization-id">
										{block name='product_variants'}
											{include file='catalog/_partials/product-variants.tpl'}
										{/block}
										{block name='product_add_to_cart'}
											{include file='catalog/_partials/product-add-to-cart.tpl'}
										{/block}
										{block name='product_refresh'}{/block}
									</form>
								{/block}
							</div>
							{block name='product_additional_info'}
								{include file='catalog/_partials/product-additional-info.tpl'}
							{/block}
							{block name='product_images_modal'}
								{include file='catalog/_partials/product-images-modal.tpl'}
							{/block} 
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div></div>