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
{extends file='layouts/layout-both-columns.tpl'}

{block name='left_column'}{/block}

{block name='content_wrapper'}
  <div id="content-wrapper" class="right-column col-xs-12 col-lg-8">
  	<div id="main-content">
        {hook h="displayContentWrapperTop"}
            {block name="content"}
                {block name='checkout_process'}
                    {render file='checkout/checkout-process.tpl' ui=$checkout_process}
                {/block}
            {/block}
        {hook h="displayContentWrapperBottom"}
    </div>
  </div>
{/block}

{block name="right_column"}
    <div id="right-column" class="col-xs-12 col-lg-4">
        <div id="right-content">
			{block name="right_content"}
				{block name='cart_summary'}
					{include file='checkout/_partials/cart-summary.tpl' cart = $cart}
				{/block}
				{hook h='displayReassurance'}
			{/block}
        </div>
    </div>
{/block}

{block name='block_modal_checkout'}
  <div class="modal" id="modal"><div class="modal-dialog modal-conditions" role="document">
      <div class="modal-content">
		<button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
			<span aria-hidden="true">&times;</span>
		</button>  
		<div class="modal-body">  
        	<div class="js-modal-content">
				<i style="font-size: 24px;" class="las la-circle-notch la-spin"></i>
			</div>
		</div>
      </div>
    </div></div>
{/block}
