<div class="row mb10" id="p{$p.id}">
 
      <div class="col-md-3 ">
	  	<div class="panel panel-future">
			<div class="panel-heading">	
				{$p.user|profile_link}
			</div>
			<div class="panel-body text-center">
      
          			
					<img src="http://www.gravatar.com/avatar/{$p.gavatar}?s=100" class="user-avatar" />
					
					{if $p.name}<br/><br/>
						
						<p>
						Member of <a href="{$config.url}organization/show/{$p.organization}">{$p.name}</a>
						</p>
					{/if}
			</div>
							
        </div>
      </div>
      <div class="col-md-9 nopadding">
        
	   <div class="panel panel-future" style="background-color:rgba(0, 168, 255, 0.08)">
	   	<div class="panel-body">
          <article>
            {$p.content}
          </article>
        
		  </div>
		  <div class="panel-footer">
             posted {$p.created|date_fashion} 
             {if $forumAccess.forumManager || $user.id eq $p.userid}
               <a href="{$furl}edit/{$p.id}"><span class="glyphicon glyphicon-pencil"></span></a>
             {/if}
             {if $forumAccess.forumManager || $forumAccess.canDeleteOwnThreads }
               <form method="post" name="delete_{$p.id}" id="delete_{$p.id}" onsubmit="return confirm('Are you sure?');" style="display:inline-block">
              <input type="hidden" name="del" value="{$p.id}"/>
              <a onclick="$('#delete_{$p.id}').submit();"><span class="glyphicon glyphicon-remove-sign"></span></a>
              </form>
             {/if}
			 </div>
        </div> 
        
              
      </div>
  
</div>
