{include file="header_home.tpl" no_sidebar=true}
{include file="grid/grid_header.tpl"}
{include file="error_success.tpl"}
{if $attack.sender}
<div class="futureNav" >
  <ul>
    {if $attack.type eq 4}
    <li><a>HACKDOWN</a></li>
    {else}
    <li><a >{$attack.sender}</a></li>
    <li><a>VS</a></li>
    <li><a >{$attack.receiver}</a></li>
    {/if}
  </ul>
</div>
<div class="text-center">

  <img src="{$config.url}layout/img/modules/grid/heavy_attack.png" style="max-width:100%">
</div>
{/if}
{if $GET["inprogress"]}
<div class="row-fluid">
  <div class="col-md-7 nopadding">
    <div class="alert alert-error errorModule ">
      {$attack.sender}'s attack against {$attack.receiver} will be executed in
    </div>
  </div>
  <div class="col-md-5 ">
    <div class="alert alert-error errorModule text-center">
      {include file="components/hackdown.tpl" countdownFrom=$attack.remainingSeconds totalCountdown=$attack.totalSeconds
      id=($attack.attack_id+$user["id"]) textCountdown = "true" 
      progressBarCountdown = false reloadOnFinish = false 
      textFinish = "Computing results, may take a couple of minutes" textNormal = "true"}
    </div>
  </div>
</div>
{else}

    {if $simulation} 
    <button disabled>WINNER WAS {if $attack.report.winner eq 1}SENDER{else}RECEIVER{/if}</button>
    {elseif $attack.type eq 4}
    <button disabled class="mb10">
    WINNER WAS
    {if $attack.report.winner eq $user.id}
    YOU
    {else}
    ANONYMOUS
    {/if}
    </button>
    {else}
    <button disabled class="mb10">Winner WAS {if $attack.report.winner eq $sender.id}{$attack.sender}{else}{$attack.receiver}{/if}</button>
    {/if}
    {if !$simulation}
      {if !$GET["inprogress"]}
      <div class="well black text-center">
        Attack ended {($attack.created + $attack.totalSeconds)|date_fashion}
      </div>
      {/if}
  
    {/if}
    
 
    {if $attack.sender_user_id == $user.id || $simulation}
    <h3 >attacker {if $attack.sender} ({$attack.sender}){/if} with {$attack.servers|count} servers </h3>
    <div class="panel-white">
      <div class="panel-body">

        <div class="text-center">
          Servers received {$attack.report.serversDamage.sender.damage|number_format}% damage to  components and {$attack.report.serversDamage.sender.softwareDamage|number_format}% to software.
        </div>
      </div>
    </div>
    {/if}
    {if $receiver.id == $user.id || $simulation}
    <h3 >
          receiver{if $attack.receiver} ({$attack.receiver}){/if}</h3>
        </h3>
    <div class="panel-white">
      <div class="panel-body">
        

         <div class="text-center">
          Servers received {$attack.report.serversDamage.receiver.damage|number_format}%  damage to  components and {$attack.report.serversDamage.receiver.softwareDamage|number_format}% to software.
        </div>
       </div>
    </div>
    {/if}

<br/>
<style>
  .clash{

  }

  .clash .round
  {
    overflow:auto;overflow: auto;
  background-color: rgba(0, 0, 0, 0.1);
  border: 3px solid rgba(0, 126, 224, 0.29);
  border-bottom-width: 2.5px;
  border-left:0; border-right:0;
  border-top: 2.5px;
  text-transform:uppercase;
    background-color: rgba(87, 166, 236, 0.04);
  }

  .clash .attacker
  {
  }
  .clash .defender
  {
  }

  .clash .round .attacker,.clash .round .defender
  {


  }

  .clash .clash-number
  {
    font-weight:bold;
    padding:10px;
    padding-top:16px;
    padding-bottom:17px;
  }
  .clash .who-label{
    background-color:rgba(0, 126, 224, 0.29);
    text-align:left;
    display:block;
    padding:10px;
    padding-top:7px;
    padding-bottom:7px;
    font-size:12px;
    color:rgba(255, 255, 255, 0.58);
    font-weight:bold;
  }

  .clash .value
  {
    font-size:13px;
    font-weight:bold;
    padding:12px;
  }
  .layer{
    height:250px;border-bottom:6px solid rgba(0, 126, 224, 0.29);
                              border-top:1px solid rgba(0, 126, 224, 0.29);
  }
  .layer .breaching{
    float:left;position:relative;height:100%; background-color: rgba(0, 126, 224, 0.09); padding:20px;
  }
  .layer .percentage
  {
    position:absolute; width:100%;line-height:250px;
    text-align:center;
    padding:0;
    margin:0;
  }
</style>

<div class="row">
  {if $attack.report}


  {foreach from=$attack.report.layerFights key = layer item = fight}
    <div class="col-md-12 ">
      <div class="layer">
          <div class="breaching" style="width:{$fight.breaching}%;">
          </div>
          <h2 class="percentage" >
           {$layer|ordinal} layer breached {$fight.breaching|round:2}%
          </h2>
      </div>
     
    </div>
    {foreach $fight.rounds as $key => $round}
      <div class="row-fluid clash">
        <div class="col-md-12">
          <div class="round">
            <div class="row-fluid text-center">
              <div class="col-md-1 clash-number">
                  {($key + 1)|ordinal}<br/>
                  CLASH
                
              </div>
              <div class="col-md-11">
                <div class="row">
                  <div class="col-xs-6 attacker">
                    <div class="who-label">
                      attacker [{$attack.sender}]
                    </div>
                    <div class="row">
                      <div class="col-md-6 value">
                         {$round.layers.attacker.attack|number_Format} ATK
                      </div>
                      <div class="col-md-6 value">
                          {$round.layers.attacker.defense|number_Format} DEF
                      </div>
                    </div>
                  </div>
                  <div class="col-xs-6 defender">
                    <div class="who-label">
                    defender [{$attack.receiver}]
                  </div>
                    <div class="row">
                      <div class="col-md-6 value">
                         {$round.layers.defender.attack|number_Format} ATK
                      </div>
                      <div class="col-md-6 value">
                          {$round.layers.defender.defense|number_Format} DEF
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--
      <div class="col-md-6">
        <div class="panel panel-glass">
          <div class="panel-heading"><strong>CLASH {$key + 1}</strong></div>
          <div class="panel-body">
            <h4>
              {if $attack.type eq 4}
              {if $sender.id eq $user.id}
              {$attack.sender}
              {else}
              ANONYMOUS
              {/if}
              {else}
              {$attack.sender}
              {/if}
            </h4>
            <div class="row">
              <div class="col-xs-6">
                <button disabled>
                  ATK: {$round.layers.attacker.attack|number_Format}
              </div>
              <div class="col-xs-6">
              <button disabled>DEF: {$round.layers.attacker.defense|number_Format}
              </div>
            </div>
            <h4>
            {if $attack.type eq 4}
            {if $receiver.id eq $user.id}
            {$attack.receiver}
            {else}
            ANONYMOUS
            {/if}
            {else}
            {$attack.receiver}
            {/if}
            </h4>
            <div class="row">
            <div class="col-xs-6">
            <button disabled>ATK: {$round.layers.defender.attack|number_Format}
            </div>
            <div class="col-xs-6">
            <button disabled>DEF: {$round.layers.defender.defense|number_Format}
            </div>
            </div>
          </div>
          <button disabled style="border-bottom:0;border-left:0;border-right:0">{$round.layerDamage|number_format} damage</button>
        </div>
      </div>-->
    {/foreach}
  {/foreach}
  
  {else}
  <div class="alert alert-info">Report not yet available</div>
  {/if}
 
</div> {/if}