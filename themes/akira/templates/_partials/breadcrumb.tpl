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

<nav data-depth="{$breadcrumb.count}" class="breadcrumb hidden-sm-down">
  <ol>
    {block name='breadcrumb'}
      {foreach from=$breadcrumb.links item=path name=breadcrumb}
        {block name='breadcrumb_item'}
          <li>
            {if not $smarty.foreach.breadcrumb.last}
              <a href="{$path.url}"><span>{$path.title}</span></a>
            {else}
              <span>{$path.title}</span>
            {/if}
          </li>
        {/block}
      {/foreach}
    {/block}
  </ol>
</nav>
 **}

{if count($breadcrumb.links) == 1 || !$breadcrumb.links[1]}
	{if $page.page_name == 'checkout'}
		{$breadcrumb.links[1]['title'] = {l s='Checkout' d='Shop.Theme.Axon'}}
	{else}
		{$breadcrumb.links[1]['title'] = {$page.meta.title}}
	{/if}
	{$breadcrumb.links[1]['url'] = {$urls.current_url}}
{/if}
	 
{block name='bg_page_header_title'}{/block}

{if isset($opThemect.page_title_layout) && $opThemect.page_title_layout}
	<div class="page-title page-title-layout-{$opThemect.page_title_layout} title-text-color-{if isset($opThemect.page_title_color) && $opThemect.page_title_color}{$opThemect.page_title_color}{else}default{/if}" {if isset($opThemect.bg_page_title_img) && $opThemect.bg_page_title_img}style="background-image: url('{$opThemect.bg_page_title_img}')"{/if}>
		<div class="container container-parent">
			{block name='wrapper_page_header_title'}
				<h1 class="h1">
					{block name='page_header_title'}
						{$breadcrumb.links[count($breadcrumb.links)-1]['title']}
					{/block}
				</h1>
			{/block}
			<nav class="axps-breadcrumb" data-depth="{$breadcrumb.count}">
				{foreach from=$breadcrumb.links item=path name=breadcrumb}
                    {if $path.title}
                        {if not $smarty.foreach.breadcrumb.last}
                            <a href="{$path.url}"><span>{$path.title}</span></a>
                        {else}
                            <span>{$path.title}</span>
                        {/if}
                    {/if}
				{/foreach}
			</nav>				
		</div>
	</div>
{/if}