{include file="header_home.tpl"}
{include file="servers/servers_header.tpl"}


<h3>Build server</h3>
<hr/>
<div class="well">
	All components required to build the new server must be located in your <a href="{$config.url}storage">storage</a>. You will be charged <strong>{($cost * $serversCount)|number_format}$</strong> [{$cost|number_format}$ x current number of servers] for a new server license. 
</div>

{include file="error_success.tpl"}	


{if $canBuild}

<form method="post">
<div class="row">
	<div class="col-md-4">
		<button class="disabled">CPU</button>
	</div>
	<div class="col-md-8">
		<select name="cpu">
			{assign var = found value = false}
			{foreach from = $storage item = s}
				{if $s.type eq 1}
					{assign var = found value = true}
					<option value="{$s.storage_id}">{$s.name}</option>
				{/if}
			{/foreach}
			{if !$found}
				<option>No CPU units available in storage</option>
			{/if}
		</select>
	</div>
</div>
<br/>
<div class="row">
	<div class="col-md-4">
		<button class="disabled">Motherboard</button>
	</div>
	<div class="col-md-8">
		<select name="motherboard">
			{assign var = found value = false}
			{foreach from = $storage item = s}
				{if $s.type eq 2}
					{assign var = found value = true}
					<option value="{$s.storage_id}">{$s.name}</option>
				{/if}
			{/foreach}
			{if !$found}
				<option>No Motherboards available in storage</option>
			{/if}
		</select>
	</div>
</div><br/>
<div class="row">
	<div class="col-md-4">
		<button class="disabled">Case</button>
	</div>
	<div class="col-md-8">
		<select name="case">
			{assign var = found value = false}
			{foreach from = $storage item = s}
				{if $s.type eq 3}
					{assign var = found value = true}
					<option value="{$s.storage_id}">{$s.name}</option>
				{/if}
			{/foreach}
			{if !$found}
				<option>No Cases available in storage</option>
			{/if}
		</select>
	</div>
</div><br/>
<div class="row">
	<div class="col-md-4">
		<button class="disabled">Power Source</button>
	</div>
	<div class="col-md-8">
		<select name="power_source">
			{assign var = found value = false}
			{foreach from = $storage item = s}
				{if $s.type eq 4}
					{assign var = found value = true}
					<option value="{$s.storage_id}">{$s.name}</option>
				{/if}
				
			{/foreach}
			{if !$found}
				<option>No Power Sources available in storage</option>
			{/if}
		</select>
	</div>
</div><br/>

<button type="submit"><span class="glyphicon glyphicon-record"></span></button>
</form>
{/if}