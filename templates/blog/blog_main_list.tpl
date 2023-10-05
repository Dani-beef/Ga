{include file="header_home.tpl"}



                {if $user.blogs < $user.maxBlogs}
                  <a href="{$config.url}blogs/create/new" class="text-center button">CREATE A NEW BLOG</a>
                {else}
                  <div class="alert alert-warning">
                    Maximum number of blogs reached [{$user.maxBlogs}]
                  </div> 
                {/if}
             
					
					<br/><br/>

        {foreach from=$blogs item=blog}

                  <a href="{$config.url}blogs/blog/{$blog.blog_id}" class="button mb10">{$blog.name}</a>
                
        {foreachelse}
          <div class="well text-center">
            You do not own a blog. Share your story with us!
          </div>
        {/foreach}
      
					
			
			
	
		