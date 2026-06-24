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
	 
{$c_imageType	= 'category_default'}
	 
{if isset($opThemect.category_image_type)}
	{$c_imageType = $opThemect.category_image_type}
{/if} 
	 
<div id="js-product-list-header">
	{if $listing.pagination.items_shown_from == 1}
		{if !empty($category.image.bySize.{$c_imageType}.url)}
			<div class="category-banner-boxed">
				<div class="img-placeholder {$c_imageType}">
					<img
						class="img-loader lazy-load" 
						data-src="{$category.image.bySize.{$c_imageType}.url}"
						src="{if isset($opThemect.placeholder)}{$opThemect.placeholder}{/if}" 
						alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}"
						title="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}" 
						width="{$category.image.bySize.{$c_imageType}.width}"
						height="{$category.image.bySize.{$c_imageType}.height}"
					>
				</div> 
			</div>
		{/if} 
	{/if} 
</div>
