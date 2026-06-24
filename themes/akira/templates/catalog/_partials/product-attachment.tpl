{if count($product.attachments)}
	<div class="attachments">
		<span class="label">{l s='Files' d='Shop.Theme.Axon'}: </span>
		{foreach from=$product.attachments item=attachment}
			<a href="{url entity='attachment' params=['id_attachment' =>  $attachment.id_attachment]}" title="{$attachment.description}">
				{$attachment.name} ({$attachment.file_size_formatted})
			</a>
		{/foreach}
	</div>
{/if} 