{*
* 2007-2015 PrestaShop
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
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="contact-rich">
  <div class="form-group row">
	<div class="col-md-12">
	  <h3>{l s='INFORMATION' d='Shop.Theme.Global'}</h3>
	</div>
  </div>
  <p class="info-contact">{l s='For any feedbacks or improvements on our online store, please fill in this contact form. We will take a look and reply you within 24 hours. We always need your feedbacks to continuously leverage your shopping experience.' d='Shop.Theme.Global'}</p>
  {if $contact_infos.phone}
    <div class="block">
      <div class="icon"><i class="las la-phone"></i></div>
      <div class="data">
        <a href="tel:{$contact_infos.phone|replace:' ':''}">{$contact_infos.phone}</a>
       </div>
    </div>
  {/if}
  {if $contact_infos.fax}
    <div class="block">
      <div class="icon"><i class="las la-fax"></i></div>
      <div class="data">
        {$contact_infos.fax}
      </div>
    </div>
  {/if}
  {if $contact_infos.email && $display_email}
    <div class="block">
      <div class="icon"><i class="las la-envelope"></i></div>
      <div class="data">
       <a href="mailto:{$contact_infos.email}">{$contact_infos.email}</a>
       </div>
    </div>
  {/if}
  <div class="block">
    <div class="icon"><i class="las la-map-marked-alt"></i></div>
    <div class="data">{$contact_infos.address.formatted nofilter}</div>
  </div>
</div>