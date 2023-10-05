


<div class="row mb10">
	<div class="col-xs-2">
		<a href="{$config.url}storage">
		
		<button><span class="glyphicon glyphicon-arrow-left"></span></button>
		</button>
		</a>
	</div>
</div>

<form method="post">
<input type="hidden" name="mount" value="{$smarty.post.mount}"/>
<div class="panel panel-glass">
<div class=" panel-heading">Server
</div>
<div class="panel-body">
	<div class="row">
		<div class="col-xs-8">
	<select name="server">
		{foreach from = $servers item = server}
			<option value="{$server.server_id}" {if $smarty.post.server eq $server.server_id}selected{/if}>{$server.ip} - {$server.hostname}</option>
		{/foreach}
	</select>
		</div>
		<div class="col-xs-4">
			<button type="submit">Pick server</button>
		</div>
	</div>
	</div>
	</div>
</form>

{if $loadd eq 'pick_slot'}
<form method="post">
<input type="hidden" name="mount" value="{$smarty.post.mount}"/>
<input type="hidden" name="server" value="{$smarty.post.server}"/>
<div class="panel panel-glass">
<div class=" panel-heading">Slot
</div>
<div class="panel-body">
	<div class="row">
		<div class="col-xs-8">
	<select name="slot">
				{if $slotsAreAvailable}
			<option value="0">EMPTY SLOT ({$slotsAreAvailable} available)</option>
		{/if}
		{foreach from = $slots item = slot}
			<option value="{$slot.relation_id}">Replace: {$slot.name}</option>
		{/foreach}
		

	</select>
		</div>
		<div class="col-xs-4">
			<button type="submit"><span class="glyphicon glyphicon-record"></span></button>
		</div>
	</div>
	
	
	</div></div>
</form>	
{/if}

