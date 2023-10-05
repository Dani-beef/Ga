{include file="header_home.tpl" no_sidebar=true}

<div class="futureNav middle"> 
              <ul> 
 				{if $user.manageUsers}
					<li>  <a href="{$config.url}admin/view/tasks">Tasks</a></li>
				   {/if}
				   {if $user.cardinal}
				   	<li> <a href="{$config.url}admin/view/servers">Servers</a></li>
					

					<li>  <a href="{$config.url}admin/view/conversations">Convs</a></li>
					<li>  <a href="{$config.url}admin/view/groups">Groups</a></li>
					{/if}
					
					</ul>
					</div>
<div class="text-center">
					  {$pages}
					</div>
	    
		    {foreach from=$players item=player}
		    <div class="row">
		      <div class="col-md-12">
		        <div class="row-fluid">
		          
		          <div class="col-md-1 nopadding">
		            {if $player.online}
                  <a  class="button text-center">ON</a>
                {else}
                  <div class="well black text-center">
                    OFF
                  </div>
                {/if}
              </div>
		          <div class="col-md-10 nopadding">
                <div class="well">
                  <div class="row">
              
                    <div class="col-md-6">
                     
                      [{$player.id}]{$player.username|profile_link} [{$player.level|number_format}] [Z{$player.zone}] [{$player.login_count|number_format}L]
                      
                       <small>{$player.lastActive|date_fashion}</small>
                    </div>
                    <div class="col-md-2 cut-text">
                      {$player.name}
                    </div>
                    <div class="col-md-2">
                      <a href="{$config.url}admin/view/tasks/hacker/{$player.id}">{$player.tasks} tasks</a>
                    </div>
                
                   
                    <div class="col-md-2 cut-text">
                      {$player.money|number_format}$
                    </div>
                 
      
                    
                  </div>
                </div>
              </div>
              {if $user.manageUsers}
                <div class="col-md-1 nopadding">
                  <a href="{$config.url}admin/view/hacker/hid/{$player.id}" class="button text-center"><span class="glyphicon glyphicon-cog"></span></a>
                </div>
              {/if}
              
            </div>
          </div>
        </div>
		    {/foreach}

		    <div class="text-center">
					  {$pages}
					</div>
					
			
	
		