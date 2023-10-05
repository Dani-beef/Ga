<div style="background-image:url({$config.url}layout/img/characters/Mary-A.I.png); background-repeat:no-repeat;
background-size:contain; background-position: 100% 50%">

<div class="futureNav middle ">
	<ul>
		<li><a href="{$furl}"><div>Forum</div></a></li>
		<li><a href="{$url}"><div>{$forum.name}</div></a></li>
	</ul>
</div><br/><br/>
<div class="row">
	<div class="col-md-4">
		 {if ($logged && !$forum.closed) || $user.forumManager} 
		  <a href="{$url}new/thread" class="button text-center">New discussion</a>
		{elseif $forum.closed} <button>FORUM CLOSED</button>
		{else} <button>Must be connected to discuss</button>
		{/if}
	</div>
	
</div>
<br/>
</div>

<div class="row">
	<div class="col-md-12">
		 {foreach from=$threads key=k item=thread}
		<div id="thread-{$thread.id}">
			<div class="row-fluid">
			  
				<div class="col-md-7 nopadding">
					
					<a href="{$furl}tid/{$thread.id}" class="button">
					{if $thread.stick}
					<span title="Sticked" class="glyphicon glyphicon-pushpin"></span>
					{/if}
			 	 {if $thread.closed}
			 	 	<span title="Closed" class="glyphicon glyphicon-lock"></span>
			 	 {/if}
					  {$thread.title} ({$thread.replies|number_format} replies) <small><em>by {$thread.user}</em></small></a>
				</div>
				
				<div class="col-md-5  text-right ">
				<div class="well">
					  last {$thread.last} by {$thread.last_user|profile_link}
				</div>
					
				</div>
			</div>
			</div>
			 {foreachelse}
			<div class="well text-center">
				 Nothing to display
			</div>
			 {/foreach}
		</div>
	</div>
<div class="text-center">
 {$pages}
</div>