<div class="item-inner">
 <div class="js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
 	<div class="element-top">
		<a href="{$product.url}" title="{$product.name}">
			<div class="img-placeholder {$imageType}">
				{if $product.default_image}
					{$image = $product.default_image}
				{else}
					{$image = $urls.no_picture_image}
				{/if}
				<img
					class="img-loader lazy-load" 
					data-src="{$image.bySize.{$imageType}.url}"
					src="{if isset($opThemect.placeholder)}{$opThemect.placeholder}{/if}" 
					alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
					title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
					width="{$image.bySize.{$imageType}.width}"
					height="{$image.bySize.{$imageType}.height}"
				>
			</div>
		</a> 
    </div>  
    <div class="element-bottom">  
        <div class="product-description">
            {block name='product_name'}
                <div class="product_name">
					<a href="{$product.url}" title="{$product.name}">{$product.name}</a>
                </div>   
            {/block}
            {hook h='displayProductListReviews' product=$product} 			
            {if $product.show_price}
                <div class="product-price-and-shipping">
                {if $product.has_discount}
                    {hook h='displayProductPriceBlock' product=$product type="old_price"}
                    <span class="regular-price">{$product.regular_price}</span>
                {/if}
                {hook h='displayProductPriceBlock' product=$product type="before_price"}
                <span class="price">
                    {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                    {if '' !== $smarty.capture.custom_price}
                        {$smarty.capture.custom_price nofilter}
                    {else}
                        {$product.price}
                    {/if}
                </span>
                {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                {hook h='displayProductPriceBlock' product=$product type='weight'}
                </div>
            {/if}
        </div>
    </div>
  </div>
</div>