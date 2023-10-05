<h3 style="margin-bottom:0">Dailies</h3>
<small>missions which can be done on a daily basis</small>
<hr/>
{assign var = found value = false}
{foreach from=$quests item=quest} 
{if $quest.type eq 1}
{assign var = found value = true}

<div class="row "  style="margin-bottom:40px">
   <div class="col-md-12">
      <div class="row-fluid">
     	<div class="col-xs-2 nopadding">
			<button disabled style="border-bottom:0; border-right:0">
            {if $quest.party}
            Party
            {else}
            SOLO
            {/if}
			</button>
         </div>
         <div class="col-xs-10 nopadding">
            <div class="well black nomargin">
               {$quest.title}
            </div>
         </div>
 			
		<div class="col-xs-12 nopadding">
			<div class="well black nomargin">
				{$quest.summary}
				
				
			</div>
			
			{if $quest.done}
			<div class="well  nomargin">
					{include file="components/hackdown.tpl" countdownFrom=$quest.done + 24*60*60 - time() totalCountdown=24*60*60
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true"
											  id=$quest.id
                                              textLeft="Mission will be available again in"}
											  </div>
				{/if}
		</div>
         {if !$quest.done}
         <div class="col-xs-12 nopadding">
            <a href="{$config.url}quests/group/{$quest.qgroup_id}/mission/{$quest.id}">
            <button><span class="glyphicon glyphicon-chevron-right"></span></button>
            </a>
         </div>
		 {/if}
      </div>
   </div>
</div>
{/if}
{/foreach}
{if !$found} 
	<div class="alert alert-warning">
		No daily missions currently available in this mission group. 
	</div>
{/if}

<h3 style="margin-bottom:0">Normal and repeatable</h3>
<small>missions that can either be completed  once or repeated with no rewards</small>
<hr/>
{assign var = found value = false}
{foreach from=$quests item=quest} 
{if $quest.type ne 1}
{assign var = found value = true}
<div class="row " style="margin-bottom:40px">
   <div class="col-md-12">
      <div class="row-fluid">
         <div class="col-xs-2 nopadding">
		 	<button disabled style="border-right:0;border-bottom:0">
            {if $quest.type eq 2}
            {if $quest.done}
            Repeatable
            {else}
            Not done
            {/if}
            {else}
            {if $quest.done}
            Done
            {else}
            Not done
            {/if}
            {/if}</button>
         </div>
         <div class="col-xs-10 nopadding">
            <div class="well black nomargin" >
               {$quest.title|strtoupper}
            </div>
         </div>
 		<div class="col-xs-12 nopadding">
			<div class="well black nomargin">
				{$quest.summary}
			</div>
		</div>
         <div class="col-xs-4 nopadding"><button disabled style="border-right:0" >
            {if $quest.party}
            Party
            {else}
            SOLO
            {/if}</button>
         </div>
         <div class="col-xs-8 nopadding">
            <a href="{$config.url}quests/group/{$quest.qgroup_id}/mission/{$quest.id}">
            <button><span class="glyphicon glyphicon-chevron-right"></span></button>
            </a>
         </div>
      </div>
   </div>
</div>
{/if}
{/foreach}

{if !$found} 
	<div class="alert alert-warning">
		No normal or repeatable missions currently available in this mission group. 
	</div>
{/if}



