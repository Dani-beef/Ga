{if !$include} {include file="header_home.tpl" no_sidebar=true} {/if}
{if $GET.objectiveView eq "full"}
<div class="row mb10">
  <div class="col-xs-4">
    <a href="{$url}objectiveView/no" ><button><span class="glyphicon glyphicon-arrow-left"></span></button></a>
  </div>
</div>
<div class="well black">
  <article id="objectiveStory">
    {$quest.objective.story}
  </article>
</div>
{elseif $paused}
<div class="alert alert-info">
  Mission has been placed on pause. If you wait too much time (e.g. over 24h) you might fail the mission.
</div>
<form method="post">
  <button type="submit" title="Resume mission" name="pause" value="true"><span class="glyphicon glyphicon-play"></span></button>
</form>
{else}
<audio class="nodisplay" id = "mission-voice">
  <source src="" id = "mission-voice-ogg" type="audio/ogg">
  <source src="" id = "mission-voice-mp3" type="audio/mpeg">
</audio>
<div class="row ">
  <div class="col-md-8">
    {include file="error_success.tpl"}
    <div class="row">
      <div class="col-md-12">
        <div class="row-fluid">
          <div class="col-xs-6 nopadding">
            <div class="well black">
              Trace <span id="trace">{$quest.trace}</span>%
            </div>
          </div>
          <div class="col-xs-6 nopadding text-right">
            <button disabled class="inline nopadding" style="width:{$quest.trace}%;" id="trace-progress"></button>
          </div>
        </div>
      </div>
    </div>
    <div class="nodisplay" id="task">
      <div class="panel panel-glass"  id="theHackdownTask">
        <div class="panel-heading" id="taskTitle">task</div>
        <div class="panel-body">
          <div class="row">
            <div class="col-xs-9">
              <div class="progress nomargin">
                <div class="progress-bar" id="hackdownProgressBarTask" role="progressbar">
                </div>
              </div>
            </div>
            <div class="col-xs-3 text-center" id="hackdownTask">
            </div>
          </div>
        </div>
      </div>
    </div>
    <style>
      #theConsole
      {
      color:rgb(38, 175, 38); height:400px; 
      word-wrap: break-word;
      border-bottom:0;
      letter-spacing:2px;
      }
      .point 
      {
  padding: 5px;
  border: 1px solid rgba(17, 131, 221, 0.13);
  padding-left: 10px;
  border-radius: 3px;
  border-radius: 3px;
  overflow: auto;
  background-color: rgba(48, 114, 171, 0.17);
  overflow: auto;
  margin-bottom: 7px; 
  display:block;
      }

      .point:hover
      {
        border: 1px solid rgba(17, 131, 221, 0.23);
        background-color: rgba(48, 114, 171, 0.22);
      }
    </style>
    <div class="well nomargin">
      <div class=" overflow" id="theConsole" data-height="400">
        {if $quest.connected.ip ne $quest.main}Connected to {$quest.connected.ip}:{$quest.connected.port}<br/>{/if} 
        {if $result}{$result}<br/>{/if}
      </div>
      <div class="text-right">
        <em><small><a href="{$url}history/view">console history</a> - <a onclick="add_input('/help');">help</a></small></em>
      </div>
    </div>
    <div class="row mb10">
      <div class="col-md-12">
        <form method="post" action="#hint" id="console_form">
          <div class="row-fluid">
            <div class="col-xs-9 nopadding">
              <input type="text" id="consoleInput"  autofocus="true" name="consoleInput"  autocomplete="off" placeholder="console ~ /help"/>
            </div>
            <div class="col-xs-3 nopadding">
              <button type="submit" id="button" style="border-left:0"><span class="glyphicon glyphicon-console"></span></button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <script src="{$config.url}layout/js/quest/questPlay.js?cache=32" type="text/javascript"></script>
    <script type="text/javascript">
      $(window).load(function(){ 
      					{if !$quest.task}
      					  $().questPlay({ username: "{$user.username}", 
      									  currentObjective: {$quest.objective.id},
      									  hackdown: "#theHackdown",
      									  {if $user.in_party}
      									  	in_party:true
      									  {/if}
      									}); 
      					{else}
      					  $().questPlay({ username: "{$user.username}", 
      									  actionStart: true, actionStartTime: {$quest.task.remainingSeconds}, 
      									  actionStartTitle: "{$quest.task.title}",
      									  currentObjective: {$quest.objective.id},
      									  hackdown: "#theHackdown",
      									  {if $user.in_party}
      									  	in_party:true
      									  {/if}
      									}); 				     
      					{/if}
      				});
      	  
    </script>
    <div class="well black"  id="objectiveStoryContainer">
      <div class="row mb10">
        <div class="col-xs-4">
          <small><em></em></small>
        </div>
        <div class="col-xs-8 text-right">
          <small><em><a href="{$url}objectiveView/full">read in full screen</a></em></small>
        </div>
      </div>
      <article id="objectiveStory">
        {$quest.objective.story}
      </article>
    </div>
  </div>
  <div class="col-md-4">
    <div class="well black" >
      {include file="components/hackdown.tpl" countdownFrom = $qtask.remainingSeconds totalCountdown = $qtask.totalSeconds textCountdown = "true" progressBarClass = "active progress-info" progressBarCountdown = "true" reloadOnFinish = "true" textLeft='<span class="glyphicon glyphicon-time"></span>'}
      {if !$smarty.session.premium.removeAds && !$smarty.session.premium.extraTime}
      <div class="text-right">
        <small><a href="{$config.url}alpha_coins/option/extraTime">need more time?</a></small>
      </div>
      {/if}
    </div>
    <div class="panel panel-future">
      <div class="panel-heading text-right">
        discovered hosts
      </div>
      <div class="panel-body" id="hosts">
        {foreach from=$quest.discovered key=ip item=hostname} 
        {if $quest.hosts[$ip].myServer}
          <a class="point" onclick="add_input('{$ip}');">{$ip} | {$hostname}</a>
        {/if}
        {/foreach}
        <hr/>
        {foreach from=$quest.discovered key=ip item=hostname} 
        {if !$quest.hosts[$ip].myServer}
        <div class="point">
          <a onclick="add_input('{$ip}');">{$ip} | {$hostname}</a>
        </div>
        {/if}
        {/foreach}
      </div>
    </div>
    <div role="tabpanel">
      <div class="row">
        <!-- Nav tabs -->
        <div role="tablist">
          <div class="col-xs-4">
            <a href="#soundtracks" aria-controls="soundtracks" role="tab" data-toggle="tab">
            <button class="mb10"><span class="glyphicon glyphicon-headphones"></span></button>
            </a>
          </div>
          {if $logged}
          <div class="col-xs-4" title="Notepad">
            {if !$notepadAllowed}
            <a href="{$config.url}alpha_coins/option/missionNotepad" class="mb10 button text-center"><span class="glyphicon glyphicon-pencil"></span></a>
            {else}
            <a href="#notepad" aria-controls="notepad" role="tab" data-toggle="tab">
            <button class="mb10"><span class="glyphicon glyphicon-pencil"></span></button>
            </a>
            {/if}
          </div>
          {if $qtask.canPause}
          <div class="col-xs-4">
            <form method="post"  class="mb10">
              <button type="submit" name="pause" value="true" title="Pause mission"><span class="glyphicon glyphicon-pause"></span></button>
            </form>
          </div>
          {/if}
		  <div class="col-xs-4">
		  	<button onclick="add_input('base64 encode ');" class="mb10">B64_E</button>
		  </div>
		  <div class="col-xs-4">
		  	<button onclick="add_input('base64 decode ');" class="mb10">B64_D</button>
		  </div>
		  
          {if $user.questManager}
          <div class="col-xs-12">
            <a href="#questManager" aria-controls="questManager" role="tab" data-toggle="tab">
            <button class="mb10"><span class="glyphicon glyphicon-wrench"></span></button>
            </a>
          </div>
          {/if}
          {/if}
        </div>
      </div>
      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane  fade" id="soundtracks">
          <iframe  class="youtubeIntro alphaGlow mb10" src="http://www.youtube.com/embed/g0tKuL_9Me8?playlist=g0tKuL_9Me8&origin=http://secretrepublic.net&controls=1&loop=1&autohide=2&modestbranding=1&showinfo=0" frameborder="0" style="width:100%;border:1px solid rgba(70, 120, 185, 0.4);margin-left:0px;height:150px"></iframe>
          <iframe  class="youtubeIntro alphaGlow mb10" src="http://www.youtube.com/embed/JE1-Mew1N-E?playlist=JE1-Mew1N-E&origin=http://secretrepublic.net&controls=1&loop=1&autohide=2&modestbranding=1&showinfo=0" frameborder="0" style="width:100%;border:1px solid rgba(70, 120, 185, 0.4);margin-left:0px;height:150px"></iframe>
        </div>
        {if $logged}
        {if $notepadAllowed}
        <div role="tabpanel" class="tab-pane  fade" id="notepad">
          <form method="post" id="notepad">
            <textarea  placeholder="Mission notepad" maxlength="1000" id="notepad-area">{$notepad}</textarea>
            <input type="submit" value="update" style="border-top:0;"  class="mb10"/>
          </form>
        </div>
        {/if}
        {if $user.questManager}
        <div role="tabpanel" class="tab-pane  fade" id="questManager">
          <h3 class="text-right">Quest debug</h3>
          <div class="futuristicPanel text-right">
            {foreach from=$quest.hosts key=k item = host} 
            {$k} - T: {$host.trace} | {$host.services|count} services <br/>
            {foreach from = $host.services key = port item = service}
            {$port} | {$service.type} | E: {$service.encryption} <br/>
            {/foreach}
            {/foreach}
          </div>
          <div class="futuristicPanel text-right">
            {$quest.objective|print_r}
          </div>
          <div class="futuristicPanel text-right">
            {$quest.hosts[$quest.connected.ip]|print_r}
          </div>
          <div class="alert alert-error">
            cardinal finish - completes current objective
          </div>
		  {foreach from=$quest.hosts key=k item = host} 
		  	<div class="well text-right">
				<strong>{$k}</strong><br/>
				{$host|print_r}
			</div>
		  {/foreach}
        </div>
        {/if}
        {/if}
      </div>
    </div>
    {if $logged && !$smarty.session.premium.removeAds}
    <a href="{$config.url}alpha_coins" class="button text-center mb10"><strong>GET A-COINS</strong></a>
    {/if}
  </div>
</div>
{/if}