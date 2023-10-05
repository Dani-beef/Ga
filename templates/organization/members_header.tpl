      <div class="futureNav middle ">
       <ul>
          <li><a href="{$config.url}organization/show/{$org.id}/view/members"><span class="glyphicon glyphicon-user"></span></a></li>
          {if $access.messageAll}
					<li><a href="{$config.url}organization/show/{$org.id}/view/messageAll">EMAIL ALL</a></li>	
				{/if}
				{if $access.manageMembers}
					<li><a href="{$config.url}organization/show/{$org.id}/view/manageMembers"><span class="glyphicon glyphicon-wrench"></span></a>	</li>	
				{/if}
				{if $access.manageMembers}
					<li class="ending"><a href="{$config.url}organization/show/{$org.id}/view/manageRanks">RANKS</a>	</li>		
				{/if}
        </ul>
      </div>
   