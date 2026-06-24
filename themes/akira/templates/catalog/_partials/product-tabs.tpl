<div id="wrapper-tab-product" class="wc-tabs-wrapper {if isset($opThemect.product_tabs_type) && ($opThemect.product_tabs_type == 1 || $opThemect.product_tabs_type == 2)} tab-type-default{else} tab-type-accordion{if isset($opThemect.product_tabs_type) && $opThemect.product_tabs_type == 4} accordion-show-all{/if}{/if} tabs clearfix">
	<ul class="nav nav-tabs {if isset($opThemect.product_tabs_type) && ($opThemect.product_tabs_type == 3 || $opThemect.product_tabs_type == 4)} hidden{else} hidden-md-down{/if}" role="tablist">
		{if $product.description}
			<li class="nav-item">
				<a
					class="nav-link active js-product-nav-active"
					data-toggle="tab"
					href="#description"
					role="tab"
					aria-controls="description"
					aria-selected="true">{l s='Description' d='Shop.Theme.Catalog'}</a>
			</li>
		{/if}
		<li class="nav-item">
			<a
				class="nav-link{if !$product.description} active js-product-nav-active{/if}"
				data-toggle="tab"
				href="#product-details-tab-content"
				role="tab"
				aria-controls="product-details"
				{if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
		</li>
		{foreach from=$product.extraContent item=extra key=extraKey}
			<li class="nav-item">
				<a
					class="nav-link"
					data-toggle="tab"
					href="#extra-{$extraKey}"
					role="tab"
					{foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}
					aria-controls="extra-{$extraKey}">{$extra.title}</a>
			</li>
		{/foreach}
	</ul>
	<div class="tab-content">
		{if $product.description}
			<a class="accordion-title js-accordion active_accordion {if isset($opThemect.product_tabs_type) && ($opThemect.product_tabs_type == 1 || $opThemect.product_tabs_type == 2)} hidden-lg-up{/if}" href="#description">{l s='Description' d='Shop.Theme.Catalog'}</a>
			<div id="description" class="wc-tab tab-pane active js-product-tab-active">
				{block name='product_description'}
					<div class="product-description">
						{$product.description nofilter}
					</div>
				{/block}
			</div>
		{/if}
		{block name='product_details'}
			<a class="accordion-title js-accordion {if !$product.description} active_accordion{/if} {if isset($opThemect.product_tabs_type) && ($opThemect.product_tabs_type == 1 || $opThemect.product_tabs_type == 2)} hidden-lg-up{/if}" href="#product-details-tab-content">{l s='Product Details' d='Shop.Theme.Catalog'}</a>
			<div id="product-details-tab-content" class="wc-tab tab-pane {if !$product.description} active js-product-tab-active{/if}">
				{include file='catalog/_partials/product-details.tpl'}
			</div>
		{/block}
		{foreach from=$product.extraContent item=extra key=extraKey}
			<a class="accordion-title js-accordion {if isset($opThemect.product_tabs_type) && ($opThemect.product_tabs_type == 1 || $opThemect.product_tabs_type == 2)} hidden-lg-up{/if}" href="#extra-{$extraKey}" {foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}>{$extra.title}</a>
			<div id="extra-{$extraKey}" class="wc-tab tab-pane {$extra.attr.class}" {foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}>
			   {$extra.content nofilter}
			</div>
		{/foreach}
	</div>
</div>
