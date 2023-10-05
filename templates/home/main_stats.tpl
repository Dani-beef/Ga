<br/>
	  <strong><em>{$online|number_format} hackers have recently connected to the Grid</em> </strong>
	   <br/> <br/>
	  <h4>newest organizations && hackers</h4>
      {foreach from = $orgHackers item = item}
        {if $item.name}
          <a href="{$config.url}organization/show/{$item.id}">{$item.name}</a>
        {else}
          <a href="{$config.url}profile/hacker/{$item.username}">{$item.username}</a>
        {/if}
      {/foreach}
	  
	  
	  <br/>
	 
	
	  <br/>
    <p>
  latest news | <a href="{$config.url}forum/tid/{$lastNews.tid}">{$lastNews.title}</a>
</p>
  last article | <a href="{$config.url}blog/article/{$lastArticle.article_id}">{$lastArticle.title}</a>
	  
	 
	  <br/><br/>
	  <strong>Random review</strong> 
	  <em>
	  
	  {$review}
		</em>