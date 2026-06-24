<div id="canvas-my-account" class="canvas-widget canvas-right">
    <div class="canvas-widget-top">
		<h3 class="title-canvas-widget" data-dismiss="canvas-widget">
            {if !Context::getContext()->customer->isLogged()}
                {l s='Sign in' d='Shop.Theme.Actions'}
            {else}
                {l s='My Account' d='Shop.Theme.Axon'}
            {/if}
        </h3>
	</div>
	<div class="canvas-widget-content">
		<div class="wrapper-scroll">
			<div class="wrapper-scroll-content">
				<div class="canvas-my-account-wrapper">
					{if !Context::getContext()->customer->isLogged()}
						<form action="index.php?controller=authentication?back={$urls.current_url|urlencode}" method="post">
							<div class="form-group">
								<label class="required">{l s='Email' d='Shop.Theme.Axon'}</label>
								<input class="form-control" name="email" type="email" value="" required>
							</div>
							<div class="form-group">
								<label class="required">{l s='Password' d='Shop.Theme.Axon'}</label>
								<div class="input-group">
									<input class="form-control js-child-focus js-visible-password" name="password" type="password" value="" pattern=".{literal}{{/literal}5,{literal}}{/literal}" required>
									<button type="button" data-action="show-password-t" data-text-show="{l s='Show' d='Shop.Theme.Actions'}" data-text-hide="{l s='Hide' d='Shop.Theme.Actions'}">
										{l s='Show' d='Shop.Theme.Actions'}
									</button>
								</div>  
							</div>
							<div class="clearfix">
								<input name="submitLogin" value="1" type="hidden">
								<button class="btn btn-full btn-primary" data-link-action="sign-in" type="submit">
									{l s='Sign in' d='Shop.Theme.Actions'}
								</button>
							</div>
							<div class="forgot-password">
								<a href="{$urls.pages.password}" rel="nofollow">
									{l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
								</a>
							</div>
						  </form>
						  <div class="no-account">
							<span>{l s='No account?' d='Shop.Theme.Customeraccount'}</span>  
							<a class="active-color" href="{$urls.pages.register}">
							  {l s='Create one here' d='Shop.Theme.Customeraccount'}
							</a>
						  </div>
						  <div class="text-center">
							   {hook h='displaySocialLogin'}
						  </div>
					  {else}
						<div class="sb-account-info">
							<p>
								<a href="{$urls.pages.my_account}" title="{l s='My Account' d='Shop.Theme.Axon'}"> 
									 <i class="las la-user-circle"></i>
								</a>
								<a href="{$urls.pages.my_account}" title="{l s='My Account' d='Shop.Theme.Axon'}"> 
									 {l s='Hi' d='Shop.Theme.Axon'} {Context::getContext()->customer->firstname} {Context::getContext()->customer->lastname}
								</a>
							</p>	
							<p>
								<a href="{$urls.actions.logout}" title="{l s='Sign out' d='Shop.Theme.Actions'}">
									{l s='Sign out' d='Shop.Theme.Actions'}
								</a>
							</p>
						</div>
					{/if}
					{hook h='displayMyAccountCanVas'}
					{if Context::getContext()->customer->isLogged()}
						<a class="sb-item" href="{$urls.pages.identity}" title="{l s='Information' d='Shop.Theme.Customeraccount'}">
							<i class="las la-user"></i>
							<span>
								{l s='Information' d='Shop.Theme.Customeraccount'}
							</span>
						</a>
						{if $customer.addresses|count}
							<a class="sb-item" href="{$urls.pages.addresses}" title="{l s='Addresses' d='Shop.Theme.Customeraccount'}">
								<i class="las la-map-signs"></i>
								<span>
									{l s='Addresses' d='Shop.Theme.Customeraccount'}
								</span>
							</a>
						{else}
							<a class="sb-item" href="{$urls.pages.address}" title="{l s='Add first address' d='Shop.Theme.Customeraccount'}">
								<i class="las la-map-signs"></i>
								<span>	
									{l s='Add first address' d='Shop.Theme.Customeraccount'}
								</span>
							</a>
						{/if}
						{if !$configuration.is_catalog}
							<a class="sb-item" href="{$urls.pages.history}" title="{l s='Order history and details' d='Shop.Theme.Customeraccount'}">
								<i class="las la-calendar"></i>
								<span>
									{l s='Order history and details' d='Shop.Theme.Customeraccount'}
								</span>
							</a>
						{/if}
						{if !$configuration.is_catalog}
							<a class="sb-item" href="{$urls.pages.order_slip}" title="{l s='Credit slips' d='Shop.Theme.Customeraccount'}">
								<i class="las la-receipt"></i>
								<span>
									{l s='Credit slips' d='Shop.Theme.Customeraccount'}
								</span>
							</a>
						{/if}
						{if $configuration.voucher_enabled && !$configuration.is_catalog}
							<a class="sb-item" href="{$urls.pages.discount}" title="{l s='Vouchers' d='Shop.Theme.Customeraccount'}">
								<i class="las la-tags"></i>
								<span>
									{l s='Vouchers' d='Shop.Theme.Customeraccount'}
								</span>
							</a>
						{/if}
						{if $configuration.return_enabled && !$configuration.is_catalog}
							<a class="sb-item" href="{$urls.pages.order_follow}" title="{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}">
								<i class="las la-reply"></i>
								<span>
									{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
								</span>
							</a>
						{/if}
					{/if}
					<a 	class="sb-item" href="/content/5-contactanos" title="{l s='Contact us' d='Shop.Theme.Global'}">
						<i class="las la-envelope"></i>
						<span>
							{l s='Contact us' d='Shop.Theme.Global'}
						</span>
					</a>
					{if Module::isEnabled('ps_languageselector')}
						{$module_lg = Module::getInstanceByName('ps_languageselector')}
						{$md_lg = $module_lg->getWidgetVariables(null, [])}

                        {if ($md_lg.languages|count) > 1}
                            <div class="dropdown">
                                <div class="sb-item" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">
                                    <img src="{$urls.img_lang_url}{$md_lg.current_language.id_lang}.jpg" alt="{$md_lg.current_language.name_simple}" width="16" height="11" />
                                    <span>
                                        {$md_lg.current_language.name_simple}
                                    </span>	
                                </div>
                                <ul class="dropdown-menu">
                                    {foreach from=$md_lg.languages item=language}
                                        <li {if $language.id_lang == $md_lg.current_language.id_lang} class="current" {/if}>
                                            <a href="{url entity='language' id=$language.id_lang}">
                                                <img src="{$urls.img_lang_url}{$language.id_lang}.jpg" alt="{$language.iso_code}" width="16" height="11"/>
                                            {$language.name_simple}
                                            </a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        {/if}
					{/if}
					{if Module::isEnabled('ps_currencyselector')}
						{$module_cs = Module::getInstanceByName('ps_currencyselector')}
						{$md_cs = $module_cs->getWidgetVariables(null, [])}

                        {if (!Configuration::isCatalogMode() && Currency::isMultiCurrencyActivated())}
                            <div class="dropdown">
                                <div class="sb-item" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">
                                    <i class="las la-money-bill"></i>
                                    <span>
                                        {$md_cs.current_currency.iso_code} {$md_cs.current_currency.sign}
                                    </span>	
                                </div>
                                <ul class="dropdown-menu">
                                    {foreach from=$md_cs.currencies item=currency}
                                    <li {if $currency.current} class="current" {/if}>
                                        <a title="{$currency.name}" rel="nofollow" href="{$currency.url}">
                                            {$currency.iso_code} {$currency.sign}
                                        </a>
                                    </li>
                                    {/foreach}
                                </ul>
                            </div>
                        {/if}
					{/if}
				</div>
			</div>
		</div>
	</div>
</div>