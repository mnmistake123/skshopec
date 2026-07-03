{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
<div class="container" style="padding: 60px 0;">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-12 col-xl-12">

            <h1 style="text-align: center; margin-bottom: 32px;">Tu curso</h1>

            {if $expired}
                <div style="text-align:center; padding: 40px; background: #fff3f3; border-radius: 10px;">
                    <h3 style="color: #cc0000;">Tu acceso ha expirado</h3>
                    <p style="color: #666;">Tu enlace de acceso era válido hasta {$expires_at}.</p>
                    <a href="{$link->getProductLink($product_id)}" class="btn btn-primary">
                        Renovar acceso
                    </a>
                </div>
            {else}
                <div style="max-width: 70%; margin: 0 auto;">
                    <video
                        controls
                        controlsList="nodownload nofullscreen"
                        oncontextmenu="return false;"
                        style="width:100%; aspect-ratio:16/9; border-radius:10px; box-shadow: 0 8px 30px rgba(0,0,0,0.2);">
                        <source src="{$video_url|escape:'html'}" type="video/mp4">
                    </video>
                    <p style="text-align:right; color:#999; font-size:12px; margin-top:8px;">
                        Acceso válido hasta: {$expires_at}
                    </p>
                </div>

                <p style="text-align: center; margin-top: 20px; color: #999; font-size: 13px;">
                    ⚠️ Este contenido es exclusivo para clientes. Por favor no compartas este enlace.
                </p>
            {/if}

        </div>
    </div>
</div>
{/block}