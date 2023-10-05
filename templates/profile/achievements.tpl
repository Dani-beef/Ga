 			<div class="row">
              <div class="col-md-12">
                {foreach from=$achievements item=achievement} 
                  <div class="col-md-4 pull-right" >
                	<div class="panel {if !$panelClass}panel-glass{else}{$panelClass}{/if}">
						<div class="panel-heading cut-text text-center" title="{$achievement.name}">
							<small>{if $achievement.times gt 1}
						
                    		{$achievement.times} x
						
						{/if}{$achievement.name}</small>
						</div>
						<div class="panel-body text-center " title="{$achievement.description}"><Br/>
                    		<img src="{$config.url}layout/img/achievement/{$achievement.image}" class="imageOpacity"/><br/><br/>
						</div>
						
					</div>
                  </div>
                
                {/foreach}
              </div>
            </div>