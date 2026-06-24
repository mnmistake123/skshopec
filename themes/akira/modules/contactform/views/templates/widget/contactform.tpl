<section class="contact-form">
  <form action="{$urls.pages.contact}#main-content" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>
	<div class="form-group row">
		<div class="col-md-12">
		  <h3>{l s='LEAVE A MESSAGE' d='Shop.Theme.Global'}</h3>
		</div>
	</div>
    {if $notifications}
        <div class="row">
            <div class="col-xs-12">
                <div class="alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
                    <ul style="margin:0;">
                        {foreach $notifications.messages as $notif}
                            <li>{$notif}</li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
    {/if}
	{if !$notifications || $notifications.nw_error}
		<section class="form-fields">
		  <div class="form-group row">
            <label class="col-xs-12 form-control-label" for="id_contact">{l s='Subject' d='Shop.Forms.Labels'}</label>
			<div class="col-xs-12">
			  <select name="id_contact" id="id_contact" class="form-control form-control-select">
				{foreach from=$contact.contacts item=contact_elt}
				  <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
				{/foreach}
			  </select>
			</div>
		  </div>

		  <div class="form-group row">
            <label class="col-xs-12 form-control-label" for="email">{l s='Email address' d='Shop.Forms.Labels'}</label>
			<div class="col-xs-12">
			  <input
                id="email"
				class="form-control"
				name="from"
				type="email"
				value="{$contact.email}"
				placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
			  >
			</div>
		  </div>

		  {if $contact.orders}
			<div class="form-group row">
              <label class="col-xs-12 form-control-label" for="id-order">{l s='Order reference' d='Shop.Forms.Labels'}</label>
			  <div class="col-xs-12">
				<select name="id_order" id="id-order" class="form-control form-control-select">
				  <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
				  {foreach from=$contact.orders item=order}
					<option value="{$order.id_order}">{$order.reference}</option>
				  {/foreach}
				</select>
			  </div>
			</div>
		  {/if}

		  {if $contact.allow_file_upload}
			<div class="form-group row">
              <label class="col-xs-12 form-control-label" for="file-upload">{l s='Attachment' d='Shop.Forms.Labels'}</label>
			  <div class="col-xs-12">
				<div class="group-file-style">  
					<input type="file" id="file-upload" name="fileUpload" class="filestyle" data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
				</div>
			  </div>
			</div>
		  {/if}

		  <div class="form-group row">
            <label class="col-xs-12 form-control-label" for="contactform-message">{l s='Message' d='Shop.Forms.Labels'}</label>
			<div class="col-xs-12">
			  <textarea
                id="contactform-message"
				class="form-control"
				name="message"
				placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
				rows="3"
			  >{if $contact.message}{$contact.message}{/if}</textarea>
			</div>
		  </div>
			{if isset($id_module)}
			  <div class="form-group row">
				<div class="col-xs-12">
				  {hook h='displayGDPRConsent' id_module=$id_module}
				</div>
			  </div>
			{/if}
            {hook h='displayNrtCaptchaContact'}
		</section>

		<footer class="form-footer">
			<style>
			  input[name=url] {
				display: none !important;
			  }
			</style>
			<input type="text" name="url" value=""/>
			<input type="hidden" name="token" value="{$token}" />
			<button class="btn btn-primary" type="submit" name="submitMessage" value="{l s='Send message' d='Shop.Theme.Actions'}">{l s='Send message' d='Shop.Theme.Actions'}</button>
		</footer>
	{/if}
	<div class="send-response"></div>
  </form>
</section>
