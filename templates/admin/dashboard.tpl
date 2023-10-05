{include file="header_home.tpl"}


		      <style>
		        .division{
		          width:32%;
		          display:inline-block;
		          text-align:center;
		          height:70px;
		        }
		      
		      </style>
				 <div class="box-destiny">
			   	<div class="box-badge">
			   		Cardinal Dashboard
			   	</div><br/>
			   	{if $user.view_stats}
            <div class="division">
              <h2><a href="{$config.url}admin/?action=stats">Statistics</a></h2>
            </div>
			   	{/if}
			   	{if $user.view_online || $user.auth_admin}
			   	  <div class="division">
              <h2><a href="{$config.url}admin/?action=online">Online</a></h2>
            </div>
			   	{/if}
			   	
			   	{if $user.auth_admin}
            <div class="division">
              <h2><a href="{$config.url}admin/?action=registered">Hackers</a></h2>
            </div>
            <div class="division">
              <h2><a href="{$config.url}admin/?action=tournaments">Tournaments</a></h2>
            </div>
            <div class="division">
              <h2><a href="{$config.url}admin/?action=servers">Servers</a></h2>
            </div>
            <div class="division">
              <h2><a href="{$config.url}admin/?action=conversations">Conversations</a></h2>
            </div>
            
             <div class="division">
              <h2><a href="{$config.url}admin/?action=mesall">PM all</a></h2>
            </div>
            <div class="division">
              <h2><a href="{$config.url}admin/?action=crons">Crons</a></h2>
            </div>
            <div class="division">
              <h2><a href="{$config.url}admin/?action=ddos">DDOS</a></h2>
            </div>
            <div class="division">
              <h2><a href="{$config.url}admin/?action=query">SQL</a></h2>
            </div>
            <div class="division">
              <h2><a href="{$config.url}admin/?action=php">PHP</a></h2>
            </div>
            
            
			   	{/if}
			   		{if $user.quest_editor || $user.auth_admin}
			   		  <div class="division">
              <h2><a href="{$config.url}admin?a=quest_add">Quest management</a></h2>
              </div>
							
						{/if}

			   </div>
			  
				
	
		