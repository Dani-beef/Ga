{include file="header_home.tpl" no_sidebar=true}

{include file="grid/grid_header.tpl"}


{include file="error_success.tpl"}

<h2>attack logs</h2>
<div class="well black">
	These are all the available stored logs of attacks you have taken part in. We've got {$nrAttacks|number_format} of these babies on record.
</div>
<br/>
{foreach from = $attacks item = attack}

    <div calss="row-fluid">
      <div class="col-md-2">
	     {if $attack.type eq 1}
		 	<div class="alert alert-warning text-center nomargin">SPY</div>
		 
		 {elseif $attack.type eq 4}
		 	<div class="alert alert-info text-center nomargin">HACKDOWN</div>
		 {else}
		 
	  	{if $attack.winner_user_id eq $user.id}
			<div class="alert text-center alert-success nomargin" >
		{else}
			<div class="alert text-center alert-danger nomargin">
		{/if}
	  	{if $attack.sender_user_id eq $user.id}
			SENT
		{else}
			RECEIVED
		{/if}
		
		</div>{/if}
	  </div>
      <div class="col-md-6">
        <a href="{$config.url}attacks/attack/{$attack.attack_log_id}" class="button text-center">
		{if $attack.type eq 4}ANONYMOUS HACKDOWN{else}
        {if $attack.type eq 2}{$attack.sender} vs {/if}{$attack.receiver}
		{/if}
        </a>
      </div>
      <div class="col-md-4 text-right">
        <div class="well black">
          {$attack.created|date_fashion}
        </div>
      </div>
    </div>
 
{foreachelse}
<div class="well black text-center">
  No fights
</div>
{/foreach}

<div class="text-center">
	{$pages}
</div>