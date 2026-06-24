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
{extends file='customer/page.tpl'}
	 
{block name='page_title'}
  {l s='Dashboard' d='Shop.Theme.Axon'}
{/block}
	 
{block name='page_content'}
	<p>{l s='Hello' d='Shop.Theme.Axon'}<b class="label"> {Context::getContext()->customer->firstname} {Context::getContext()->customer->lastname}</b></p>	
	<p>{l s='From your account dashboard you can view your recent orders, manage your shipping and billing addresses, and edit your password and account details.' d='Shop.Theme.Axon'}</p>	
{/block}
	 
{block name='page_footer'}
  {block name='my_account_links'}

  {/block}
{/block}
