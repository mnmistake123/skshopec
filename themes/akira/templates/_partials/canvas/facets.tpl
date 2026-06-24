<div id="canvas-facets-search" class="canvas-widget canvas-left">
	<div class="canvas-widget-top">
		<h3 class="title-canvas-widget" data-dismiss="canvas-widget">{l s='Filter Your Selection' d='Shop.Theme.Axon'}</h3>
	</div>
	<div class="canvas-widget-content">
		<div class="wrapper-scroll">
			<div class="wrapper-scroll-content">
				{if isset($opThemect.category_faceted_position) && $opThemect.category_faceted_position == 1}
					{widget name="ps_facetedsearch"}
				{else}
					<div id="_mobile_facets_search"></div>
				{/if}
			</div>
		</div>
	</div>
</div>
