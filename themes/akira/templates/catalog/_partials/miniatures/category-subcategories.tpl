{if isset($subcategories) && $subcategories}
	<div class="product-list-subcategories">
		<div class="row">
			{foreach from=$subcategories item=subcategory}
				<div class="col-6 col-sm-4">
					<a class="wrapp-category" href="{$subcategory.url}">
						{assign var="cat_img_dir" value="{_PS_CAT_IMG_DIR_}{$subcategory.id_category}{'_thumb.jpg'}"}
						{if file_exists($cat_img_dir)}
							{assign var="cat_img_src" value="{_THEME_CAT_DIR_}{$subcategory.id_category}{'_thumb.jpg'}"}
							<div class="category-image">
								<img class="img-responsive" src="{Context::getContext()->link->getMediaLink($cat_img_src)}" alt="{$subcategory.name}">
							</div>
						{/if}
						<span class="category-title">{$subcategory.name}</span>
					</a>
				</div>
			{/foreach}
		</div>
	</div>
{/if}
