<div class="dropdown-wrapper dropdown">
    <div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">		
		<span>{if $current_currency.iso_code !== $current_currency.sign}{$current_currency.sign} {/if}{$current_currency.iso_code}</span>
		<span class="las la-angle-down"></span>
	</div>
    <div class="dropdown-menu">
		{foreach from=$currencies item=currency}
			<a title="{$currency.name}" rel="nofollow" href="{$currency.url}">
				{$currency.iso_code} {if $currency.sign !== $currency.iso_code} {$currency.sign}{/if}
			</a>
		{/foreach}
    </div>
</div>