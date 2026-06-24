{**
 * 2007-2016 PrestaShop
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
 * @copyright 2007-2016 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='layouts/layout-both-columns.tpl'}
	 	 	 	 
{block name='block_full_width'}
	{if isset($opThemect.contact_override_content_by_hook) && $opThemect.contact_override_content_by_hook}
		{hook h='displayContactPageBuilder'}
	{else}
		<div class="container container-parent">
			<div class="row">
				{block name='content_wrapper'}
				  <div id="content-wrapper" class="{if $layout === 'layouts/layout-left-column.tpl'}left-column col-lg-8 {else if $layout === 'layouts/layout-right-column.tpl'}right-column col-lg-8 {/if}col-xs-12">
					<div id="main-content">
						{hook h="displayContentWrapperTop"}
							{block name="content"}
								{widget name="contactform"}
							{/block}
						{hook h="displayContentWrapperBottom"}
					</div>
				  </div>
				{/block}
				{if $layout === 'layouts/layout-left-column.tpl'}
					{block name="left_column"}
						<div id="left-column" class="col-xs-12 col-lg-4">
							<div id="left-content">
								{block name="left_content"}
									{widget name="ps_contactinfo" hook='displayLeftColumn'}
								{/block}
							</div>
						</div>
					{/block}
					{block name='right_column'}{/block}
				{else if $layout === 'layouts/layout-right-column.tpl'}
					{block name="right_column"}
						<div id="right-column" class="col-xs-12 col-lg-4">
							<div id="right-content">
								{block name="right_content"}
									{widget name="ps_contactinfo" hook='displayLeftColumn'}
								{/block}
							</div>
						</div>
					{/block}
					{block name='right_column'}{/block}
				{else}
					 {block name="left_column"}{/block}
					 {block name="right_column"}{/block}
				{/if} 
			</div>
		</div>
	{/if} 
{/block}
