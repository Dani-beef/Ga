<h3>ONGOING</h3>
 {foreach from = $wars item = war} 
 <div class="panel panel-future">
 	<div class="panel-heading">
 		with {$war.name}
	</div>
	<div class="panel-body">

	 {if $war.status eq 1}
	
		{include file="components/hackdown.tpl" countdownFrom=$war.start - time() totalCountdown=$war.start - $war.created
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="WAR IS GOING TO START IN"}
	 {elseif $war.status eq 2}
	   {include file="components/hackdown.tpl" countdownFrom=$war.ends - time() totalCountdown=$war.ends - $war.start
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="WAR IS GOING TO END IN"}
	 {/if} 
	 
	</div>
	<a href="{$config.url}organization_wars/war/{$war.war_id}" >
	<button>
		{if $war.status eq 1} View war {elseif $war.status eq 2} Fight for {$org.name} {/if}
		</button>
	</a>
</div>
 {foreachelse}
<div class="alert alert-info">

	 {$org.name} is not taking part in any wars right now.
</div>
 {/foreach}
<h3>HISTORY</h3>
 {foreach from = $endedWars item = endedWar} 
 
	<div class="panel panel-future">
		<div class="panel-heading">
			War versus <a href="{$config.url}organizations/organization/{$endedWar.id}">{$endedWar.name}</a> (initiated by {if $endedWar.org1_id eq $org.id}us{else}them{/if})
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-6">
	 {if $endedWar.winner_org_id eq $org.id}
	<div class="alert alert-success nomargin">
		 We have won this battle.
	</div>
	 {else}
	<div class="alert alert-danger nomargin">
		 We have lost this battle.
	</div>
	 {/if}
	 	</div>
			<div class="col-md-6">
	 <div class="alert alert-info nomargin">
	 	{if $endedWar.org1_id eq $org.id}
			We scored {$endedWar.org1_points|number_format} points while they had {$enderWar.org2_points|number_format}.
		{else}
			We scored {$endedWar.org2_points|number_format} points while they had {$enderWar.org1_points|number_format}.
		{/if}
	 </div>
	 		</div>
			</div>
		</div>
		<div class="panel-footer text-right">
			War ended {$endedWar.finished|date_fashion} ({$endedWar.finished_date})
		</div>
	</div>
 {foreachelse}
<div class="alert alert-info">
	 Organization has not gone through any wars. Peaceful, aren't we?
</div>
  {/foreach}