<div class="dropdown-wrapper dropdown">
	<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">
		<span>{$current_language.name_simple}</span>
		<span class="las la-angle-down"></span>
	</div>
	<div class="dropdown-menu">
		{foreach from=$languages item=language}
			<a href="{url entity='language' id=$language.id_lang}">
				{$language.name_simple}
			</a>
		{/foreach}
	</div>
</div>