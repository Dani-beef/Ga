
<div class="row  ">

      <div class="col-md-4 ">
        <button  disabled class="text-left  mb10">
          TOP HACKERS
        </button>
		<div class="button-stack ">
        {foreach from=$topUsers item = top}
          
                  <a href="{$config.url}profile/hacker/{$top.username}" class="button text-center  cut-text" >{$top.username}</a>
              
         
        {/foreach}
		 </div>
      </div>
      <div class="col-md-4 ">
        <button disabled class=" mb10">
          TOP Organizations
        </button>
		<div class="button-stack">
         {foreach from=$topOrgs item = top}
            <a href="{$config.url}organization/show/{$top.id}" class="button text-center cut-text " >{$top.name}</a>
          {/foreach}
		  </div>
      </div>
      <div class="col-md-4 ">
        <button  disabled class=" text-right mb10">
         TOP Blogs
        </button>
		<div class="button-stack">
        {foreach from=$topBlogs item = top}
          
           
                  <a href="{$config.url}blogs/blog/{$top.blog_id}" class="button cut-text text-center">{$top.name}</a>
               
             
          
        {/foreach}</div>
      </div>

</div>
