{block name='product_flags'}
	<ul class="label-flags">
	  {foreach from=$product.flags|@array_reverse item=flag}
		{if $flag.type == 'discount'}
			{if !$product.on_sale}
				<li class="label-flag type-{$flag.type}">
					<span>
						{$flag.label}
					</span>
				</li>
			{/if}
		{elseif $flag.type == 'new'}
			{if isset($product.show_condition) && isset($product.condition.type) && $product.show_condition}
				<li class="label-flag type-{$flag.type}">
					<span>
						{if $product.condition.type == 'refurbished'}
							{l s='Refurbished' d='Shop.Theme.Axon'}
						{elseif $product.condition.type == 'used'}
							{l s='Used' d='Shop.Theme.Axon'}
						{else}
							{l s='New' d='Shop.Theme.Axon'}
						{/if} 
					</span>
				</li>	
			{/if}
		{elseif $flag.type == 'on-sale'}
			<li class="label-flag type-{$flag.type}">
				<span>
					{l s='Sale' d='Shop.Theme.Axon'}
				</span>
			</li>
		{elseif $flag.type == 'out_of_stock'}
			<li class="label-flag type-outstock">
				<span>
					{$flag.label}
				</span>
			</li>
		{else}
			<li class="label-flag type-{$flag.type}">
				<span>
					{$flag.label}
				</span>
			</li>
		{/if}
	  {/foreach}
	</ul>
{/block}