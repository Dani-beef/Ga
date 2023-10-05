{include file="header_home.tpl"}

{include file="error_success.tpl"}	
 
 <form method="post">
 <div class = "row">
 	<div class="col-md-5">
		<select name="app">
			{foreach from = $apps item = app}
				<option value="{$app.process_id}" {if $smarty.get.transfer eq $app.process_id}selected{/if}>{$app.name}</option>
			{foreachelse}
				<option>No innactive applications available for transfer
			{/foreach}
		</select>
	</div>
	<div class="col-md-5">
		<select name="server">
			{foreach from = $servers item = server}
				<option value="{$server.server_id}" >{$server.hostname} - {$server.ip}</option>
			{foreachelse}
				<option>No servers to transfer to</option>
			{/foreach}
		</select>
	</div>
 	<div class="col-md-2">
		<button type="submit">Transfer</button>
	</div>
 	
 </div>
 </form>