		{include file="organization/members_header.tpl"}
		  {if $org.nrm eq $org.max_nrm}
		  <div class="alert alert-warning">
		    {$org.name} has reached current maximum permitted number of members.
		  </div>
		  {/if}
		  <br/>
			{foreach from=$members item=member key=k}
			  <div class="row">
			    <div class="col-md-12">
			      <div class="row-fluid">
				  	<div class="col-md-1 text-center">
						<a href="{$config.url}profile/hacker/{$member.username|strtolower}">
						<img src="http://www.gravatar.com/avatar/{$member.gavatar}?s=50" style="border-radius:50%;"/>
						</a>
					</div>
			        <div class="col-md-7 ">
			          <a class="button" class="cut-text" href="{$config.url}profile/hacker/{$member.username|strtolower}">
					 
					  {$member.username|strtoupper} ({$member.level}) <small>{$member.lastActive|date_fashion}</small>
					  
					  </a>
			        </div>
			       
			       
			       
			        <div class="col-md-4 ">
			          <button disabled class="cut-text disabled">{$member.name}</button>
			        </div>
			      </div>
			    </div>
			  </div><br/>
			{/foreach}

      <div class="text-center">
      {$pages}
      </div>