{include file="header_home.tpl"}

{include file="servers/servers_header.tpl"}

	  
{include file="error_success.tpl"}	






<div class="row">
	<div class="col-xs-10">
		<div class="well mb10">
		 			You own {$servers|count}/{$maxServers} servers. Please keep in mind only your main server contributes to your skill levels in missions.
				
					
		</div>
	</div>
	<div class="col-xs-2">
		<a  href="{$config.url}frequently-asked-questions/open/about-servers">
			<button>
				<span class="fa fa-question-circle"></span>
			</button></a>
	</div>
</div>





<br/>
{foreach from=$servers key = key item=server}
<div class="row ">

<div class="col-lg-7 col-xs-12">
<a class="button mb10" href="{$config.url}servers/server/{$server.server_id}"><!--{$server.ip} - -->{$server.hostname}</a>
</div>

<div class="col-lg-3 col-xs-6">
	{if $server.damaged > 0}
		<div class="alert alert-danger text-center nomargin">
			{$server.damaged|round:2}% damaged
		</div>
	{else}
		<div class="alert alert-info text-center nomargin">undamaged</div>
	{/if}
</div>
<div class="col-lg-2 col-xs-6">
	{if $user.server eq $server.server_id}
		
	{else}
		<form method="post">
			<button name="main" value="{$server.server_id}" type="submit" title="Set as main">MAIN</button>
		</form>
	{/if}
</div>

</div>

{foreachelse}
<button disabled>you own no servers - <a href="{$config.url}shop">buy some components</a> then <a href="{$config.url}servers/build/hell">build one</a></button>
{/foreach}

<div style="padding:20px">
	<a class="button text-center" href="{$config.url}servers/build/hell">Build a new server</a>
</div>