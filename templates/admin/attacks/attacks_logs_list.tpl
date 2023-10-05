{include file="header_home.tpl" }

{include file='admin/attacks/attacks_header.tpl'}
<h1 class="text-center">logs</h1>
<h3>Attacks</h3>
{foreach from = $attacks item = attack}
<div class="row">
	<div class="col-md-2">
		<button disabled>{$attack.attack_log_id}</button>
	</div>
	<div class="col-md-5">
		<div class="well black">
			{$attack.sender_username|profile_link} vs {$attack.receiver_username|profile_link}
		</div>
	</div>
	<div class="col-md-2">
		<a class="button text-center" href="{$config.url}attacks/attack/{$attack.attack_log_id}">DIRECT REPORT</a>
	</div>
</div><br/>
{foreachelse}
<div class="well black text-center">
no attack results
</div>

{/foreach}



<h3>Spy</h3>
{foreach from = $spyAttacks item = attack}

{foreachelse}
<div class="well black text-center">
no spy results
</div>
{/foreach}



<div class="text-center">
{$pages}
</div>