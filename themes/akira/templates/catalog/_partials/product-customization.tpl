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
<section class="product-customization js-product-customization">
{if !$configuration.is_catalog}
<div id="moda_product_customization" class="modal" tabindex="-1" role="dialog" aria-hidden="true"><div class="modal-dialog" role="document">
    <div class="modal-content">
		<button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
			<span aria-hidden="true">&times;</span>
		</button>
		<div class="modal-body">
		  <h4 class="modal-title">
			{l s='Product customization' d='Shop.Theme.Catalog'}
		  </h4>	
		  <p>{l s='Don\'t forget to save your customization to be able to add to cart' d='Shop.Forms.Help'}</p>
		  {block name='product_customization_form'}
			<form method="post" action="{$product.url}" enctype="multipart/form-data">
				{foreach from=$customizations.fields item="field"}
				<div class="form-group row ">
					<label class="col-xs-12 form-control-label {if $field.required} required {/if}" for="field-{$field.input_name}">
						{$field.label}
					</label>
					<div class="col-xs-12">
						{if $field.type == 'text'}
						  <textarea placeholder="{l s='Your message here' d='Shop.Forms.Help'}" class="product-message form-control" maxlength="250" {if $field.required} required {/if} name="{$field.input_name}" id="field-{$field.input_name}"></textarea>
						  <small class="float-xs-right">{l s='250 char. max' d='Shop.Forms.Help'}</small>
						  {if $field.text !== ''}
							  <h6 class="customization-message">{l s='Your customization:' d='Shop.Theme.Catalog'}
								  <label>{$field.text}</label>
							  </h6>
						  {/if}
						{elseif $field.type == 'image'}
						  {if $field.is_customized}
							<img src="{$field.image.small.url}" loading="lazy">
							<a class="remove-image" href="{$field.remove_image_url}" rel="nofollow">{l s='Remove Image' d='Shop.Theme.Actions'}</a>
							<br>
						  {/if}
						  <span class="custom-file">
							<span class="js-file-name">{l s='No selected file' d='Shop.Forms.Help'}</span>
							<input class="file-input js-file-input" {if $field.required} required {/if} type="file" name="{$field.input_name}" id="field-{$field.input_name}">
							<button class="btn btn-primary">{l s='Choose file' d='Shop.Theme.Actions'}</button>
						  </span>
						  <small class="float-xs-right">{l s='.png .jpg .gif' d='Shop.Forms.Help'}</small>
						{/if}
					</div>
				  </div>
				{/foreach}
			  <div class="clearfix">
				<button class="btn btn-primary btn-full" type="submit" name="submitCustomizedData">{l s='Save Customization' d='Shop.Theme.Actions'}</button>
			  </div>
			</form>
		  {/block}
		</div>
    </div>
</div></div>
{/if}
</section>
