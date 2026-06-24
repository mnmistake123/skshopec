<div id="wrapper-tab-product" class="wc-tabs-wrapper tab-type-accordion{if isset($opThemect.product_tabs_type) && $opThemect.product_tabs_type == 4} accordion-show-all{/if} clearfix">
	<div class="tab-content">
		{if $product.description}
			<a class="accordion-title js-accordion" href="#description">{l s='Description' d='Shop.Theme.Catalog'}</a>
			<div id="description" class="tab-pane active">
				{block name='product_description'}
					<div class="product-description">
						{$product.description nofilter}
					</div>
				{/block}
			</div>
		{/if}
		{block name='product_details'}
			<a class="accordion-title js-accordion" href="#product-details-tab-content">{l s='Product Details' d='Shop.Theme.Catalog'}</a>
			<div id="product-details-tab-content" class="tab-pane {if !$product.description} active{/if}">
				{include file='catalog/_partials/product-details.tpl'}
			</div>
		{/block}
		{foreach from=$product.extraContent item=extra key=extraKey}
			<a class="accordion-title js-accordion" href="#extra-{$extraKey}" {foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}>{$extra.title}</a>
			<div id="extra-{$extraKey}" class="tab-pane {$extra.attr.class}" {foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}>
			   {$extra.content nofilter}
			</div>
		{/foreach}
	</div>
</div>