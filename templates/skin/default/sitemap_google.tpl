<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="{$sTemplateWebPathPluginSitemap}sitemap.xsl"?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd"
        xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
		xmlns:news="http://www.google.com/schemas/sitemap-news/0.9"
		xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">
{foreach from=$aData item=oItem}
    <url>
        <loc>{$oItem.loc}</loc>
{if $oItem.entity}
	{assign var="oTopic" value="{$oItem.entity}"}
		<news:news>
			<news:publication>
				<news:name>{cfg name='view.name'}</news:name>
				<news:language>{strip}
					{if $oConfig->getValue('lang.current') == 'ukrainian'}
						uk
					{elseif $oConfig->getValue('lang.current') == 'russian'}
						ru
					{else}
						en
					{/if}
				{/strip}</news:language>
			</news:publication>
			<news:genres>Blog, UserGenerated, Opinion</news:genres>
			<news:publication_date>{$oTopic->getDateAdd()|date_format:'%Y-%m-%dT%H:%M:%S+00:00'}</news:publication_date>
			<news:title>{$oTopic->getTitle()}</news:title>
			<news:keywords>{strip}
				{if $oTopic->getTagsArray()}
					{foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
						{if !$smarty.foreach.tags_list.first}, {/if}{$sTag|escape:'html'}
					{/foreach}
				{/if}
			{/strip}</news:keywords>
		</news:news>
	{if $oTopic->getType()=='photoset'}	
		{foreach from=$oTopic->getPhotosetPhotos() item=oPhoto}
		<image:image>
			<image:loc>{$oPhoto->getWebPath()}</image:loc>
			<image:caption>{$oPhoto->getDescription()}</image:caption>
		</image:image>
		{/foreach}		
	{elseif $oTopic->getPreviewImageWebPath()}
		<image:image>
			<image:loc>{$oTopic->getPreviewImageWebPath()}</image:loc>
			<image:caption>{$oTopic->getTitle()}</image:caption>
		</image:image>
	{/if}
{/if}
{if $oItem.lastmod}
        <lastmod>{$oItem.lastmod}</lastmod>
{/if}
{if $oItem.changefreq}
        <changefreq>{$oItem.changefreq}</changefreq>
{/if}
{if $oItem.priority}
        <priority>{$oItem.priority}</priority>
{/if}
    </url>
{/foreach}
</urlset>