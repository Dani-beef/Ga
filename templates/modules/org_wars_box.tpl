				

			 {foreach from=$organizationWars item=war}
		
				<div class="futuristicPanel cursor" onclick="document.location='{$config.url}wars/?war={$war.id}&organization=true'">
          
          <div class="row-fluid">
            <div class="col-md-7">
               w/ 
             {if $user.organization eq $war.org1}
               {$war.org2name}
             {else}
                {$war.org1name}
             {/if}
            </div>
            <div class="col-md-5 text-right">
              {if $war.status eq 1}
                waiting to begin
              {elseif $war.status eq 2}
                fighting
              {/if}
            </div>
          </div>
					
					
					
        </div>	
			{foreachelse}
			<div class="futuristicPanel text-center">
				No organization wars in progress, peaceful aren't we? 
			</div>
			 {/foreach}
