{include file="header_home.tpl"}


{include file="error_success.tpl"}	

<form method="post">
<div class="panel panel-future">
	<div class="panel-heading">
		Change hostname
	</div>
	
	<div class="panel-body">
		<p>Hostname should be sensible and contain between 3 and 30 characters</p>
		<input type="text" name="hostname" value="{if !$smarty.post.hostname}{$server->server.hostname}{else}{$smarty.post.hostname}{/if}"/>
	</div>
	<div class="row">
		<div class="col-md-7">
			<button type="submit">Update</button>
		</div>
		<div class="col-md-5">
			<a href="{$config.url}servers/server/{$server->server_id}" class="button text-center"><span class="glyphicon glyphicon-remove-sign"></span></a>
		</div>
	</div>
</div>
</form>