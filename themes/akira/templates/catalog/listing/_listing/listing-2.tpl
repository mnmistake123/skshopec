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
	 
{block name='block_full_width'}
	<div class="{if isset($opThemect.category_layout_width_type) && $opThemect.category_layout_width_type}{$opThemect.category_layout_width_type}{/if} container-parent">
		{block name='block_subcategories'}{/block}
		{block name='product_list_header'}{/block}
		<div class="row category-layout-2">
			{block name="content_wrapper"}
				<div id="content-wrapper" class="right-column col-xs-12 col-lg-9">
					<div id="main-content">
						{hook h="displayContentWrapperTop"}
						{block name='content'}
							<section id="main">
								{block name='banner_boxed'}{/block}
								<section id="products">
									{block name='product_list_active_filters'}
										{if isset($listing.rendered_active_filters)}
											{$listing.rendered_active_filters nofilter}
										{/if}
									{/block}
									{block name='product_list_top'}
										{include file='catalog/_partials/products-top.tpl' listing=$listing}
									{/block}
									{if isset($opThemect.category_faceted_position) && $opThemect.category_faceted_position == 2}
										<div id="facets_search_middle" class="hidden-md-down">
											{widget name="ps_facetedsearch"}
										</div>
									{elseif isset($opThemect.category_faceted_position) && $opThemect.category_faceted_position == 3}
										<div id="facets_search_middle_dropdown" class="hidden-md-down">
											{widget name="ps_facetedsearch"}
										</div>
									{/if}
                                    {block name='product_list'}
                                        {include file='catalog/_partials/products.tpl' listing=$listing}
                                    {/block}
									{block name='product_list_bottom'}
										{include file='catalog/_partials/products-bottom.tpl' listing=$listing}
									{/block}
								</section>
								{hook h="displayFooterCategory"}
							</section>
						{/block}
						{hook h="displayContentWrapperBottom"}
					</div>
				</div>
			{/block}
			{block name="right_column"}
				<div id="right-column" class="col-xs-12 col-lg-3">
					<div id="right-content">
						{block name="right_content"}
							{hook h="displayRightColumn"}
						{/block}
					</div>
				</div>
			{/block}
		</div>
	</div>
{/block}