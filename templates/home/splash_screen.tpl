{include file="header_home.tpl" no_menu=true noHackBody = true}
<div id="cann">
	<canvas id="can" class="transparent_class"></canvas>
</div>
<script src="{$config.url}layout/js/crazyIntro.js"></script>
 
<div class="row text-center" style="margin-top: 50px;">
	<div class="col-md-4 col-xs-10 col-sm-9 inline mb10 nofloat">
<br/><br/>
	{include file="error_success.tpl"}

		<div class="logo-container">
			<div class="loginContainer alphaGlow mb10">
				<form method="post">
					<input type="hidden" name="process" value="true"/>
					<input type="text" maxlength="15" placeholder="USER" name="username" required="required" class="text-center" style="border-bottom:0"/>
					<input type="password" maxlength="20" placeholder="PASSWORD" class="text-center" data-no-voice name="password" required="required"/>
					<button type="submit" class="connect"><span class="glyphicon glyphicon-flash"></span></button>
				</form>
			</div>
			<div class="login_links">
				<div class="row ">
					<div class="col-md-6 mb10">
						<a href="{$config.url}register" title="in less than a minute">create new account</a>
					</div>
					<div class="col-md-6 mb10">
						<a href="{$config.url}register/forgot/password">forgot user | pass</a>
					</div>
				</div>
				<br/>
			</div>
			<div class="alert alert-info text-center"><strong> <a href="https://github.com/nenuadrian/Secret-Republic-Hacking-Browser-Game-V3" target="_blank">Open Source framework of this game on GitHub</a></strong></div>

		</div>

	<br/>
	<a href="{$config.url}hackdown">
		 		 <div class="panel panel-future">
				<div class="panel-body">
					{if $hackdownRemaining}
						  {include file="components/hackdown.tpl" countdownFrom=$hackdownRemaining totalCountdown=24*60*60
                                                    id='hackdown' textCountdown = "true"
                                                    progressBarCountdown = "true" reloadOnFinish = true
                                                    textFinish = "Hackdown ended"
                                                    progressBarClass = "progress" textLeft="HACKDOWN in progress"}

      				{else}
						  {include file="components/hackdown.tpl" countdownFrom=$nextSaturdayRemaining totalCountdown=6*24*60*60
                                                    id='hackdown' textCountdown = "true"
                                                    progressBarCountdown = "true" reloadOnFinish = true
                                                    textFinish = "Hackdown in progress"
                                                    progressBarClass = "progress-small"
													textLeft="Hackdown begins in"}


	  				{/if}

		  		</div>
				<img src="{$config.url}layout/img/events/hackdown_main.jpg" class="  imageOpacity" title="Hackdown"/>

			</div></a>
		 {$main_stats} <br/>

	</div>
</div>


<br/><br/><br/><br/>

