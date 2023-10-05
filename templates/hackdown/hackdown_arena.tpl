<div class="panel panel-glass ">
	<div class="panel-heading">Hackdown countdown</div>
	<div class="panel-body">
{include file="components/hackdown.tpl" countdownFrom=$hackdownRemaining totalCountdown=24*60*60
                                              textCountdown = "true" progressBarClass = "progress-info"
                                              progressBarCountdown = "true" reloadOnFinish = "true" 
                                              textLeft="Hackdown ends in"}
</div>
</div>


		<div class="alert alert-warning">
			<p>
			You are trapped inside the Arena. As soon as a battle takes place you will receive a report and will be free to start a Hackdown mission or join the arena again.
			</p>
			<br/>
			<strong>If after 20 minutes you haven't been matched, you will be kicked out of the Arena.</strong>
		</div>
		