{*
 * Classic theme doesn't use this subtemplate, feel free to do whatever you need here.
 * This template is generated at each ajax calls.
 * See ProductListingFrontController::getAjaxProductSearchVariables()
 *}
<div id="js-product-list-bottom">
	{if $listing.products|count}
		{if isset($opThemect.category_product_infinite) && $opThemect.category_product_infinite}
			{foreach from=$listing.pagination.pages key=page_key item=sort_order}
				{if $sort_order.current}
					{if isset($listing.pagination.pages[$page_key+1]) && $listing.pagination.pages[$page_key+1].type != 'next'}
						{assign var="infiniteUrl" value=$listing.pagination.pages[$page_key+1].url}
					{/if}
					{break}
				{/if}
			{/foreach}
			{if isset($infiniteUrl)}
				<div class="archive-bottom">
					<div class="archive-load-wrapper">
						<div class="archive-load-button">
							<a class="btn widget-archive-trigger {['js-search-link' => true]|classnames} {if isset($opThemect.category_product_infinite) && $opThemect.category_product_infinite == 2} trigger_infinit{/if}" href="{$infiniteUrl}&infinite" rel="nofollow">
								{l s='More Products' d='Shop.Theme.Axon'}					
							</a>
							<div class="btn widget-archive-loader" style="display:none;">
								{l s='Loading...' d='Shop.Theme.Axon'}						
							</div>
						</div>
					</div>
				</div>
			{/if}
		{else}
			{block name='pagination'}
				{include file='_partials/pagination.tpl' pagination=$listing.pagination}
			{/block}
		{/if}
	{/if}
</div>
