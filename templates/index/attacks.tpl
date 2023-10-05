{foreach from = $attacks item = attack}

<div class="mb10 alert {if $attack.type eq 1}    alert-info
                  {elseif $attack.type eq 2}alert-error
                  {elseif $attack.type eq 3}alert-warning
                  {elseif $attack.type eq 4}alert-success{/if}">
        <div class="row">
    

      <div class="col-xs-9 ">

 	{if $attack.type eq 1}

            <span class="glyphicon glyphicon-eye-open"></span> Spying on <em>{$attack.receiver}</em>
       
    {elseif $attack.type eq 2}
    
      

				  {if $attack.sender_user_id eq $user.id}
				   <span class="glyphicon glyphicon-screenshot"></span> Attacking <em>{$attack.receiver}</em>
           <br/>
           <small>your involved nodes: {$attack.sender}</small>
           {else}

           <span class="glyphicon glyphicon-screenshot"></span> Your node <em>{$attack.receiver}</em> is under attack
           <br/>
           <small>attack involved nodes: {$attack.sender}</small>

           {/if}
			   
	{elseif $attack.type eq 3}
 
            <span class="glyphicon glyphicon-trash"></span> Scavenging on <em>{$attack.receiver}</em>

    {elseif $attack.type eq 4}
 
            <span class="glyphicon glyphicon-certificate"></span> Attempting to instantiate <em>{$attack.receiver}</em>
     
	   {/if}
  </div>
       <div class="col-xs-3 text-right">
         <strong>
          {include file="components/hackdown.tpl" countdownFrom=$attack.remainingSeconds totalCountdown=$attack.totalSeconds
                                                    id=($attack.attack_id+$user["id"]) textCountdown = "true" 
                                                    progressBarCountdown = false reloadOnFinish = false 
                                                   textFinish = "computing" textNormal = "true"}
          </strong>
        </div>
        </div>
       </div>
  
{/foreach}
