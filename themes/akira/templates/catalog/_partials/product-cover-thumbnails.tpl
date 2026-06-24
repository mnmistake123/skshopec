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
	 
{$imageType	= 'large_default'}

{if isset($opThemect.product_image_type)}
	{$imageType = $opThemect.product_image_type}
{/if}	 
	 
<div class="images-container js-images-container">
	{block name='product_cover'}
	<div class="product-images-cover">
		<div class="js-images-cover images-cover-wrapper swiper-container img-count-{count($product.images)}">
			<div class="swiper-wrapper">
				<div class="item-image swiper-slide col-xs-12 img-cover">
					<div class="img-light-box">
						{if $product.default_image}
							{$image = $product.default_image}
						{else}
							{$image = $urls.no_picture_image}
						{/if}
						<div class="img-placeholder {$imageType}">
							<div class="easyzoom easyzoom-product">
								<span data-zoom="{$image.bySize.{$imageType}.url}"></span>
							</div>
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
					</div>
				</div>
				{assign var="item_key" value="1"}
				{foreach from=$product.images item=image}
					{if $image.bySize.{$imageType}.url != $product.default_image.bySize.{$imageType}.url}
						<div class="item-image swiper-slide col-xs-12">
							<div class="img-light-box">
								<div class="img-placeholder {$imageType}">
									<div class="easyzoom easyzoom-product">
										<span data-zoom="{$image.bySize.{$imageType}.url}"></span>
									</div>
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
							</div>
						</div>
						{assign var="item_key" value="`$item_key+1`"}
					{/if}
				{/foreach}
			</div>
			<div class="swiper-arrows">
				<button class="gallery-swiper-arrow gallery-swiper-arrow-prev"></button>
				<button class="gallery-swiper-arrow gallery-swiper-arrow-next"></button>
			</div>
			<div class="swiper-dots">
				<div class="gallery-swiper-pagination"></div>
			</div>
		</div>
		{include file='catalog/_partials/miniatures/flags.tpl'}
		<div class="gr-btn-additional">
			{hook h='displayProductVideoBtn' product=$product}
			<div class="btn-additional">	
				<a class="btn-additional-view js-view-large" href="#">
					<span>{l s='Click to enlarge' d='Shop.Theme.Axon'}</span>
				</a>
			</div>
		</div>
	</div>
	{/block}
	
	{$imageType	= 'small_default'}
	{if isset($opThemect.product_image_thumb_type)}
		{$imageType = $opThemect.product_image_thumb_type}
	{/if}	
	{block name='product_images'}
	<div class="product-images-thumb">
		<div class="images-thumb-wrapper js-images-thumb swiper-container img-count-{count($product.images)}">
			<div class="swiper-wrapper">
				<div class="item-image swiper-slide swiper-slide-thumb-active img-cover">
					{if $product.default_image}
						{$image = $product.default_image}
					{else}
						{$image = $urls.no_picture_image}
					{/if}
					<div class="img-placeholder {$imageType}">
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
				</div>
				{assign var="item_key" value="1"}
				{foreach from=$product.images item=image}
					{if $image.bySize.{$imageType}.url != $product.default_image.bySize.{$imageType}.url}
						<div class="item-image swiper-slide">
							<div class="img-placeholder {$imageType}">
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
						</div>
						{assign var="item_key" value="`$item_key+1`"}
					{/if}
				{/foreach}
			</div>
			<div class="swiper-arrows">
				<button class="gallery-swiper-arrow gallery-swiper-arrow-prev"></button>
				<button class="gallery-swiper-arrow gallery-swiper-arrow-next"></button>
			</div>
			<div class="swiper-dots">
				<div class="gallery-swiper-pagination"></div>
			</div>
		</div>
	</div>
	{/block}
	
	{$imageType	= 'large_default'}

	{if isset($opThemect.product_image_type)}
		{$imageType = $opThemect.product_image_type}
	{/if}	 

</div>
{hook h='displayAfterProductThumbs' product=$product}