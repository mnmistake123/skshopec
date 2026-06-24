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
<div id="js-product-list-top" class="nav-products-list-top">
	{if $listing.products|count}
		<div class="nav-products-list-top-left">
			{if !empty($listing.rendered_facets)}
				<div class="filter-buttons{if isset($opThemect.category_faceted_position) && $opThemect.category_faceted_position != 1} hidden-lg-up{/if}">
					<a href="#" class="open-filters" data-toggle="canvas-widget" data-target="#canvas-facets-search">{l s='Filter' d='Shop.Theme.Actions'}</a>
				</div>
				{if isset($opThemect.category_faceted_position) && $opThemect.category_faceted_position == 2}
					<div class="filter-buttons hidden-md-down">
						<a href="#" class="open-filters open-filters-middle">{l s='Filter' d='Shop.Theme.Actions'}</a>
					</div>
				{/if}
			{/if}
			{foreach from=$listing.pagination.pages item=sort_order name=sort_order_name}
				{if $sort_order.current}
					{if $smarty.foreach.sort_order_name.first}
						{if !$sort_order.url|strpos:"?"}
							{$sort_order.url="`$sort_order.url`?page=1"}
						{/if}
					{/if}
					{assign var="currentSortUrl" value=$sort_order.url|regex_replace:"/&shop_view=(grid|list)/":""}
					{if isset($opThemect.category_product_infinite) && $opThemect.category_product_infinite}
						{assign var="currentSortUrl" value=$currentSortUrl|regex_replace:"/page=\d+/":"page=1"}
					{/if}
					{break}
				{/if}
			{/foreach}
			{if isset($currentSortUrl)}
				<div class="gr-list-gird">
					<a href="{$currentSortUrl}&shop_view=grid" class="shop-view {if isset($opThemect.category_default_view) && !$opThemect.category_default_view}active-view{/if} {['js-search-link' => true]|classnames}" title="{l s='Grid' d='Shop.Theme.Axon'}">
						<svg viewBox="0 0 19 19" xmlns="http://www.w3.org/2000/svg"><rect width="5" height="5"></rect><rect x="7" width="5" height="5"></rect><rect x="14" width="5" height="5"></rect><rect y="7" width="5" height="5"></rect><rect x="7" y="7" width="5" height="5"></rect><rect x="14" y="7" width="5" height="5"></rect><rect y="14" width="5" height="5"></rect><rect x="7" y="14" width="5" height="5"></rect><rect x="14" y="14" width="5" height="5"></rect></svg>
					</a>
					<a href="{$currentSortUrl}&shop_view=list" class="shop-view {if isset($opThemect.category_default_view) && $opThemect.category_default_view}active-view{/if} {['js-search-link' => true]|classnames}" title="{l s='List' d='Shop.Theme.Axon'}">
						<svg viewBox="0 0 19 19" xmlns="http://www.w3.org/2000/svg"><rect width="5" height="5"></rect><rect x="7" height="5" width="12"></rect><rect y="7" width="5" height="5"></rect><rect x="7" y="7" height="5" width="12"></rect><rect y="14" width="5" height="5"></rect><rect x="7" y="14" height="5" width="12"></rect></svg>
					</a>
				</div>
			{/if}
		</div>
		<div class="nav-products-list-top-center"></div>
		<div class="nav-products-list-top-right">
			{if isset($opThemect.category_product_infinite) && $opThemect.category_product_infinite}
				{if $listing.pagination.total_items > 0}
					{$nb_count_items_shown_from = 1}
				{else}
					{$nb_count_items_shown_from = 0}
				{/if}
			{else}
				{$nb_count_items_shown_from = $listing.pagination.items_shown_from}
			{/if}
			<p class="wc-result-count">{l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => $nb_count_items_shown_from ,'%to%' => $listing.pagination.items_shown_to, '%total%' => $listing.pagination.total_items]}</p>
			{block name='sort_by'}
				{include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
			{/block}
		</div>
	{/if}
</div>