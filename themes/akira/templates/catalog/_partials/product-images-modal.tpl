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
<div class="js-product-images-modal">
	<div class="product_meta">
		<div class="sku_wrapper">
			<span class="label">{l s='SKU' d='Shop.Theme.Axon'}: </span>
			<span>
				{if isset($product.reference_to_display) && $product.reference_to_display neq ''}
					{$product.reference_to_display}
				{else}
					{l s='N/A' d='Shop.Theme.Axon'}
				{/if}
			</span>
		</div>
		{block name='product_attachment'}
			{include file='catalog/_partials/product-attachment.tpl'}
		{/block}
		{hook h='displayProductTags'}
	</div>
	{$imageType	= 'large_default'}

	{if isset($opThemect.product_image_type)}
		{$imageType = $opThemect.product_image_type}
	{/if}	 

	{if $product.default_image}
		{$image = $product.default_image}
	{else}
		{$image = $urls.no_picture_image}
	{/if}
	{hook h='displayProductShareButtons' link=$product.canonical_url img=$image.bySize.{$imageType}.url title=$product.name}
</div>
