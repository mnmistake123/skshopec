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
{block name='axps_html'}
	<!doctype html>
	<html lang="{$language.locale}">
		<head>
			{block name='head'}
				{include file='_partials/head.tpl'}
			{/block}
		</head>

		<body id="{$page.page_name}" class="{$page.body_classes|classnames}{if isset($opThemect.general_main_layout)} {$opThemect.general_main_layout}{/if}{if isset($cart.products) && $cart.products|count < 1} cart-is-empty{/if}{if isset($opThemect.general_column_space)} col-space-lg-{$opThemect.general_column_space}{/if}{if isset($opThemect.header_overlap)} header-is-overlap{/if}{if isset($opThemect.product_label)} product-label-{$opThemect.product_label}{/if}{if Context::getContext()->language->is_rtl} rtl{/if}{if isset($opThemect.open_vertical_menu) && $opThemect.open_vertical_menu} allways_show_menu{/if}">
			{block name='hook_after_body_opening_tag'}
			  {hook h='displayAfterBodyOpeningTag'}
			{/block}
			<main>
				{block name='product_activation'}
					{include file='catalog/_partials/product-activation.tpl'}
				{/block}      
				<header id="header">
					{block name='header'}
						{include file='_partials/header.tpl'}
					{/block}
				</header>
				<section id="wrapper">
					{hook h="displayWrapperTop"}
					{block name='breadcrumb'}
						{include file='_partials/breadcrumb.tpl'}
					{/block}
					{block name='notifications'}
						{include file='_partials/notifications.tpl'}
					{/block}
					{block name='block_full_width'}
						<div class="container container-parent">
							<div class="row">
								{block name="content_wrapper"}
									<div id="content-wrapper" class="js-content-wrapper left-column right-column col-xs-12 col-lg-6">
										<div id="main-content">
											{hook h="displayContentWrapperTop"}
											{block name="content"}
												<p>Hello world! This is HTML5 Boilerplate.</p>
											{/block}
											{hook h="displayContentWrapperBottom"}
										</div>
									</div>
								{/block}
								{block name="left_column"}
									<div id="left-column" class="col-xs-12 col-lg-3">
										<div id="left-content">
											{block name="left_content"}
												{hook h="displayLeftColumn"}
											{/block}
										</div>
									</div>
								{/block}
								{block name="right_column"}
									<div id="right-column" class="col-xs-12 col-lg-3">
										<div id="right-content">
											{block name="right_content"}
												{hook h="displayRightColumn"}
											{/block}
										</div>
									</div>
								{/block}
							</div>
						</div>
					{/block}
					{hook h="displayWrapperBottom"}
				</section>
				<footer id="footer" class="js-footer">
					{block name="footer"}
						{include file="_partials/footer.tpl"}
					{/block}
				</footer>
			</main>

			{block name='javascript_bottom'}
			  {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
			{/block}

			{block name='hook_before_body_closing_tag'}
			  {hook h='displayBeforeBodyClosingTag'}
			{/block}

			{hook h='displayBodyBottom'}

			{block name='block_modal_checkout'}{/block}
		</body>
	</html>
{/block}
