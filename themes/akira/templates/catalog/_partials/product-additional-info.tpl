<div class="product-additional-info js-product-additional-info">
    {hook h='displayButtonCompare' product=$product} 
    {hook h='displayButtonWishList' product=$product}
	{if isset($has_sizeguide)}
		<a class="btn-size-chart btn-action" data-toggle="modal" data-target="#moda_sizechart" href="#">
			{l s='Size Guide' d='Shop.Theme.Axon'}
		</a>
	{/if}
    {hook h='displayProductAdditionalInfo' product=$product}
</div>