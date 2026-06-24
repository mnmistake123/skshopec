{**
 * 2007-2019 PrestaShop and Contributors
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
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
	 
{extends file='layouts/layout-both-columns.tpl'}

{block name='left_column'}{/block}

{block name='content_wrapper'}
  <div id="content-wrapper" class="right-column cart-grid-body col-xs-12 col-lg-8">
  	<div id="main-content">
        {hook h="displayContentWrapperTop"}
            {block name="content"}
				<div class="cart-container">
					{block name='cart_overview'}
						{include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
					{/block}
				</div>
				<!-- shipping informations -->
				{block name='hook_shopping_cart_footer'}
				  {hook h='displayShoppingCartFooter'}
				{/block}
            {/block}
        {hook h="displayContentWrapperBottom"}
    </div>
  </div>
{/block}

{block name="right_column"}
    <div id="right-column" class="cart-grid-right col-xs-12 col-lg-4">
        <div id="right-content">
			{block name="right_content"}
				{block name='cart_summary'}
				  <div class="ax-cart-summary cart-summary">

					{block name='hook_shopping_cart'}
					  {hook h='displayShoppingCart'}
					{/block}

					{block name='cart_totals'}
					  {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
					{/block}

					{block name='cart_actions'}
					  {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
					{/block}

				  </div>
				{/block}

				{block name='hook_reassurance'}
				  {hook h='displayReassurance'}
				{/block}
			{/block}
        </div>
    </div>
{/block}	 
