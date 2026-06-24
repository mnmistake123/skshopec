{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
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
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{if $facets|count}
  <div id="search_filters" class="js-search-filters">
    {foreach from=$facets item="facet" name="facet"}
      {if !$facet.displayed}
        {continue}
      {/if}
        <div class="facet clearfix">          
          {assign var=_expand_id value=10|mt_rand:100000}
          {assign var=_collapse value=true}
          {foreach from=$facet.filters item="filter"}
            {if $filter.active}{assign var=_collapse value=false}{/if}
          {/foreach}  
			
          <div class="title hidden-md-down">
			<div class="h4 facet-title"><span>{$facet.label}</span></div>
          </div>
			
          <div class="title hidden-lg-up" data-target="#facet_{$_expand_id}" data-toggle="collapse"{if !$_collapse} aria-expanded="true"{/if}>
			<div class="h4 facet-title"><span>{$facet.label}</span></div>
			<span class="navbar-toggler collapse-icons">
				<i class="las la-angle-up add"></i>
				<i class="las la-angle-down remove"></i>
			</span>
          </div>

          {if $facet.widgetType !== 'dropdown'}

            {block name='facet_item_other'}
              <ul id="facet_{$_expand_id}" class="facet-type-{$facet.widgetType} collapse{if !$_collapse} in{/if}">
                {foreach from=$facet.filters key=filter_key item="filter" name="filter_"}
					{if !$filter.displayed}
					  {continue}
					{/if}
                    <li {if isset($filter.properties.color) || isset($filter.properties.texture)} class="facet_color"{/if}>
                      <label class="facet-label{if $filter.active} active{/if}" for="facet_input_{$_expand_id}_{$filter_key}">
                        {if $facet.multipleSelectionAllowed}
                          <span class="custom-checkbox">
                            <input
                              id="facet_input_{$_expand_id}_{$filter_key}"
                              data-search-url="{$filter.nextEncodedFacetsURL}"
                              type="checkbox"
                              {if $filter.active } checked {/if}
                            >
                            {if isset($filter.properties.texture)}
                              <span class="color texture" style="background-image:url({$filter.properties.texture})">
                                 <span class="corlor-tooltip">
                                   <span class="bg-tooltip" style="background-image:url({$filter.properties.texture})"></span>
                                   <span class="name-tooltip">{$filter.label}({$filter.magnitude})</span>
                                 </span>
                              </span>
                            {elseif isset($filter.properties.color)}
                              <span class="color" style="background-color:{$filter.properties.color}">
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
                            <input
                              id="facet_input_{$_expand_id}_{$filter_key}"
                              data-search-url="{$filter.nextEncodedFacetsURL}"
                              type="radio"
                              name="filter {$facet.label}"
                              {if $filter.active } checked {/if}
                            >
                            <span {if !$js_enabled} class="ps-shown-by-js" {/if}></span>
                          </span>
                        {/if}
						{if !isset($filter.properties.color) && !isset($filter.properties.texture)}
                            <span class="title-search">
                              {$filter.label}
                              {if $filter.magnitude}
                                <span class="magnitude">({$filter.magnitude})</span>
                              {/if}
                            </span>
                        {/if}
                      </label>
                    </li>
					{if isset($filter.properties.color) || isset($filter.properties.texture)} 
						{if $smarty.foreach.filter_.last}<li class="facet_color"></li>{/if}
					{/if}
                {/foreach}
              </ul>
            {/block}

          {else}

            {block name='facet_item_dropdown'}
              <ul id="facet_{$_expand_id}" class="collapse{if !$_collapse} in{/if}">
                <li>
                  <div class="facet-dropdown dropdown">
                    <a class="select-title" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      {$active_found = false}
                      <span>
                        {foreach from=$facet.filters item="filter"}
                          {if $filter.active}
                            {$filter.label}
                            {if $filter.magnitude}
                              ({$filter.magnitude})
                            {/if}
                            {$active_found = true}
                          {/if}
                        {/foreach}
                        {if !$active_found}
                          {l s='(no filter)' d='Shop.Theme.Global'}
                        {/if}
                      </span>
                      <i class="las la-angle-down float-xs-right"></i>
                    </a>
                    <div class="dropdown-menu">
                      {foreach from=$facet.filters item="filter"}
                        {if !$filter.active}
                          <a
                            rel="nofollow"
                            href="{$filter.nextEncodedFacetsURL}"
                            class="select-list js-search-link"
                          >
                            {$filter.label}
                            {if $filter.magnitude}
                              ({$filter.magnitude})
                            {/if}
                          </a>
                        {/if}
                      {/foreach}
                    </div>
                  </div>
                </li>
              </ul>
            {/block}

          {/if}
        </div>
    {/foreach}
  </div>
{/if}
