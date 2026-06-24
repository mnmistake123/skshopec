<nav class="axps-breadcrumb" data-depth="{$breadcrumb.count}">
    {foreach from=$breadcrumb.links item=path name=breadcrumb}
        {if $path.title}
            {if not $smarty.foreach.breadcrumb.last}
                <a href="{$path.url}"><span>{$path.title}</span></a>
            {else}
                <span>{$path.title}</span>
            {/if}
        {/if}
    {/foreach}
</nav>	