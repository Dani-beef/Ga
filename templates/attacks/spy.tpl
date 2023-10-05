{include file="header_home.tpl" no_sidebar=true}

{include file="grid/grid_header.tpl"}
{include file="error_success.tpl"}



    <div class="futureNav middle" >
      <ul>
        <li>SPY</li>

        <li>ON</li>
        <li>{$attack.receiver}</li>

      </ul>
    </div>
   
	<div class=" Danlor-A-trans" style="background-position:50% top; background-size:50%;">
		
    <div class="well text-center">
      {if $GET["inprogress"]}
        {$attack.created|date_fashion}
        {else}
        {($attack.created + $attack.totalSeconds)|date_fashion}
        {/if}
    </div>
   
	
  <hr/>

    
   
    {if $attack.report}
		{if $attack.report.attemptDetected}
		<div class="row"><div class="col-md-12">
			<div class="alert alert-danger">
				Spy attempt has been detected by target systems!
			</div>
			</div></div>
			{/if}
    {/if}

  
  {if $GET["inprogress"]}
     
          <div class="row-fluid">
            <div class="col-md-7 nopadding">
              <div class="alert alert-error errorModule ">
                Spy attempt on {$receiver.username} will be executed in
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
      
    {/if}
	
	 {if $attack.report}
	 
	 <div class="alert alert-warning">
	 	You were able to record data regarding {$attack.report.skills|count} of the target's skills.
	 </div>
    	{foreach $attack.report.skills as $skill => $value}
		<div class="row mb10">
			<div class="col-xs-8">
				<button disabled>{$theskills[$skill].name}</button>
			</div>
			<div class="col-xs-4">
				<button disabled>Level {$value}</button>
			</div>
		</div>
		{foreachelse}
			<div class="alert alert-warning">
				No skill levels obtained
			</div>
		{/foreach}
	 {/if}
</div>
 