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

<div id="canvas-menu-mobile" class="canvas-widget canvas-left">
	<div class="canvas-widget-top">
		<h3 class="title-canvas-widget" data-dismiss="canvas-widget">{l s='Megamenu' mod='nrtmegamenu'}</h3>
	</div>
	<div class="canvas-widget-content">
		<div class="wrapper-scroll">
			<div class="wrapper-scroll-content">
				<div class="wrapper-menu-mobile">
					{include file="module:nrtmegamenu/views/templates/hook/mobile-megamenu-ul.tpl"}
				</div>
				{hook h='displayMenuMobileCanVas'}
				{hook h='displayFollowButtons'}
			</div>
		</div>
	</div>
</div>