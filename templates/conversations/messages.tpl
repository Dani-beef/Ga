{include file="header_home.tpl"}
<!--
  <div class="well black">
   Antique messages are automagically purged.
  </div>	

-->


<div class="row">
  <div class="col-md-5">

    <form method="post">
      <button type="submit" name="readall" value="true" >Mark all as read</button>
    </form>

</div>
  <div class="col-md-7">
  <a href="{$config.url}conversations/new/emilia" class="button text-center">NEW MESSAGE</a>
  </div>
</div>

<hr/>
<!--
<br/>
<div class="well black text-center">
	<a href="{$config.url}conversations"><span class="badge">all</span></a>
	<a href="{$config.url}conversations/filter/normal"><span class="badge">normal</span></a>
	<a href="{$config.url}conversations/filter/spy"><span class="badge alert-warning">spy reports</span></a>
	<a href="{$config.url}conversations/filter/attacks"><span class="badge alert-danger">attack reports</span></a>
	<a href="{$config.url}conversations/filter/scavenge"><span class="badge alert-info">scavenge reports</span></a>
	<a href="{$config.url}conversations/filter/org"><span class="badge alert-info">organization</span></a>
	<a href="{$config.url}conversations/filter/cardinal"><span class="badge alert-success">other cardinal notices</span></a>
</div>
<br/>-->
        {include file="error_success.tpl"}
<div class="row">
{foreach from=$messages key=k item=m}
    <div class="col-md-6">
    <a href="{$config.url}conversations/message/{$m.message_id}/page/{$m.lastPage}#quick_reply" >
	<button class="text-left cut-text">
    {if !$m.last_reply_seen}
     <strong style="color:white">NEW</strong>
    {/if}
    {if $m.type eq 2}
		<span class="badge alert-warning">spy</span>
	{elseif $m.type eq 3}
		<span class="badge alert-danger">attack</span>
	{elseif $m.type eq 4}
		<span class="badge alert-info">org</span>
	{elseif $m.type eq 5}
		<span class="badge alert-info">scavenge</span>
	{elseif $m.type eq 6}
		<span class="badge alert-success">cardinal</span>
	{/if}
		{$m.title}
		</button>
    </a>
    <div class="panel panel-glass">
		<div class="panel-body">
			
			 <small>last message by {$m.last_reply_username} {$m.last_reply_date}.</small>
			 
			 
    	</div>
		 <div class="panel-footer text-right">
			 <small> <em>{if $m.replies > 1}{$m.replies|number_format} message(s) in {/if}conversation with {$m.username}</em></small>
			  </div>
	</div>
		
    </div>
  
{foreachelse}
<div class="col-md-12">
<button disabled class="disabled">empty inbox</button>
</div>
{/foreach}
</div>

<div class="text-center">
  {$pages}
</div>


			
		