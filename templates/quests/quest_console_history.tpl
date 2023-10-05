{include file="header_home.tpl"}

<form method="post">
<div class="row">
	<div class="col-md-4">
		<a href="{$config.url}quests" class="text-center button">BACK TO MISSION</a>
	</div>
	<div class="col-md-2"></div>
	{if $user.in_party}
	<div class="col-md-4">
		
		
			<select name="participant">
				{foreach from = $participants item = participant}
					<option value="{$participant.id}" {if $currentParticipant eq $participant.id}selected{/if}>{$participant.username}</option>
				{/foreach}
			</select>
			
		
	</div>
	<div class="col-md-2">
	<button type="submit"><span class="glyphicon glyphicon-download"></span></button>
		
	</div>
	{/if}
</div>
</form>

<br/>
 {include file="error_success.tpl"}
<div class="text-center">
{$pages}
</div>

{foreach from = $history item = h}

<div class="panel panel-future">
	<div class="panel-heading">
		{if $h.input}{$h.input}{else}none{/if}
	</div>

<div class="panel-body">
{$h.output}
</div>
</div>
{foreachelse}

{/foreach}

<div class="text-center">
{$pages}
</div>