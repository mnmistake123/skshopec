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

{if isset($nrtvertical) && count($nrtvertical)}
	<div class="wrapper-menu-vertical">		
		<div class="menu-vertical-title">
			<i class="la la-bars"></i>											
			<span>{l s='All categories' mod='nrtmegamenu'}</span>
		</div>
		{include file="module:nrtmegamenu/views/templates/hook/vertical-megamenu-ul.tpl"}
	</div>
{/if}
