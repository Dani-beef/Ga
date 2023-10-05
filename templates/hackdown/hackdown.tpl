{include file="header_home.tpl" }


{if $smarty.post.arena}

 <form method="post">
  <input type="hidden" name="arena" value="true" />      
	<div class="alert alert-info">
		<p>Select the servers you want to use in the arena attack.</p>
		<p>
		They will contributed to your attack and defense and might be dealt components damage. Check your <a href="{$config.url}grid/layers/show">layers</a> to evaluate your power.
		</p>
		<p>
		The servers used into the attack will be locked and you will be unable to use them into another attack until the current one has finished. Moreover, they will no longer contribute to your defense in case you are attacked or spyed on.
	</p></div>
	
	{include file='grid/pick_unused_servers.tpl'}
	
	<div style="padding:20px">

		<button type="submit" name="initiate" value="true"><span class="glyphicon glyphicon-screenshot"></span></button>
	</div>
</form>

{else}

	<div class=" text-center">
		<img src="{$config.url}layout/img/events/hackdown.jpg" style="width:100%"/>
	</div>
	<hr/>
	<a href="{$config.url}hackdown/rankings/gimme"><button>RANKINGS FOR LAST HACKDOWN</button></a>

<hr/>

{if $inArena}
	{include file="hackdown/hackdown_arena.tpl"}


{else}
{if $hackdownRemaining }<br/>
	<h3 class="text-center">
You have Hackdowned {($hacks.nrMissions + $hacks.nrAttacks)|number_format} ({$hacks.nrMissions} hacks && {$hacks.nrAttacks} Arena) successful times
</h3><br/>
{/if}


<div class="row">
	<div class="col-md-6">
	
		

	<div class="panel panel-glass">
		
		<div class="panel-body text-center">
			It doesn't take a hero to order men into battle. It takes a hero to be one of those men who goes into battle. 
		</div>
		<div class="panel-footer text-right">Norman Schwarzkopf</div>
	</div>
	<div class="panel panel-glass ">
			<div class="panel-heading">About HACKDOWN</div>
			<div class="panel-body">
				<p>Hackdown is a mini-competition organized by hackers within the big competition started by Alpha.</p>
				<p>A Hackdown takes place every week on Saturday and lasts for the entire day.</p>
				<p>During a Hackdown, hackers can complete special missions as many times as they want gaining points for each successful attempt.</p>
				<p>Anonymous battles can also take place amongst participants in the Arena, which again will improve rankings if won.</p>
				At the end of a Hackdown, stats and rankings are computed and every hacker and their organizations receive rewards depending on how well they did compared to everybody else.
					
			</div>
			<div class="panel-footer text-center">
						<strong>We are hackers and we know what YOU want. You want fame and power. You want prestige and influence. You need to be part of the Hackdown!</strong>
</div>
		</div>
		
		<div class="panel panel-glass">
			<div class="panel-heading">Rewards</div>
			<div class="panel-body">
				Rewards include but are not limited to: fame, money, Universal Skill Points, experience, high priced software and hardware for outstanding hackers.
			</div>
		</div>

	</div>
	<div class="col-md-6">
	
	{if $nextSaturdayRemaining}

<div class="panel panel-glass ">
	
	<div class="panel-body">
{include file="components/hackdown.tpl" countdownFrom=$nextSaturdayRemaining totalCountdown=6*24*60*60
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="NEXT HACKDOWN IN"}
</div>
<div class="panel-footer">You think you have what it takes to be one of the champions?</div>
</div>


{/if}

{if $hackdownRemaining}
<div class="panel panel-glass ">
	<div class="panel-heading">Hackdown countdown</div>
	<div class="panel-body">
{include file="components/hackdown.tpl" countdownFrom=$hackdownRemaining totalCountdown=24*60*60
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="Hackdown ends in"}
</div>
</div>

	
	
	
		
	
		<div class="panel panel-glass ">
			<div class="panel-heading">Mission</div>
			<div class="panel-body">
				<p>Especially challenging missions have been prepared.</p>
				<p>When you complete a mission succesffully you gain points for yourself, your organization and zone.</p>
				
			
			</div>
			<form method="post">
<button type="submit" name="hackdown" value="true">BEGIN A NEW MISSION</button>
</form>
		</div>
		<div class="panel panel-glass">
		<div class="panel-heading">Arena</div>
			<div class="panel-body">
				<p>If you join the Arena you will be fighting another other hackers who aren in there.</p>
				<p>You will receive a report as soon as someone is available to battle with you and the battle has reached its conclusion.</p>
				<p>Once joined you cannot retreat until you have attacked someone (which will happen automatically when someone is available).</p>
				<p>Attacks are similar to the Grid ones from the point of view of hardware damage and security layers. However, they are anonymous.</p>
				<p>If there's no one to match you with, you will be waiting for a while. After 20 minutes of waiting unmatched, you will be kicked out of the Arena.</p>
				
			</div>
			<form method="post">
<button type="submit" name="arena" value="true">ENTER ARENA</button>
</form>
		</div>
		
	
		{/if}
	</div>
</div>
{/if}
{/if}
