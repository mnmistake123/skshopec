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
	 
{extends file='catalog/listing/product-list.tpl'}
	 	 	 
{block name='page_header_title'}
	{$category.name}
{/block}
	 
{block name='block_subcategories'}
	{if isset($opThemect.category_show_sub) && $opThemect.category_show_sub}
		{include file='catalog/_partials/miniatures/category-subcategories.tpl'}
	{/if}
{/block} 
	 
{block name='product_list_header'}
	{if $category.description}
		<div class="category-description">{$category.description nofilter}</div>
	{/if}
{/block}
	 	  	 
{if isset($opThemect.category_banner_layout) && !$opThemect.category_banner_layout} 
	{$c_imageType	= 'category_default'}

	{if isset($opThemect.category_image_type)}
		{$c_imageType = $opThemect.category_image_type}
	{/if} 
	 
	{if !empty($category.image.bySize.{$c_imageType}.url)}
	 	{block name='bg_page_header_title'}
	 		{$opThemect.bg_page_title_img = $category.image.bySize.{$c_imageType}.url}
	 	{/block}
	{/if} 
{else}
    {block name='banner_boxed'}
	 	{include file='catalog/_partials/category-header.tpl' listing=$listing category=$category}
    {/block}
{/if}