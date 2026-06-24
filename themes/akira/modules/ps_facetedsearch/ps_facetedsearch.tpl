{if isset($listing.rendered_facets) && $listing.rendered_facets}
	<div id="_desktop_facets_search" class="hidden-md-down widget">
		<div id="search_filters_wrapper">
			{$listing.rendered_facets nofilter}
		</div>
	</div>
{/if}