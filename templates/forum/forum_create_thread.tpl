
	{if $preview}
		<div class="well">
		
			{$preview}
		</div>
	
	{/if}
	
			  			
			<form method="post">
			{if !$post.parent}
			  <input type="text" maxlength="70" name="title" placeholder="Title" value="{if $smarty.post.title}{$smarty.post.title}{else}{$post.title}{/if}"/>
			{/if}
			
			<textarea name="content" style="min-height:400px" maxlength="{$config.forum_post_size}">{if $smarty.post.content}{$smarty.post.content}{else}{$post.unparsed_content}{/if}</textarea>
		<div class="row">
			  <div class="col-md-12">
			  <div class="row-fluid">
			  <div class="col-md-6 nopadding">
		
			<button type="submit" title="Send"><span class="glyphicon glyphicon-send"></span></button>
		  </div>
		  <div class="col-md-3 nopadding">
				<a href="{$furl}fid/{$forum.id}"><button type="button" title="Preview"><span class="glyphicon glyphicon-eye-open"></span></button></a>
      </div>
      <div class="col-md-3 nopadding">
        {if $forum.id}
          <a href="{$furl}fid/{$forum.id}"><button type="button" title="Cancel">Cancel</button></a>
        {else}
          <a href="{$furl}tid/{if $post.parent}{$post.parent}{else}{$post.id}{/if}"><button type="button">CANCEL</button></a>
        {/if}
      </div>
			</form>
			
			</div></div>	</div>
						{include file="text_decorations.tpl"}
					
	
			

		