{include file="header_home.tpl" no_sidebar = true}

{include file="error_success.tpl"}
<!--
<div class="progress well">
  <div class="progress-bar progress-bar-success" style="width: 35%">
  </div>
  <div class="progress-bar" style="width: 20%; background-color:red!important">
  </div>
  
</div>-->


<div style="min-height:1000px;" class="Danlor-A-trans">
    <div class="row mb10">

          <div class="col-md-5 ">
              <a href="{$config.url}organization/show/{$war.org1_id}">
			  	<button>{$war.org1_name}</button></a>
          </div>
          <div class="col-md-2">
            <button disabled>VS</button>
          </div>
          <div class="col-md-5 ">
		  	<button>
              <a href="{$config.url}organization/show/{$war.org2_id}">{$war.org2_name}</a>
            </button>
          </div>
   
    </div>
    <div class="row">

          <div class="col-md-4 ">
            <div class="well black text-center">
              {$war.org1_points|number_format}
            </div>
          </div>
          <div class="col-md-4">
            <button disabled>POINTS</button>
          </div>
          <div class="col-md-4 ">
            <div class="well black text-center">
              {$war.org2_points|number_format}
            </div>
          </div>
       
    </div>
	<div class="row">
		<div class="col-md-12">
    {if $war.status eq 1}
		<div class="panel panel-glass">
			
			<div class="panel-body">
			
	  			{include file="components/hackdown.tpl" countdownFrom=$war.start - time() totalCountdown=$war.start - $war.created
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="WAR IS GOING TO START IN"}
			</div>
			<div class="panel-footer">{$war.org1_name} vs {$war.org2_name}</div>

		</div>
     
    {elseif $war.status eq 2}
		<div class="panel panel-glass">
			
			<div class="panel-body">
			
	  			{include file="components/hackdown.tpl" countdownFrom=$war.ends - time() totalCountdown=$war.ends - $war.start
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="WAR IS GOING TO END IN"}
			</div>
			{if $canFight}
			 <form method="post">
        <button type="submit" name="fight" value="true">Fight for {if $war.org1_id eq $user.organization}{$war.org1_name}{else}{$war.org2_name}{/if} now!</button>
      </form>
{/if}
		</div>
		
    	<div class="alert alert-info">
			"You might have to fight a battle more than once to win." - Margaret Thatcher
		</div>
      
     
    {/if}
		</div>
	</div>
</div>
      
	  