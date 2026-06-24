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

{$imageType	= 'home_default'}
	 
{if isset($opThemect.category_product_image_type)}
	{$imageType = $opThemect.category_product_image_type}
{/if}

{$productLayout = 0}

{if isset($opThemect.category_product_layout)}
	{$productLayout = $opThemect.category_product_layout}
{/if}

<div id="js-product-list">
	{if $listing.products|count}
		{if isset($opThemect.category_default_view) && !$opThemect.category_default_view}
		  <div id="box-product-grid" class="products product-type-{$productLayout}">
			  <div class="archive-wrapper-items wrapper-items">
				{foreach from=$listing.products item="product"}
					<div class="item">
						{include file='catalog/_partials/miniatures/product-loop.tpl' product=$product}
					</div>
				{/foreach}
			  </div>  
		  </div>
		{else}
			{$imageType	= 'home_default'}
			{if isset($opThemect.general_product_image_type_large) && $opThemect.general_product_image_type_large}
				{$imageType = $opThemect.general_product_image_type_large}
			{/if}
			<div id="box-product-list" class="products archive-wrapper-items wrapper-items">
				{foreach from=$listing.products item="product"}
					{include file="catalog/_partials/miniatures/_partials/_product/product-0.tpl" product=$product}
				{/foreach}
			</div>
		{/if}
	{else}
        {capture assign="errorContent"}
        <h4>{l s='No products available yet' d='Shop.Theme.Catalog'}</h4>
        <p>{l s='Stay tuned! More products will be shown here as they are added.' d='Shop.Theme.Catalog'}</p>
        {/capture}

        {include file='errors/not-found.tpl' errorContent=$errorContent}
	{/if}
</div>

