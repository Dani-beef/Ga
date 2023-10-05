{include file="header_home.tpl"}

<div class="row">
  <div class="col-md-4">
    <a href="{$config.url}blogs/order/nra" class="button text-center">ORDER BY ARTICLES</a>
  </div>
  <div class="col-md-4">
    <a href="{$config.url}blogs/order/nrs" class="button text-center">ORDER BY SUBSCRIBERS</a>
  </div>
  <div class="col-md-4">
    <a href="{$config.url}blogs/order/created" class="button text-center">ORDER BY LATEST</a>
  </div>
</div>
<br/>
{foreach $blogs as $blog}

  <a href="{$config.url}blogs/blog/{$blog.blog_id}" class="button mb10 cut-text">{$blog.name} <small>{$blog.nra} articles and {$blog.nrs} subscribers - created {$blog.created|date_fashion}</small></a>

{/foreach}
<div class="text-center">
   {$pages}
</div>