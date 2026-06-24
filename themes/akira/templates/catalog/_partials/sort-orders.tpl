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
	 
{if isset($currentSortUrl)}
	<div class="gr-per-page dropdown">
		<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">	 	
			<span>
				{if isset($opThemect.category_product_infinite) && $opThemect.category_product_infinite}
					{$listing.pagination.items_shown_to}
				{else}
					{$listing.products|count}
				{/if}
			</span>
			<span class="las la-angle-down"></span>
		</div>
		{assign var="currentSortUrl" value=$currentSortUrl|regex_replace:"/page=\d+/":"page=1"}
		<div class="dropdown-menu">
			<a rel="nofollow" href="{$currentSortUrl}&resultsPerPage=12" class="{['js-search-link' => true]|classnames}">12</a>
			<a rel="nofollow" href="{$currentSortUrl}&resultsPerPage=24" class="{['js-search-link' => true]|classnames}">24</a>
			<a rel="nofollow" href="{$currentSortUrl}&resultsPerPage=36" class="{['js-search-link' => true]|classnames}">36</a>
			<a rel="nofollow" href="{$currentSortUrl}&resultsPerPage=100" class="{['js-search-link' => true]|classnames}">100</a>
			<a rel="nofollow" href="{$currentSortUrl}&resultsPerPage=200" class="{['js-search-link' => true]|classnames}">200</a>
		</div>
	</div>
{/if}
	 
<div class="wc-ordering-dropdown dropdown">
	<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">	
		<span class="hidden-md-down">
			{if isset($listing.sort_selected) && $listing.sort_selected}{$listing.sort_selected}{else}{l s='Select' d='Shop.Theme.Actions'}{/if}
		</span>
		<span class="hidden-lg-up">{l s='Sort by' d='Shop.Theme.Axon'}</span>
		<span class="las la-angle-down"></span>
	</div>
	<div class="dropdown-menu">
		{foreach from=$listing.sort_orders item=sort_order}
			{if $sort_order.current}
				{assign var="currentSortUrl" value=$sort_order.url|regex_replace:"/&resultsPerPage=\d+/":""}
			{/if}
			<a rel="nofollow" href="{$sort_order.url}" class="{['current' => $sort_order.current, 'js-search-link' => true]|classnames}">
				{$sort_order.label}
			</a>
		{/foreach}
	</div>
</div>
