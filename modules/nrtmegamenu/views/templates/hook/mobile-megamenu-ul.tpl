{*
*
* 2017 AxonVIP
*
* NOTICE OF LICENSE
*
*  @author AxonVIP <axonvip@gmail.com>
*  @copyright  2017 axonvip.com
*   
*
*}
	
{function name="axps_menumobile_tpl" mm=[] depth=0}
	{strip}
		<li class="nrt_mo_mega_{$mm.id_nrt_mega_menu} mo_element_li_depth_{$depth} mo_ml_column">
			{assign var='has_children' value=(isset($mm.column) && count($mm.column))}
			<div class="menu_a_wrap{if $has_children} menu-item-has-children{/if}">
			<a href="{if $mm.m_link}{$mm.m_link}{else}javascript:void(0){/if}" class="mo_element_a_{$mm.id_nrt_mega_menu} mo_element_a_depth_{$depth}"{if !$menu_title} title="{$mm.m_title}"{/if}{if $mm.nofollow} rel="nofollow"{/if}{if $mm.new_window} target="_blank"{/if}>{if $mm.m_icon}{$mm.m_icon nofilter}{else}{if $mm.icon_class}{$icon_class_value = $mm.icon_class|json_decode:1}{if $icon_class_value.type == 1}<img class="icon-img img-responsive" src="{$icon_class_value.value}" alt=""/>{else}<i class="{$icon_class_value.value}"></i>{/if}{/if}<span>{$mm.m_name}</span>{/if}{if $mm.cate_label}<span class="cate_label">{$mm.cate_label}</span>{/if}</a>
			{if $has_children}<span class="icon-opener js-opener-menu"></span>{/if}
			</div>
			{if $has_children}
				<ul class="mo_element_ul_depth_{$depth + 1} mo_sub_ul">
				{foreach $mm.column as $column}
					{if $column.hide_on_mobile == 1}{continue}{/if}
					{if isset($column.children) && count($column.children)}
						{foreach $column.children as $block}
							{if $block.hide_on_mobile == 1}{continue}{/if}
							{if $block.item_t==1}
								{if $block.subtype==2  && isset($block.children)}
									<li class="nrt_mo_mega_block_{$block.id_nrt_mega_menu} mo_element_li_depth_{$depth + 1} mo_sub_li">
										{assign var='has_children' value=(isset($block.children.children) && is_array($block.children.children) && count($block.children.children))}
										<div class="menu_a_wrap{if $has_children} menu-item-has-children{/if}">
										<a href="{if $block.children.link}{$block.children.link}{else}javascript:void(0){/if}"{if !$menu_title} title="{$block.children.name}"{/if}{if $block.nofollow} rel="nofollow"{/if}{if $block.new_window} target="_blank"{/if} class="mo_element_a_{$block.id_nrt_mega_menu} mo_element_a_depth_{$depth + 1} mo_sub_a">{$block.children.name}{if $block.cate_label}<span class="cate_label">{$block.cate_label}</span>{/if}</a>
											{if $has_children}
											<span class="icon-opener js-opener-menu"></span>
											{/if}
										</div>
										{if $has_children}
											<ul class="mo_element_ul_depth_{$depth + 2} mo_sub_ul">
											{foreach $block.children.children as $product}
											<li class="mo_element_li_depth_{$depth + 2} mo_sub_li"><a href="{$product.link}"{if !$menu_title} title="{$product.name}"{/if}{if $block.nofollow} rel="nofollow"{/if}{if $block.new_window} target="_blank"{/if} class="mo_element_a_depth_{$depth + 2} mo_sub_a">{$product.name}</a></li>
											{/foreach}
											</ul>	
										{/if}
									</li>
								{elseif $block.subtype==0  && isset($block.children.children) && count($block.children.children)}
									{foreach $block.children.children as $menu}
										<li class="nrt_mo_mega_block_{$block.id_nrt_mega_menu} mo_element_li_depth_{$depth + 1} mo_sub_li">
											{assign var='has_children' value=(isset($menu.children) && is_array($menu.children) && count($menu.children))}
											<div class="menu_a_wrap{if $has_children} menu-item-has-children{/if}">
											<a href="{if $menu.link}{$menu.link}{else}javascript:void(0){/if}"{if !$menu_title} title="{$menu.name}"{/if}{if $block.nofollow} rel="nofollow"{/if}{if $block.new_window} target="_blank"{/if} class="mo_element_a_depth_{$depth + 1} mo_sub_a">{$menu.name}</a>
											{if $has_children}<span class="icon-opener js-opener-menu"></span>{/if}
											</div>
											{if $has_children}
												{include file="module:nrtmegamenu/views/templates/hook/megamenu-category.tpl" nofollow=$block.nofollow new_window=$block.new_window menus=$menu.children m_level={$depth + 2} ismobilemenu=true}
											{/if}
										</li>
									{/foreach}
								{elseif $block.subtype==1 || $block.subtype==3}
									<li class="nrt_mo_mega_block_{$block.id_nrt_mega_menu} mo_element_li_depth_{$depth + 1} mo_sub_li">
										{assign var='has_children' value=(isset($block.children.children) && count($block.children.children))}
										<div class="menu_a_wrap{if $has_children} menu-item-has-children{/if}">
										<a href="{if $block.children.link}{$block.children.link}{else}javascript:void(0){/if}"{if !$menu_title} title="{$block.children.name}"{/if}{if $block.nofollow} rel="nofollow"{/if}{if $block.new_window} target="_blank"{/if} class="mo_element_a_{$block.id_nrt_mega_menu} mo_element_a_depth_{$depth + 1} mo_sub_a">{$block.children.name}{if $block.cate_label}<span class="cate_label">{$block.cate_label}</span>{/if}</a>
										{if $has_children}<span class="icon-opener js-opener-menu"></span>{/if}
										</div>
										{if $has_children}
											{include file="module:nrtmegamenu/views/templates/hook/megamenu-category.tpl" nofollow=$block.nofollow new_window=$block.new_window menus=$block.children.children m_level={$depth + 2} ismobilemenu=true}
										{/if}
									</li>
								{/if}
							{elseif $block.item_t==2 && isset($block.children) && count($block.children)}
								<li class="nrt_mo_mega_block_{$block.id_nrt_mega_menu} mo_element_li_depth_{$depth + 1} mo_sub_li">
									<div class="products_on_menu">
										{$imageType	= 'home_default'}
										{if isset($opThemect.general_product_image_type_large) && $opThemect.general_product_image_type_large}
											{$imageType = $opThemect.general_product_image_type_large}
										{/if}	
										{foreach $block.children as $product}
											<div class="m-b-1">
												<div class="menu-product">
													<a href="{$product.url}" title="{$product.name}">
														<div class="img-placeholder {$imageType}">
															{if $product.cover}
																{$image = $product.cover}
															{else}
																{$image = $urls.no_picture_image}
															{/if}
															<img
																class="img-loader lazy-load" 
																data-src="{$image.bySize.{$imageType}.url}"
																src="{if isset($opThemect.placeholder)}{$opThemect.placeholder}{/if}" 
																alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
																title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
																width="{$image.bySize.{$imageType}.width}"
																height="{$image.bySize.{$imageType}.height}"
															> 
														</div>
													</a> 
													<div class="product_name">
														<a href="{$product.url}">{$product.name}</a>
													</div>   
												</div>
											</div>
										{/foreach}
									</div>
								</li>
							{elseif $block.item_t==3 && isset($block.children) && count($block.children)}
								{if isset($block.subtype) && $block.subtype}
									<li class="nrt_mo_mega_block_{$block.id_nrt_mega_menu} mo_element_li_depth_{$depth + 1} mo_sub_li">
									{foreach $block.children as $brand}
											<a href="{$brand.url}" title="{$brand.name}"{if $block.nofollow} rel="nofollow"{/if}{if $block.new_window} target="_blank"{/if} class="mo_element_a_depth_{$depth + 1} mo_sub_a">{$brand.name}</a>
									{/foreach}
									</li>	
								{else}
									<li class="nrt_mo_mega_block_{$block.id_nrt_mega_menu} mo_element_li_depth_{$depth + 1} mo_sub_li">
									{foreach $block.children as $brand}
										<div class="mo_brand_div">
											<a href="{$brand.url}" title="{$brand.name}"{if $block.nofollow} rel="nofollow"{/if}{if $block.new_window} target="_blank"{/if} class="nrt_mega_brand">
												<img class="img-responsive" src="{$brand.image}" alt="{$brand.name}" title="{$brand.name}" width="{$manufacturerSize.width}" height="{$manufacturerSize.height}" />
											</a>
										</div>
									{/foreach}
									</li>		
								{/if}
							{elseif $block.item_t==4}
								<li class="nrt_mo_mega_block_{$block.id_nrt_mega_menu} mo_element_li_depth_{$depth + 1} mo_sub_li">
									{assign var='has_children' value=(isset($block.children) && is_array($block.children) && count($block.children))}
									<div class="menu_a_wrap{if $has_children} menu-item-has-children{/if}">
									<a href="{if $block.m_link}{$block.m_link}{else}javascript:void(0){/if}"{if !$menu_title} title="{$block.m_title}"{/if}{if $block.nofollow} rel="nofollow"{/if}{if $block.new_window} target="_blank"{/if} class="mo_element_a_{$block.id_nrt_mega_menu} mo_element_a_depth_{$depth + 1} mo_sub_a">{if $block.icon_class}{$icon_class_value = $block.icon_class|json_decode:1}{if $icon_class_value.type == 1}<img class="icon-img img-responsive" src="{$icon_class_value.value}" alt=""/>{else}<i class="{$icon_class_value.value}"></i>{/if}{/if}{$block.m_name}{if $block.cate_label}<span class="cate_label">{$block.cate_label}</span>{/if}</a>
									{if $has_children}
										{foreach $block.children as $menu}
											{if $menu.hide_on_mobile == 1}{continue}{/if}
											<span class="icon-opener js-opener-menu"></span>
											{break}
										{/foreach}
									{/if}
									</div>
									{if $has_children}
										<ul class="mo_element_ul_depth_{$depth + 2} mo_sub_ul">
										{foreach $block.children as $menu}
											{if $menu.hide_on_mobile == 1}{continue}{/if}
											{include file="module:nrtmegamenu/views/templates/hook/megamenu-link.tpl" nofollow=$block.nofollow new_window=$block.new_window menus=$menu m_level={$depth + 2} ismobilemenu=true}
										{/foreach}
										</ul>		
									{/if}
								</li>
							{elseif $block.item_t==5 && $block.html}
								<li class="nrt_mo_mega_block_{$block.id_nrt_mega_menu} mo_element_li_depth_{$depth + 1} mo_sub_li style_content">
									{$block.html nofilter}
								</li>
							{/if}
						{/foreach}
					{/if}
				{/foreach}
				</ul>
			{/if}
		</li>
	{/strip}
{/function}
	
{if isset($nrtmenu)}
	{$v_mb_menu = []}
	<ul class="mo_element_ul_depth_0">
		{foreach $nrtmenu as $mm}
			{if $mm.hide_on_mobile == 1}{continue}{/if}
			{if $mm.location == 2}{$v_mb_menu[] = $mm}{continue}{/if}
			{axps_menumobile_tpl mm=$mm}
		{/foreach}
		{if $v_mb_menu}
			<li class="nrt_mo_mega_0 mo_element_li_depth_0 mo_ml_column">
				<div class="menu_a_wrap menu-item-has-children">
				<a href="javascript:void(0)" class="mo_element_a_0 mo_element_a_depth_0 js-opener-menu"><span>{l s='All categories' mod='nrtmegamenu'}</span></a>
				<span class="icon-opener js-opener-menu"></span>
				</div>
				<ul class="mo_element_ul_depth_00 mo_sub_ul">
					{foreach $v_mb_menu as $mm}
						{if $mm.hide_on_mobile == 1}{continue}{/if}
						{axps_menumobile_tpl mm=$mm depth=1}
					{/foreach}
				</ul>
			</li>
		{/if}
	</ul>
{/if}
