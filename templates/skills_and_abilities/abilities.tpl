{include file="header_home.tpl" no_sidebar=true}

{include file="error_success.tpl"}
{if $abtask}
<div class="well black">
  {include file="components/hackdown.tpl" countdownFrom=$abtask.remainingSeconds totalCountdown=$abtask.totalSeconds
  textCountdown = "true" textLeft = $abtask.name
  progressBarCountdown = "true" reloadOnFinish = "true"}
</div>
{if $abtask.remainingSeconds > 60*60}
<form method="post">
	<div style="padding:20px">
	<button type="submit" name="alpha_coins" value="true">Decrease waiting time by an hour for 1 Alpha Coin</button>
	</div>
</form>
{/if}
{else}			
<h1 class="text-center">ability hive</h1>
<br/>
<link rel="stylesheet" href="{$config.url}layout/honeycombs/homeycombs/css/homeycombs.css" type="text/css"/>
<script src="{$config.url}layout/honeycombs/homeycombs/js/jquery.homeycombs.js"></script>
<script>
  $(document).ready(function(){
    $(".ability-hex").click(function(){
      var ability =  $(this).attr("data-ability");
      if ($(".ability:visible").length)
        $(".ability:visible").fadeOut("slow",function(){
          $("#ability_" + ability).fadeIn("slow");
        
        });
      else $("#ability_" + ability).fadeIn("slow");
        scrollToElement("#ability-details");
    });
  });
</script>
<div class="honeycombs">
  {foreach from=$abilities key=abilityKey item=ability}
  <div class="comb ability-hex" data-ability = "{$abilityKey}"  style="{if !$ability.cant}opacity:.{/if}">
    <img src="{$config.url}layout/img/modules/abilities/{$ability.image}" />
  </div>
  {/foreach}    
</div>
<br/><br/>
<section id = "ability-details">
  {foreach from=$abilities key=abilityKey item=ability}
  <div id = "ability_{$abilityKey}" class="ability nodisplay">
    <h1>{$ability.name} ({if $userAbilities.$abilityKey}{$userAbilities.$abilityKey}/{$ability.maxLevel}{else}not learnt{/if})</h1>
   <hr/>
	
    {if $ability.cant eq "maxLevel"}
    <div class="alert alert-warning">
      Max level achieved for this ability
    </div>
    {elseif $ability.cant eq "userLevel"}
    <div class="alert alert-error">
      You need to be level {$ability.rates.userLevel} to upgrade ability
    </div>
    {elseif $ability.cant eq "userMoney"}
    <div class="alert alert-error">
      Not enough money available in your balance
    </div>
    {elseif $ability.cant eq "userEnergy"}
    <div class="alert alert-error">
      Not enough energy to sustain upgrade
    </div>
	{elseif $ability.cant eq "dataPoints"}
    <div class="alert alert-error">
      Not enough data points to sustain upgrade
    </div>
    {/if}
    
   
    {if $ability.cant ne "maxLevel"}
    <div class="row mb10">
      
      <div class="col-xs-3">
        <button disabled >
        {$ability.rates.price|number_format}$
        </button>
      </div>
      <div class="col-xs-3">
        <button disabled >
        {$ability.rates.dataPoints|number_format} data points
        </button>
      </div>
	  <div class="col-xs-3">
        <button disabled >
        {$ability.rates.energy|number_format} energy
        </button>
      </div>
	  
	  <div class="col-xs-3">
        <button disabled >
        {$ability.rates.time|sec2hms}
        </button>
      </div>
    </div>
    {/if}
    <div class="row">
      <div class="col-md-3">
	  	<div class="well text-center">
       	<img src="{$config.url}layout/img/modules/abilities/{$ability.image}" />
		</div>
		<div class="well black">
        <div class="progress" >
          <div class="progress-bar" style="width: {($userAbilities.$abilityKey/($ability.maxLevel/100))}%"></div>
        </div>
		</div>
      </div>
      <div class="col-md-7">
        {if $ability.description}
        <div class="futuristicPanel">{$ability.description}</div>
        {/if}
        {if !$userAbilities[$abilityKey]}
   
        {if $ability.requirements}
        <div class="panel panel-glass">
          <div class="panel-heading">Requirements</div>
		  <div class="panel-body">
		  <div class="row">
          {foreach from=$ability.requirements key=k item=r}
		<div class="col-md-6">
		{if !($userAbilities[$k] gte $r)}
		  	<div class="alert alert-danger text-center mb10">
				{$abilities.$k.name} ({$r})
			</div>
		{else}
			 <button class="mb10" disabled>{$abilities.$k.name} ({$r})</button>
		  {/if}
		  
		 </div>
          {/foreach}
		  </div>
		  </div>
        </div>
        {/if}
        {/if}
        {if $ability.cant ne "maxLevel"}
		<div class="panel panel-glass">
        <div class="panel-heading">
          <strong>Bonus skill points for next level</strong>
        </div>
		<div class="panel-body">
			<div class="row">
          {foreach from=$ability.rates.skills key=skillKey item=skillValue}
		  <div class="col-md-6">
		  <button disabled class="mb10">
          	{$theskills.$skillKey.name} (+{$skillValue})
			</button></div>
          {/foreach}
		  </div>
		  </div>
        </div>
        {/if}
      </div>
      <div class="col-md-2 ">
	  
        {if !$ability.cant}
        <form method="post"><input type="hidden" name="a" value="{$abilityKey}"/>
          <input type="submit" value="Upgrade" class="btn" />
        </form>
        {else}
        <button disabled class="disabled">
        No action
        </button>
        {/if}
      </div>
    </div>
  </div>
  {/foreach}
</section>
{/if}