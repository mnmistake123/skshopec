{extends file='layouts/layout-full-width.tpl'}

{if isset($opThemect.404_override_content_by_hook) && $opThemect.404_override_content_by_hook}
	{block name='block_full_width'}
		{hook h='display404PageBuilder'}
	{/block}
{else}
	{block name="content"}
		<div class="text-center">
			<h1>404</h1>
			<h5>{l s='Sorry! Page you are looking can’t be found.' d='Shop.Theme.Axon'}</h5>
			<p>{l s='Go back to the' d='Shop.Theme.Axon'}<a href="{$urls.pages.index}">{l s='Home page' d='Shop.Theme.Axon'}</a></p>
		</div>
	{/block}
{/if}