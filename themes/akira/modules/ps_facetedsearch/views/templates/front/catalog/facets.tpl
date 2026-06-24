{**
  * 2007-2019 PrestaShop.
  *
  * NOTICE OF LICENSE
  *
  * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
  * that is bundled with this package in the file LICENSE.txt.
  * It is also available through the world-wide-web at this URL:
  * https://opensource.org/licenses/AFL-3.0
  * If you did not receive a copy of the license and are unable to
  * obtain it through the world-wide-web, please send an email
  * to license@prestashop.com so we can send you a copy immediately.
  *
  * DISCLAIMER
  *
  * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
  * versions in the future. If you wish to customize PrestaShop for your
  * needs please refer to https://www.prestashop.com for more information.
  *
  * @author    PrestaShop SA <contact@prestashop.com>
  * @copyright 2007-2019 PrestaShop SA
  * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
  * International Registered Trademark & Property of PrestaShop SA
  *}
{if $displayedFacets|count}
	<div id="search_filters" class="js-search-filters">
		{foreach from=$displayedFacets item="facet" name="facet"}
			<div class="widget widget-facet-search widget-facet-type-{$facet.widgetType} facet">  
				<div class="widget-content">
					{assign var=_expand_id value=10|mt_rand:100000}
					<div class="widget-title h3"><span>{$facet.label}</span></div>
					{if in_array($facet.widgetType, ['radio', 'checkbox'])}
						{block name='facet_item_other'}
							<div class="wrapper-scroll facet-wrapper-content">
								<div class="{if isset($facet.filters[0].properties.color) || isset($facet.filters[0].properties.texture)}wrapper-no-scroll{else}wrapper-scroll-content{/if}">
									<ul class="facet-type-{$facet.widgetType}">
										{foreach from=$facet.filters key=filter_key item="filter" name="filter_name"}
											{if !$filter.displayed}
												{continue}
											{/if}
											<li {if isset($filter.properties.color) || isset($filter.properties.texture)} class="facet_color"{/if}>
												<label{if !isset($filter.properties.color) && !isset($filter.properties.texture)} class="wrapper-custom-checkbox {if $filter.magnitude and $show_quantities} has-magnitude{/if}"{/if}>
													{if $facet.multipleSelectionAllowed}
														<span class="custom-checkbox">
															<input data-search-url="{$filter.nextEncodedFacetsURL}" type="checkbox" {if $filter.active } checked {/if}>
															{if isset($filter.properties.texture)}
																<span class="color texture" style="background-image:url({$filter.properties.texture})">
																	<span class="corlor-tooltip">
																		<span class="bg-tooltip" style="background-image:url({$filter.properties.texture})"></span>
																		<span class="name-tooltip">{$filter.label}({$filter.magnitude})</span>
																	</span>
																</span>
															{elseif isset($filter.properties.color)}
																<span class="color" style="background-color: {$filter.properties.color}">
																   <span class="corlor-tooltip">
																		<span class="bg-tooltip" style="background-color: {$filter.properties.color}"></span>
																		<span class="name-tooltip">{$filter.label}({$filter.magnitude})</span>
																   </span>
																</span>
															{else}
																<span {if !$js_enabled} class="ps-shown-by-js" {/if}>
																	<i class="las la-check checkbox-checked"></i>
																</span>
															{/if}
														</span>
													{else}
														<span class="custom-radio">
															<input data-search-url="{$filter.nextEncodedFacetsURL}" type="radio" name="filter_{$facet.label}" {if $filter.active }checked{/if}>
															<span {if !$js_enabled} class="ps-shown-by-js"{/if}></span>
														</span>
													{/if}
													{if !isset($filter.properties.color) && !isset($filter.properties.texture)}
														<span class="text">
															{$filter.label}
															{if $filter.magnitude and $show_quantities}
																<span class="magnitude">({$filter.magnitude})</span>
															{/if}
														</span>
													{/if}
												</label>
											</li>
										{/foreach}
									</ul>
								</div>
							</div>
						{/block}
					{elseif $facet.widgetType == 'dropdown'}
						{block name='facet_item_dropdown'}
							<div class="facet-dropdown facet-wrapper-content dropdown">
								<a class="select-title" href="#" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									{$active_found = false}
									<span>
										{foreach from=$facet.filters item="filter"}
											{if $filter.active}
												{$filter.label}
												{if $filter.magnitude and $show_quantities}
													({$filter.magnitude})
												{/if}
												{$active_found = true}
											{/if}
										{/foreach}
										{if !$active_found}
											{l s='(no filter)' d='Shop.Theme.Global'}
										{/if}
									</span>
									<i class="las la-angle-down"></i>
								</a>
								<div class="dropdown-menu">
									{foreach from=$facet.filters item="filter"}
										<a rel="nofollow" href="{$filter.nextEncodedFacetsURL}" class="select-list js-search-link{if $filter.active } current{/if}">
											{$filter.label}
											{if $filter.magnitude and $show_quantities}
												({$filter.magnitude})
											{/if}
										</a>
									{/foreach}
								</div>
							</div>
						{/block}
					{elseif $facet.widgetType == 'slider'}
						{block name='facet_item_slider'}
							{foreach from=$facet.filters item="filter"}
								{assign var="_nextEncodedFacetsURL" value=$filter.nextEncodedFacetsURL|regex_replace:"/page=\d+/":"page=1"}
								<div
									class="faceted-slider facet-wrapper-content"
									data-slider-min="{$facet.properties.min}"
									data-slider-max="{$facet.properties.max}"
									data-slider-id="{$_expand_id}"
									data-slider-values="{$filter.value|@json_encode}"
									data-slider-unit="{$facet.properties.unit}"
									data-slider-label="{$facet.label}"
									data-slider-specifications="{$facet.properties.specifications|@json_encode}"
									data-slider-encoded-url="{$_nextEncodedFacetsURL}"
								>
									<p id="facet_label_{$_expand_id}">
										{$filter.label}
									</p>
									<div id="slider-range_{$_expand_id}"></div>
								</div>
							{/foreach}
						{/block}
					{/if}
				</div>
			</div>
		{/foreach}
	</div>
{/if}
