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
 
{extends file='layouts/layout-both-columns.tpl'}
	 
{$imageType	= 'large_default'}

{if isset($opThemect.product_image_type)}
	{$imageType = $opThemect.product_image_type}
{/if}	
	 
{if $product.cover}
	{$image = $product.cover}
{else}
	{$image = $urls.no_picture_image}
{/if}
	 
{block name='head' append}
  <meta property="og:type" content="product">
  {if $product.cover}
    <meta property="og:image" content="{$product.cover.large.url}">
  {/if}
  {if $product.show_price}
	<meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
	<meta property="product:pretax_price:currency" content="{$currency.iso_code}">
	<meta property="product:price:amount" content="{$product.price_amount}">
	<meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
	<meta property="product:weight:value" content="{$product.weight}">
	<meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}
	 
{block name='breadcrumb'}{/block}
	 
{block name='head_microdata_special'}
  {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='block_full_width'}
	<div class="{if isset($opThemect.product_layout_width_type) && $opThemect.product_layout_width_type}{$opThemect.product_layout_width_type}{/if} container-parent">
		{hook h="displayContentWrapperTop"}
        {if isset($opThemect.product_layout) && $opThemect.product_layout}
            <section id="main" class="product-layout-{$opThemect.product_layout}">
                <meta content="{$product.url}">
                {include file="catalog/_product/product-{$opThemect.product_layout}.tpl"} 
                {if $product.is_customizable && count($product.customizations.fields)}
                    {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                {/if}
                {hook h='displayProductSizeGuide'}
                {block name='page_footer_container'}
                    <footer class="page-footer">
                        {block name='page_footer'}
                        <!-- Footer content -->
                        {/block}
                    </footer>
                {/block}
            </section>
        {/if}
		{hook h="displayContentWrapperBottom"}
	</div>
	{block name='product_footer_container'}
		<div id="product-footer">
			{hook h='displayProductAccessories' product=$product category=$category}
			{hook h='displayProductSameCategory' product=$product category=$category}
			{hook h='displayFooterProduct' product=$product category=$category}
		</div>
	{/block}
{/block}
