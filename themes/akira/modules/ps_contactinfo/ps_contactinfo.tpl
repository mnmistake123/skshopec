{*
* 2007-2019 PrestaShop and Contributors
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2019 PrestaShop SA and Contributors
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
	
{if $contact_infos.phone}
	<a href="tel:{$contact_infos.phone|replace:' ':''}" class="btn-canvas btn-canvas-phone"><i class="las la-phone"></i><span class="btn-canvas-text">{$contact_infos.phone}</span></a>
{/if}
	
{if $contact_infos.email && $display_email}
	<a href="mailto:{$contact_infos.email}" class="btn-canvas btn-canvas-email"><i class="las la-envelope"></i><span class="btn-canvas-text">{$contact_infos.email}</span></a>
{/if}
	
{if !$contact_infos.phone && !$contact_infos.email}
	<a href="{$urls.pages.contact}" class="btn-canvas btn-canvas-link"><i class="las la-envelope"></i><span class="btn-canvas-text">{l s='Contact us' d='Shop.Theme.Global'}</span></a>
{/if}