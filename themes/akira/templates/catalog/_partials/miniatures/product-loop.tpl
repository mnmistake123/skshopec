{if isset($productLayout) && $productLayout}
	{include file="catalog/_partials/miniatures/_partials/_product/product-{$productLayout}.tpl"}
{else}
    {include file="catalog/_partials/miniatures/_partials/_product/product-1.tpl"}
{/if}