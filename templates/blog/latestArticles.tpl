{include file="header_home.tpl"}
  
{include file="error_success.tpl"}


<div class="well">
Few of the latest articles published by citizens around the grid. Show your support by commenting && subscribing.
</div>

<div class="text-center">
  {$pages}
</div>

{foreach from=$articles item=article}

          <a href="{$config.url}blogs/article/{$article.article_id}" class="button mb10">{$article.title} <small><em>by {$article.username} {$article.created|date_fashion}</em></small></a>
        
{/foreach}

<div class="text-center">
  {$pages}
</div>