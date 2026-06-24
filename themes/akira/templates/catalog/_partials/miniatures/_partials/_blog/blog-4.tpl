<div class="item-inner">
	<div class="element-top">
		<div class="blog-thumbnail">
			<a href="{$post.url}">  
				<div class="img-placeholder {$post.image.type}">
					<img
						class="img-loader lazy-load" 
						data-src="{$post.image.url}"
						src="{if isset($opThemect.placeholder)}{$opThemect.placeholder}{/if}" 
						alt="{$post.title}"
						title="{$post.title}" 
						width="{$post.image.width}"
						height="{$post.image.height}"
					>
				</div>
			</a>
		</div>
	</div>
	<div class="element-bottom">
		<div class="post-info">
			<span class="post-date">
				<i class="las la-calendar"></i> {$post.created}
			</span>				
		</div>
		<h3 class="blog-title">
			<a href="{$post.url}">
				{$post.title}
			</a> 
		</h3>		
		<a class="read-more" href="{$post.url}" title="{l s='Read more' d='Shop.Theme.Axon'}">+ {l s='Read more' d='Shop.Theme.Axon'}</a>
	</div>
</div>