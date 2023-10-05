
{include file="header_home.tpl" no_sidebar=$no_side}

      {include file="job/job_header.tpl"}

		
	
	
  {if !$trainTask}
 
  <div class="well text-center">
        
        <p>By training you will earn new skills and prepare yourself for real missions and challenges.</p>
		<p>Forge your mind and train your hands as they're the most important tools a hacker needs.</p>
		<p>Problems with the pattern games? Feeling like you'll never figure out those models? Try skimming through <a href="http://www.cimt.plymouth.ac.uk/projects/mepres/allgcse/bkb12.pdf" target="_blank">this cheatsheet</a>, it serves as inspiration for most of them.
		</p>
		The higher the difficulty the higher the chance for greater rewards.
      </div>
	   {include file="error_success.tpl"}
        {if !$trainLog.log_id}
        <form method="post">
        	<div class="row">
				<div class="col-xs-4">
					<button type="submit" name="train" value="low">Low difficulty</button>
				</div>
				<div class="col-xs-4">
					<button type="submit" name="train" value="mid">Medium difficulty</button>
				</div>
				<div class="col-xs-4">
					<button type="submit" name="train" value="high">High difficulty</button>
				</div>
			</div>
        </form>
        {else}
		
			<div class="panel panel-glass">
				
				<div class="panel-body">
					{include file="components/hackdown.tpl" countdownFrom=$trainLog.remaining totalCountdown=$trainEvery
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="You'll be able to train again in"}
				</div>
				<div class="panel-footer">You can train once every {$trainEvery|sec2hms}.</div>
				
			</div>
        {/if}
  
  	<br/><br/>
	<h1 class="nomargin">training history</h1>
	<small><em>only last 10 displayed</em></small>
	<hr/>
	<div class="well black">
	{foreach from = $history item = train}
		<div class="row mb10">
			<div class="col-xs-2">
				{if $train.success}
					<div class="alert alert-success text-center nomargin">DONE</div>
				{else}
					<div class="alert alert-danger text-center nomargin">FAILED</div>
				{/if}
			</div>
			<div class="col-xs-7">
				<div class="well black nomargin">
					{$train.created|date_fashion}
				</div>
			</div>
			<div class="col-xs-3">
				{if $train.reward_id}
					<a href="{$config.url}rewards/myReward/{$train.reward_id}" title="Reward"><button><span class="glyphicon glyphicon-gift"></span></button></a>
				{/if}
			</div>
		</div>
	{foreachelse}
		<div class="alert alert-info text-center">
			no training records
		</div>
	{/foreach}
  </div>
    
  {else}
  <div class="row">

        <div class="col-xs-3 nopadding">
          <img src="{$config.url}layout/img/characters/rainless.png" class="" style="border:1px solid rgba(70, 120, 185, 0.4);max-width:100%" />
            
        </div>
        <div class="col-xs-9">
          <div class="well mb10">
           {include file="components/hackdown.tpl" countdownFrom=$trainTask.remainingSeconds totalCountdown=$trainTask.totalSeconds
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="You must complete your training tasks in"}

            </div>
            {include file="error_success.tpl"}
  	{if $trainTask.dataid eq 1}

             <form method="post">
			 	
            	<div class="panel panel-glass">
					<div class="panel-heading">Match</div>
					<div class="panel-body text-center">
             		 {$captcha}
					 </div>
					  <input type="submit" name="answer" value="Decrypt ({$trainTask.steps|number_format} remaining)"/>
            </div>
           
            </form>
          
  	{elseif $trainTask.dataid eq 2}
	
	<form method="post">
		<div class="panel panel-glass">
					<div class="panel-heading">Find X so that the pattern is complete</div>
					<div class="panel-body text-center">
             		 <div class="alert alert-warning">
				<strong>TIPS</strong> You might need a pen and paper at first. Try substracting numbers that are next to each other, look carefully at the results. You'll soon get used to all the patterns.
			</div>
		<h1 class="text-center" style="font-size:60px">
		{foreach $trainTask.step.numbers as $key => $number}
			{if $trainTask.step.answer_missing ne $key}
				{$number}
			{else }
				X
			{/if}
		{/foreach}
		</h1>
		
		
					 </div>
					 <div class="row-fluid">
					 	<div class="col-md-12">
							<div class="row">
								<div class="col-md-7 nopadding">
					 <input type="text" name="answer" placeholder="Answer" class="text-center" autocomplete="off" autofocus="autofocus"/>
					 			</div>
								<div class="col-md-5 nopadding">
					  <input type="submit" value="I'M FEELING LUCKY ({$trainTask.steps|number_format} remaining)"/>
					 			</div>
							</div>
						</div>
					</div>
            </div>
			</form>
			
			
	{/if}
	</div>
      
    </div>
	
  {/if}



	
	
		