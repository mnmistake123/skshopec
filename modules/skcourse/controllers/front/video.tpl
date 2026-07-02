{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
<div class="container" style="padding: 40px 0;">
    <div class="row justify-content-center">
        <div class="col-lg-10">

            <h1 style="margin-bottom: 24px;">Tu curso</h1>

            {* Bunny Stream iframe embed *}
            <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.15);">
                <iframe
                    src="{$video_url|escape:'html'}"
                    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
                    frameborder="0"
                    allow="accelerometer; gyroscope; autoplay; encrypted-media; picture-in-picture"
                    allowfullscreen>
                </iframe>
            </div>

            <p style="margin-top: 16px; color: #888; font-size: 13px;">
                ⚠️ Este contenido es exclusivo para clientes. Por favor no compartas este enlace.
            </p>

        </div>
    </div>
</div>
{/block}
