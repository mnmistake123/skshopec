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
		<span class="post-date">
			<span>{$post.created|date_format:"%e"}</span>
			<span>{l s={$post.created|date_format:"%b"} d='Shop.Theme.Axon'}</span>
		</span>
	</div>
	<div class="element-bottom">
		<h3 class="blog-title">
			<a href="{$post.url}">
				{$post.title}
			</a> 
		</h3>	
		<p>{$post.short_description|truncate:80:'...' nofilter}</p>
		<a class="read-more" href="{$post.url}" title="{l s='Read more' d='Shop.Theme.Axon'}">{l s='Read more' d='Shop.Theme.Axon'}<i class="las la-angle-right"></i></a>
	</div>
</div>