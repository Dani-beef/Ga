
    
      
        {foreach from=$articles item=a}
        <h3 class="cut-text"><a href="{$config.url}blogs/article/{$a.article_id}" >{$a.title}</a></h3>

        <blockquote>
            <small>{$a.votes|number_format} votes and {$a.nrc|number_format} comments</small>
            <br/>
             <article id="{$a.article_id}">
             {$a.content}


             </article>
             
             {if $user.id eq $blog.user_id} 
             <br/>
             <small>
                <a href="{$config.url}blogs/article/{$a.article_id}/action/edit">edit article</a></small>
              {/if}
              
        </blockquote>
        
        {foreachelse}
          <div class="well text-center">No articles found</div>
        
        {/foreach}
       
    <div class="text-center">
      {$pages}
    </div>
  