{include file="header_home.tpl"}
{include file="servers/servers_header.tpl"}


{include file="error_success.tpl"}	

{if $load eq "mount_component"}


{include file="storage/mount_component.tpl"}	

{else}

<div class="panel panel-glass">
	<div class="panel-heading">
		Storage area
	</div>
	<div class="panel-body text-center">
		<p>6 slots are available by default. An extra slot is given for every 7 levels you achieve. </p>
		{if  !$smarty.session.removeAds}<p><a href="{$config.url}alpha_coins/option/extraStorage1">Get more slots using A-Coins</a>.</p>{/if}
		When selling to the Alpha's shop they will underevaluate items. The cash you receive decreases with damage. 
		
	</div>
	<div class="panel-footer text-right">
		You currently have {$availableSlots} slots available out of which {$storage|count} used.
	</div>
</div>	
<br/>
 
<div id="accordion" role="tablist" aria-multiselectable="true">
<div class="row">
<div class="col-md-6">
{foreach from = $storage key = k item = s}
	{if $k%2 == 0}
	 {include file="storage/storageBit.tpl"}
	
	{/if}
{/foreach}
</div>

<div class="col-md-6">
{foreach from = $storage key = k item = s}
	{if $k%2 != 0}
	 {include file="storage/storageBit.tpl"}
	
	{/if}
{/foreach}
</div>

</div>
{/if}


 
 
</div>