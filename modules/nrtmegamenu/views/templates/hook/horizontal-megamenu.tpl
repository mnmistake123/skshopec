{*
*
* 2017 AxonVIP
*
* NOTICE OF LICENSE
*
*  @author AxonVIP <axonvip@gmail.com>
*  @copyright  2017 axonvip.com
*   
*
*}

{if isset($nrtmenu) && is_array($nrtmenu) && count($nrtmenu)}
	<div class="wrapper-menu-horizontal">
		{include file="module:nrtmegamenu/views/templates/hook/horizontal-megamenu-ul.tpl"}
	</div>
{/if}