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
	 
<div class="row">
	<div id="content-wrapper" class="col-xs-12">
		<div id="main-content" class="product-container js-product-container">
			<div class="row row-product">
				<div class="col-xl-6 col-lg-7 col-md-6 col-12 single-product-images">
					{block name='page_content_container'}
						{block name='page_content'}		
							<div class="vertical-thumb vertical-thumb-left images-cover-slider">	  
								{block name='product_cover_tumbnails'}
									{include file='catalog/_partials/product-cover-thumbnails.tpl'}
								{/block}
							</div>
						{/block}
					{/block}
				</div>
				<div class="col-xl-6 col-lg-5 col-md-6 col-12 single-product-summary">
					<div class="summary-container">
						<div class="single-breadcrumbs-wrapper">
							<div class="single-breadcrumbs">
								{include file='catalog/_product/breadcrumb.tpl'}
								{hook h='displayProductsLinkNav' product=$product category=$category} 
							</div>
						</div>
						{if isset($product_manufacturer->id) && isset($manufacturer_image_url)}
							<div class="product-brands">
								<div class="product-brand">
									<a href="{$product_brand_url}">
										<img class="img-responsive" src="{$manufacturer_image_url}" title="{$product_manufacturer->name}" alt="{$product_manufacturer->name}"  loading="lazy">
									</a>
								</div>
							</div>
						{/if}
						{block name='page_header_container'}
							{block name='page_header'}
								<h1 class="product_title">
									{$product.name}
								</h1>
							{/block}
						{/block}

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
							{if $product.is_customizable && count($product.customizations.fields)}
								<div class="product-customization-button">
									{if !$configuration.is_catalog}
									<h3 class="action_product_customization" data-toggle="modal" data-target="#moda_product_customization">
										<i class="lar la-edit"></i>
										{l s='Product customization' d='Shop.Theme.Catalog'}
									</h3>
									<p>( {l s='If you can not add products to your cart, please customize the product!' d='Shop.Theme.Axon'} )</p>
									{/if}	
								</div>
							{/if}
							<div class="product-actions js-product-actions"> 
								{block name='product_buy'}
									<form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
										<input type="hidden" name="token" value="{$static_token}">
										<input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
										<input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id" class="js-product-customization-id">

										{block name='product_variants'}
											{include file='catalog/_partials/product-variants.tpl'}
										{/block}

										{block name='product_pack'}
											{if $packItems}
												{$imageType	= 'cart_default'}
												{if isset($opThemect.general_product_image_type_small)}
													{$imageType = $opThemect.general_product_image_type_small}
												{/if}
												<section class="product-pack">
													<p class="h4">
														{l s='This pack contains' d='Shop.Theme.Catalog'}
													</p>
													{foreach from=$packItems item="product_pack"}
														{block name='product_miniature'}
															{include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
														{/block}
													{/foreach}
												</section>
											{/if}
										{/block}

										{block name='product_discounts'}
											{include file='catalog/_partials/product-discounts.tpl'}
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
                            {hook h='displayProductSummary'}
                            {block name='hook_display_reassurance'}
                                {hook h='displayReassurance'}
                            {/block}
						</div>
					</div>
				</div>
			</div>
			{include file='catalog/_partials/product-tabs.tpl'}
		</div>	
	</div>
</div>