{include file="header_home.tpl"}
	<div class="text-center">
		<a href="{$config.url}blogs/article/{$article.article_id}">
		<h2>{$article.title}</h2>
		</a>	
		<br/>
		<p>
			 by {$article.user|profile_link} {$article.created} in <strong><a href="{$config.url}blogs/blog/{$article.blog_id}">{$article.blogName}</a></strong>
		</p>
		<p>{$article.votes|number_format} votes and {$article.nrc|number_format} comments</p>
	
	</div>
	<br/>
	<blockquote>
		<article id="article_{$article.article_id}">
		  {$article.content} 

		</article>
		{if $user.id eq $article.user_id} 
			<br/>
			<small><a href="{$config.url}blogs/article/{$article.article_id}/action/edit">edit article</a></small>
		{/if}
	</blockquote>

	<div class="mb10">
	<iframe src="//www.facebook.com/plugins/like.php?href={$config.url}blogs/article/{$article.article_id}&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=false&amp;share=true&amp;height=21&amp;appId=820318067994880" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:21px;display:inline" allowtransparency="true">
            </iframe>
          </div>
	<br/>

	
	
	{if $user.id eq $article.user_id} 

	
	{elseif $logged}
	<div class="row">

	
				<div class="col-md-6 ">
					<form method="post" action="{$url}">
					  {if $article.voted}
						<button type="submit" name="vote" value="true"><span class="glyphicon glyphicon-thumbs-down"></span> ({$article.votes|number_format})</button>
					  {else}
					    <button type="submit" name="vote" value="true"><span class="glyphicon glyphicon-thumbs-up"></span> ({$article.votes|number_format})</button>
					  {/if}
					</form>
				</div>
				<div class="col-md-6 ">
					<form method="post" action="{$url}">
					  
					  <button type="submit" name="form_identifier" value="subscribe">
					  	{if $article.subscribed}Unsubscribe from {else}Subscribe to {/if}blog
					  </button>
					</form>
				
		</div>
	</div>
	{else}
	  <div class="well">
	    Authenticate to give thumb up's, subscribe and comment.
	  </div>
	{/if}
	<br/>
	<div class="row" id="comments">
		<div class="col-md-12">
			<div class="row-fluid">
				<div class="col-md-8 nopadding">
					<div class="well black ">
						 <small><span class="glyphicon glyphicon-comment"></span></small> ({$article.nrc})
					</div>
				</div>
				<div class="col-md-4 nopadding">
					 {if $logged} <button onclick='$("#commentForm").fadeToggle();'><span class="glyphicon glyphicon-comment"></span></button>
					{else} <button disabled>Authenticate to comment</button>
					{/if}
				</div>
			</div>
		</div>
	</div>
				 {if $logged}
				<div id="commentForm" class="nodisplay">
					<script>
        $(document).ready(function(){
          $("textarea[name='comment']").charCount({ allowed:1000});
        });
        </script>
					<form method="post" action="#comments">
						<textarea id="comment" name="comment"></textarea>
						<input type="submit" class="button" value="Comment"/>
					</form>
				</div>
				 {/if} <br/>
				<div class="row-fluid">
					 {foreach from=$comments key=k item=c}
					<div class="col-md-6">
						<div class="well">
							 <small>{$c.user|profile_link} said {$c.created}</small>
							<hr class="dotted"/>
							 {$c.content}
						</div>
					</div>
					 {foreachelse}
					<div class="well text-center">
						 No comments
					</div>
					 {/foreach}
				</div>
				<div class="text-center">
					 {$pages}
				</div>
