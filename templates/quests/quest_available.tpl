<div class="row">
   <div class="col-md-3 text-center nopadding">
      <img src="{$config.url}layout/img/characters/eve2_medium.png" style="max-width:100%"/>
   </div>
   <div class="col-md-9">
      <div class="panel panel-future">
         <div class="panel-heading">
            {$myQuest.title}
         </div>
         <div class="panel-body">
            <div class="row">
               <div class="col-xs-3">
                  <button disabled class="mb10">LEVEL {$myQuest.level}</button>
               </div>
               <div class="col-xs-4">
                  <button disabled class="mb10">{($myQuest.time*60)|sec2hms} </button>
               </div>
               <div class="col-xs-5">
                  <button disabled class="mb10">{($myQuest.experience)|number_format} EXP</button>
               </div>
               <div class="col-xs-5">
                  <button disabled class="mb10">ENERGY COST: {($myQuest.energy)|number_format} </button>
               </div>
			   <div class="col-xs-4">
                  <button disabled class="mb10">{($myQuest.money)|number_format} $</button>
               </div>
               <div class="col-xs-3">
                  <button disabled class="mb10"> {($myQuest.skillPoints)|number_format} USP</button>
               </div>
               {if $myQuest.achievement}
               <div class="col-xs-12">
                  <button disabled class="mb10">Achievement: {$myQuest.achievement}</button>
               </div>
               {/if}
            </div>
            <br/>
            <div style=" padding:10px">
               {$myQuest.summary}
            </div>
         </div>
         {if !$myQuest.done || $myQuest.type eq 2}
		
         <form method="post">
            <input type="hidden" name="quest" value="{$myQuest.id}"/>
            <input type="hidden" name="play" value="true"/>
			
            {if $myQuest.party && !$user.in_party}
            	<button disabled>must be in party</button>
            {else}
				{if $myQuest.energy > $user.energy}
					<button disabled>not enough energy</button>
				{else}
				{if $myQuest.done}
            		<button type="submit"><span class="glyphicon glyphicon-repeat"></span></button>
            	{else}
            		<button type="submit"><span class="glyphicon glyphicon-console"></span></button>
            	{/if}
				{/if}
			{/if}
         </form>
         {else}
		 	{if $myQuest.type eq 1}
			<div class="well black nomargin">
				{include file="components/hackdown.tpl" countdownFrom=$myQuest.done + 24*60*60 - time() totalCountdown=24*60*60
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="Mission will be available again in"}
			</div>
			{else}
        	<div class="well text-center nomargin">Finished {$myQuest.doneDate}.</div>
			{/if}
         {/if} 
         {if $myQuest.type eq 1 or $myQuest.type eq 2}
         <div class="panel-footer text-right">
            {if $myQuest.type eq 1}
            Mission can be completed on a daily basis, with rewards
            {elseif $myQuest.type eq 2}
            Mission is repeatable, with rewards for first completion only
            {/if}
         </div>
         {/if}
      </div>
      <div class="text-center">
         <em><small>mission developed by {$myQuest.creator_name|profile_link} ~ <a href="{$config.url}alpha_coins/option/questManager">join mission designers intern team</a></small></em>
      </div>
   </div>
</div>