{include file="header_home.tpl"}

			
{include file="error_success.tpl"}
			
				
<div class="text-center" style="height:100px;">
  <a href="{$config.url}blogs/blog/{$blog.blog_id}">
  <h2>{$blog.name}</h2>
  </a>
  <small>by {$blog.user|profile_link} with {$blog.nra} published article{if $blog.nra ne 1}s{/if} and {$blog.nrs} subscriber{if $blog.nrs ne 1}s{/if}</small>
</div>


   <div class="row">
 {if $blog.user_id ne $user.id}

      <div class="col-md-4"></div>
     <div class="col-md-4">
         <form method="post">
          <input type="hidden" name="subscribe" value="true"/>
          <button type="submit">{if $blog.subscribed}Unsubscribe{else}Subscribe{/if}</button>
        </form>
     </div>
  {else}

    <div class="col-md-8">
      <a href="{$config.url}blogs/blog/{$blog.blog_id}/add/article" class="button text-center">
           NEW ARTICLE
        </a>
    </div>
    <div class="col-md-4">
        {include file="dialogs/osx_dialog_box.tpl" id="edit" title="Edit blog" content='
    <form method="post">
    <input type="text" name="title"maxlength="45" placeholder="Blog title" value="{$blog.name}"/>
    <input type="submit" name="edit" value="Update title"/>
    </form>

    '}
         <a href="#myModaledit" id="edit" data-toggle="modal" class="button text-center">
          <span class="glyphicon glyphicon-cog"></span>
        </a>

    </div>
 {/if}
 </div>


    
  <br/>



  {include file="blog/blog_articles.tpl"}
  
  



		