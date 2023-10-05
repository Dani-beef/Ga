  <div class="row-fluid mb10" style="overflow:auto">

{foreach from=$tasks item=t}
  <div class="col-xs-6 mb10">
    <div class="panel panel-glass {if $tredirect[$t.type]}cursor{/if} "{if $tredirect[$t.type]}  onclick="document.location='{$config.url}{$tredirect[$t.type]}'"{/if}>
      <div class="panel-body text-center">
        <small>
           {if $t.remainingSeconds gt 0}
  
            {include file="components/hackdown.tpl" countdownFrom=$t.remainingSeconds totalCountdown=$t.totalSeconds
                                                    id=($t.id+$user["id"]) textCountdown = "true" 
                                                    progressBarCountdown = "true" reloadOnFinish = false 
                                                    textFinish = "Task finished"
                                                    progressBarClass = "progress-small" textNormal = "true"}
 
            {else}
              Task finished
            {/if}
           </small>
        </div>
		      <div class="panel-footer cut-text">{if !$t.name}{$t.ttype}{else}{$t.name}{/if}</div>

      </div>
    </div>
  
  {/foreach}
</div>
