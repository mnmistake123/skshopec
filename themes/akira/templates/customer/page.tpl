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
{extends file='page.tpl'}

{block name='notifications'}{/block}
	
{block name='page_header_title'}
	{l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}
	 
{block name='page_content_container'}
	<section id="content" class="page-content">
		{if $customer.is_logged}
			<div class="row my-account-page-content">
				<div class="col-lg-3 my-account-links">
					  <a class="col-lg-3 col-md-4 col-sm-6 col-xs-6" id="identity-link" href="{$urls.pages.identity}">
						<span class="link-item">
						  <i class="las la-user-circle"></i>
						  {l s='Information' d='Shop.Theme.Customeraccount'}
						</span>
					  </a>

					  {if $customer.addresses|count}
						<a class="col-lg-3 col-md-4 col-sm-6 col-xs-6" id="addresses-link" href="{$urls.pages.addresses}">
						  <span class="link-item">
							<i class="las la-map-signs"></i>
							{l s='Addresses' d='Shop.Theme.Customeraccount'}
						  </span>
						</a>
					  {else}
						<a class="col-lg-3 col-md-4 col-sm-6 col-xs-6" id="address-link" href="{$urls.pages.address}">
						  <span class="link-item">
							<i class="las la-map-signs"></i>
							{l s='Add first address' d='Shop.Theme.Customeraccount'}
						  </span>
						</a>
					  {/if}

					  {if !$configuration.is_catalog}
						<a class="col-lg-3 col-md-4 col-sm-6 col-xs-6" id="history-link" href="{$urls.pages.history}">
						  <span class="link-item">
							<i class="las la-calendar"></i>
							{l s='Order history and details' d='Shop.Theme.Customeraccount'}
						  </span>
						</a>
					  {/if}

					  {if !$configuration.is_catalog}
						<a class="col-lg-3 col-md-4 col-sm-6 col-xs-6" id="order-slips-link" href="{$urls.pages.order_slip}">
						  <span class="link-item">
							<i class="las la-receipt"></i>
							{l s='Credit slips' d='Shop.Theme.Customeraccount'}
						  </span>
						</a>
					  {/if}

					  {if $configuration.voucher_enabled && !$configuration.is_catalog}
						<a class="col-lg-3 col-md-4 col-sm-6 col-xs-6" id="discounts-link" href="{$urls.pages.discount}">
						  <span class="link-item">
							<i class="las la-tags"></i>
							{l s='Vouchers' d='Shop.Theme.Customeraccount'}
						  </span>
						</a>
					  {/if}

					  {if $configuration.return_enabled && !$configuration.is_catalog}
						<a class="col-lg-3 col-md-4 col-sm-6 col-xs-6" id="returns-link" href="{$urls.pages.order_follow}">
						  <span class="link-item">
							<i class="las la-reply"></i>
							{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
						  </span>
						</a>
					  {/if}

					  {block name='display_customer_account'}
						{hook h='displayCustomerAccount'}
					  {/block}

					  <a class="col-lg-3 col-md-4 col-sm-6 col-xs-6" href="{$urls.actions.logout}" title="{l s='Sign out' d='Shop.Theme.Actions'}">
						  <span class="link-item">
							<i class="las la-sign-out-alt"></i>
							{l s='Sign out' d='Shop.Theme.Actions'}
						  </span>
					  </a>
				</div>
				<div class="col-lg-9 my-account-content">
					{block name='page_title' hide}
						<h4>{$smarty.block.child}</h4>
					{/block}
					{block name='page_content_top'}
						{block name='customer_notifications'}
							{include file='_partials/notifications.tpl'}
						{/block}
					{/block}
					{block name='page_content'}
					<!-- Page content -->
					{/block}
				</div>
			{else}
				{block name='page_content_top'}
					{block name='customer_notifications'}
						{include file='_partials/notifications.tpl'}
					{/block}
				{/block}
				{block name='page_content'}
				<!-- Page content -->
				{/block}
			{/if}
		</div>
	</section>
{/block}

{block name='page_footer'}
	{block name='my_account_links'}
		
	{/block}
{/block}
