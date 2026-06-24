{block name='header_banner'}
	<div class="header-banner">
		{hook h='displayBanner'}
	</div>
{/block}
<nav class="header-nav">
	<div class="container container-parent">
		<div class="row">
			<div class="col-xs-12">
				<div id="site_width"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5 col-xs-12 left-nav">
				{hook h='displayNav1'}
			</div>
			<div class="col-md-7 col-xs-12 right-nav">
				{hook h='displayNav2'}
			</div>
		</div>
	</div>
</nav>
{block name='header_top'}
	<div class="header-top">
		<div class="container container-parent">
			<div class="row">
				<div class="col-xs-12">
					{hook h='displayTop'}
				</div>
			</div>
		</div>
	</div>
	{hook h='displayNavFullWidth'}
{/block}