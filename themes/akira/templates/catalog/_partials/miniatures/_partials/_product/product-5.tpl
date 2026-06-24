<div class="item-inner">
 <div class="js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
 	<div class="element-top">
		<a {if isset($product.images[1].bySize.{$imageType}.url) && $product.images[1].bySize.{$imageType}.url != $product.default_image.bySize.{$imageType}.url}class="has-second-img"{/if} href="{$product.url}" title="{$product.name}">
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
				{if isset($product.images[1].bySize.{$imageType}.url) && $product.images[1].bySize.{$imageType}.url != $product.default_image.bySize.{$imageType}.url}
					{$image = $product.images[1]}
					<img
						class="img-loader lazy-load" 
						data-src="{$image.bySize.{$imageType}.url}"
						src="{if isset($opThemect.placeholder)}{$opThemect.placeholder}{/if}" 
						alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
						title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
						width="{$image.bySize.{$imageType}.width}"
						height="{$image.bySize.{$imageType}.height}"
					>
				{/if}
			</div>
			{include file='catalog/_partials/miniatures/flags.tpl'}
			{if $product.show_price && $product.has_discount}
				{hook h='displayCountDown'} 
			{/if}
		</a> 
		<div class="wrapper-buttons-action">
			<form class="buttons-action axps-buttons-tootip-top" action="{$urls.pages.cart}" method="post">
				 {if !$configuration.is_catalog && $product.add_to_cart_url && ($product.quantity > 0 || $product.allow_oosp)}
					  {if !$product.id_product_attribute}
						<input type="hidden" name="token" value="{$static_token}">
						<input type="hidden" name="id_product" value="{$product.id}">
						<input type="number"
							   name="qty"
							   value="{$product.minimal_quantity}"
							   class="hidden"
							   min="{$product.minimal_quantity}"
						>
                        <button class="btn-action add-to-cart" data-button-action="add-to-cart" title="{l s='Add to cart' d='Shop.Theme.Actions'}" type="submit"{if !$product.add_to_cart_url} disabled{/if}>
                            {l s='Add to cart' d='Shop.Theme.Actions'}
                        </button>
					  {else}
                        <a 	href="javascript:void(0)" class="btn-action add-to-cart quick-view" data-link-action="quickview" title="{l s='Select options' d='Shop.Theme.Actions'}">
                            {l s='Select options' d='Shop.Theme.Actions'}
                        </a>        
					  {/if}
				  {else}
                    <a  href="{$product.url}" class="btn-action add-to-cart" title="{l s='Discover' d='Shop.Theme.Axon'}">
                        {l s='Discover' d='Shop.Theme.Axon'}
                    </a>
				  {/if}
                  <a href="javascript:void(0)" class="btn-action quick-view js-quick-view" data-link-action="quickview" title="{l s='Quick view' d='Shop.Theme.Actions'}">
                    {l s='Quick view' d='Shop.Theme.Actions'}
                  </a>
				  {hook h='displayButtonCompare' product=$product}
				  {hook h='displayButtonWishList' product=$product}
			</form>
		</div>
    </div>  
    <div class="element-bottom">  
        <div class="product-description">	
			{if $product.main_variants}
				<div class="variant-links-list">
				  {hook h='displayVariant' tpl_product = 5 imageType = $imageType} 
				</div>
			{/if}			
            {block name='product_name'}
                <div class="product_name">
					<a href="{$product.url}" title="{$product.name}">{$product.name}</a>
                </div>   
            {/block}
			{if isset($product.category_name) && $product.category_name neq '' && isset($product.id_category_default)}
				<div class="ax-product-cats">
					<a href="{Context::getContext()->link->getCategoryLink($product.id_category_default)}" title="{$product.category_name}">
						{$product.category_name}
					</a>
				</div>
			{/if}
			<div class="info-product">
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
</div>