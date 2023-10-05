<div class="futureNav middle ">
       <ul>
          <li><a href="{$config.url}alpha_coins"><strong>A-Coins</strong></a></li>
          <li><a href="{$config.url}rewards"{if $user.rewardsToReceive} id="rewards"{/if}><span class="glyphicon glyphicon-gift"></span>{if $user.rewardsToReceive} ({$user.rewardsToReceive|number_Format}){/if}</a></li>
          
          
		  <li><a href="{$config.url}blogs/myown/go">Blogs</a></li>
          <li><a href="{$config.url}friends" >{if $user.friend_requests}<span id="friendreq">{$user.friend_requests} requests</span>{else}Friends{/if}</a></li>
      
	
        </ul>
        
      </div>