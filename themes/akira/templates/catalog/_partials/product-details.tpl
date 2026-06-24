<div id="product-details" class="js-product-details" data-product="{$product.embedded_attributes|json_encode}">	
	{block name='product_reference'}
		{if isset($product_manufacturer->id)}
			<div class="product-manufacturer product-info-catalog">
				<label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label><a href="{$product_brand_url}">{$product_manufacturer->name}</a>
			</div>
		{/if}
		{if isset($product.reference_to_display) && $product.reference_to_display neq ''}
			<div class="product-reference product-info-catalog">
				<label class="label">{l s='Reference' d='Shop.Theme.Catalog'}</label><span>{$product.reference_to_display}</span>
			</div>
		{/if}
	{/block}
		
	{block name='product_quantities'}
		{if $product.show_quantities}
			<div class="product-quantities product-info-catalog">
				<label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label><span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
			</div>
		{/if}
	{/block}
	
	{block name='product_availability_date'}
		{if $product.availability_date}
			<div class="product-availability-date product-info-catalog">
				<label class="label">{l s='Availability date:' d='Shop.Theme.Catalog'}</label><span>{$product.availability_date}</span>
			</div>
		{/if}
	{/block}
	
	{block name='product_condition'}
		{if $product.condition}
			<div class="product-condition product-info-catalog">
				<label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label><link href="{$product.condition.schema_url}"/><span>{$product.condition.label}</span>
			</div>
		{/if}
	{/block}
			
	{block name='product_out_of_stock'}
		<div class="product-out-of-stock">
			{hook h='actionProductOutOfStock' product=$product}
		</div>
	{/block}
	
	{block name='product_features'}
		{if $product.grouped_features}
			<section class="product-features">
				<p class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</p>
				<table class="axps_shop_attributes">
					<tbody>
						{foreach from=$product.grouped_features item=feature}
							<tr><th>{$feature.name}</th><td>{$feature.value|escape:'htmlall'|nl2br nofilter}</td></tr>
						{/foreach}
					</tbody>
				</table>
			</section>
		{/if}
	{/block}
	
	{* if product have specific references, a table will be added to product details section *}
	{block name='product_specific_references'}
		{if !empty($product.specific_references)}
			<section class="product-features">
				<p class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</p>
				<table class="axps_shop_attributes">
					<tbody>
						{foreach from=$product.specific_references item=reference key=key}
							<tr><th>{$key}</th><td>{$reference}</td></tr>
						{/foreach}
					</tbody>
				</table>
			</section>
		{/if}
	{/block}
</div>
