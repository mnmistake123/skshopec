<div class="container container-parent">
	<div class="row">
		{block name='hook_footer_before'}
			{hook h='displayFooterBefore'}
		{/block}
	</div>
</div>
<div class="container container-parent">
	<div class="row">
		{block name='hook_footer'}
			{hook h='displayFooter'}
		{/block}
	</div>
</div>
<div class="container container-parent">
	<div class="row">
		{block name='hook_footer_after'}
			{hook h='displayFooterAfter'}
		{/block}
	</div>
</div>
{hook h='displayFooterPageBuilder'}