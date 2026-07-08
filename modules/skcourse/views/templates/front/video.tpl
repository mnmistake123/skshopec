{extends file='layouts/layout-content-only.tpl'}

{block name='content'}
<div class="container" style="padding: 60px 0;">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-12 col-xl-12">

            <h1 style="text-align: center; margin-bottom: 32px;">{$product_name|escape:'html'}</h1>

            {if $expired}
                {* ======================== EXPIRED ======================== *}
                <div style="text-align:center; padding: 40px; background: #fff3f3; border-radius: 10px;">
                    <h3 style="color: #cc0000;">Tu acceso a "{$product_name|escape:'html'}" ha expirado</h3>
                    <p style="color: #666;">Tu enlace de acceso era válido hasta {$expires_at}.</p>
                    <a href="{$link->getProductLink($product_id)}" class="btn btn-primary">
                        Renovar acceso
                    </a>
                </div>

            {elseif $show_modules}
                {* ======================== MODULES LIST ======================== *}
                <div style="max-width: 700px; margin: 0 auto;">

                    <p style="text-align: center; color: #999; font-size: 13px; margin-bottom: 32px;">
                        Acceso válido hasta: {$expires_at}
                    </p>

                    <div style="display: flex; flex-direction: column; gap: 12px;">
                        {foreach $modules as $module}
                            <a href="{$module.url|escape:'html'}" style="
                                display: flex;
                                align-items: center;
                                padding: 20px 24px;
                                background: #ffffff;
                                border: 1px solid #eeeeee;
                                border-radius: 10px;
                                text-decoration: none;
                                color: #1a1a1a;
                                box-shadow: 0 2px 8px rgba(0,0,0,0.06);
                                transition: box-shadow 0.2s ease;
                            "
                            onmouseover="this.style.boxShadow='0 4px 16px rgba(0,0,0,0.12)'"
                            onmouseout="this.style.boxShadow='0 2px 8px rgba(0,0,0,0.06)'">
                                <div style="
                                    width: 40px;
                                    height: 40px;
                                    border-radius: 50%;
                                    background: #C9A96E;
                                    color: #ffffff;
                                    display: flex;
                                    align-items: center;
                                    justify-content: center;
                                    font-weight: bold;
                                    font-size: 16px;
                                    flex-shrink: 0;
                                    margin-right: 16px;
                                ">
                                    {$module.id}
                                </div>
                                <div>
                                    <p style="margin: 0; font-size: 15px; font-weight: 600;">
                                        {$module.title|escape:'html'}
                                    </p>
                                    <p style="margin: 4px 0 0; font-size: 13px; color: #999;">
                                        {if $module.description}
                                            {$module.description|escape:'html'|truncate:80:'...'}
                                        {else}
                                            Módulo {$module.id}
                                        {/if}
                                    </p>
                                </div>
                                <div style="margin-left: auto; color: #C9A96E; font-size: 20px;">▶</div>
                            </a>
                        {/foreach}
                    </div>

                    <p style="text-align: center; margin-top: 32px; color: #999; font-size: 13px;">
                        ⚠️ Este contenido es exclusivo para clientes. Por favor no compartas este enlace.
                    </p>
                </div>

            {else}
                {* ======================== VIDEO PLAYER ======================== *}
                <div style="max-width: 70%; margin: 0 auto;">

                    {* Back + progress *}
                    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 16px;">
                        <a href="{$course_url|escape:'html'}" style="color: #C9A96E; font-size: 14px; text-decoration: none;">
                            ← Volver a módulos
                        </a>
                        <span style="color: #999; font-size: 13px;">
                            Módulo {$current_module} de {$total_modules}
                        </span>
                    </div>

                    {* Module title *}
                    <h2 style="font-size: 20px; margin-bottom: 16px; color: #1a1a1a;">
                        {$module_title|escape:'html'}
                    </h2>

                    {* Video player *}
                    <video
                        controls
                        controlsList="nodownload"
                        oncontextmenu="return false;"
                        style="width:100%; aspect-ratio:16/9; border-radius:10px; box-shadow: 0 8px 30px rgba(0,0,0,0.2);">
                        <source src="{$video_url|escape:'html'}" type="video/mp4">
                    </video>

                    {* Module description *}
                    {if $module_description}
                        <div style="
                            margin-top: 24px;
                            padding: 20px 24px;
                            background: #f9f9f9;
                            border-radius: 10px;
                            border-left: 4px solid #C9A96E;
                        ">
                            <h3 style="font-size: 15px; font-weight: 600; margin: 0 0 8px; color: #1a1a1a;">
                                Sobre este módulo
                            </h3>
                            <p style="margin: 0; color: #555; font-size: 14px; line-height: 1.7;">
                                {$module_description|escape:'html'}
                            </p>
                        </div>
                    {/if}

                    {* Prev / Next navigation *}
                    <div style="display: flex; justify-content: space-between; margin-top: 20px; gap: 12px;">
                        {if $prev_url}
                            <a href="{$prev_url|escape:'html'}" class="btn btn-default" style="flex: 1; text-align: center;">
                                ← Módulo anterior
                            </a>
                        {else}
                            <div style="flex: 1;"></div>
                        {/if}

                        {if $next_url}
                            <a href="{$next_url|escape:'html'}" class="btn btn-primary" style="flex: 1; text-align: center; background: #C9A96E; border-color: #C9A96E;">
                                Siguiente módulo →
                            </a>
                        {else}
                            <div style="flex: 1; text-align: center; padding: 10px; background: #f9f9f9; border-radius: 6px; color: #999; font-size: 13px;">
                                ✅ Has completado el curso
                            </div>
                        {/if}
                    </div>

                    <p style="text-align:right; color:#999; font-size:12px; margin-top:16px;">
                        Acceso válido hasta: {$expires_at}
                    </p>

                    <p style="text-align: center; margin-top: 12px; color: #999; font-size: 13px;">
                        ⚠️ Este contenido es exclusivo para clientes. Por favor no compartas este enlace.
                    </p>
                </div>
            {/if}

        </div>
    </div>
</div>
{/block}
