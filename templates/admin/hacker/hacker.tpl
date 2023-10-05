{include file="header_home.tpl"}
<div class="text-center">
  <h1>{$hacker.username|strtoupper|profile_link}</h1>
  
  {if $user.manageDuality && $hacker.id != $user.id}
         	<a href="{$config.url}admin/view/hacker/hid/{$hacker.id}/duality/initiate" title="INITIATE DUALITY"><span class="glyphicon glyphicon-asterisk"></span></a>
        {/if}
</div>
  <br/>
  {if $credentials.banned}
    <div class="alert alert-error text-center">
      Account is banned
    </div>
  {/if}
  <div class="futureNav middle ">
       <ul>
    
         <li><a href="{$config.url}alpha_coins/history/show/hacker/{$hacker.id}">AlphaCoins</a></li>
        {if $user.cardinal}
          <li><a href="{$config.url}admin/view/hacker/hid/{$hacker.id}/load/credentials">Creds</a></li>
        {/if}
        
    </ul>
  </div>
  <div class="futureNav middle ">
       <ul>
    
        <li><a href="{$config.url}admin/view/hacker/hid/{$hacker.id}"><span class="glyphicon glyphicon-cog"></span></a></li>
       
        <li><a href="{$config.url}admin/view/hacker/hid/{$hacker.id}/load/attacks">Attacks</a></li>
        <li><a href="{$config.url}admin/view/hacker/hid/{$hacker.id}/load/skills">Skills</a></li>
        <li><a href="{$config.url}admin/view/servers/hacker/{$hacker.id}" target="_blank">Servers</a></li>
        <li><a href="{$config.url}admin/view/hacker/hid/{$hacker.id}/load/bans"><span class="glyphicon glyphicon-ban-circle"></span></a></li>
        <li><a href="{$config.url}admin/view/tasks/hacker/{$hacker.id}">Tasks</a></li>
        <li><a href="{$config.url}admin/view/hacker/hid/{$hacker.id}/load/achievements">Achiev's</a></li>
        <li><a href="{$config.url}admin/view/hacker/hid/{$hacker.id}/load/missions">Missions</a></li>
    
        
    </ul>
				{include file="error_success.tpl"}
				<style>
				  .holder{
				    display: inline-block;
				    width:45%;
				  }
				</style>
				{if !$load}
					<form method="post">
              <div class="row mb10">
                <div class="col-md-12">
                  <div class="row-fluid">
                    {foreach from=$hacker key=column item=value}
                      <div class="col-md-2 col-xs-6 mb10">
                        <button disabled class="disabled" type="button">{$column}</button>
                      </div>
                      <div class="col-md-2  col-xs-6 mb10">
                        <input type="text" name="{$column}" value="{$value}" {if $column eq "id"}disabled{/if}/>
                      </div>
                    {/foreach}
                  </div>
                </div>
              </div>
            
            <input type="submit" value="Update"/>
            </form>
		  {elseif $load eq "attacks"}
		  	 <div class="futureNav middle ">
			   <ul>

				<li><a href="{$config.url}admin/view/attacks/hacker/{$hacker.id}">In progress</a></li>
				<li><a href="{$config.url}admin/view/attacks/hacker/{$hacker.id}/logs/show">Logs</a></li>
				
			</ul>
          {elseif $load eq "skills"}
          <form method="post">
            <div class="row mb10">
                <div class="col-md-12">
                  <div class="row-fluid">
                      <div class="col-md-4 nopadding">
                        <select name="skill">
                          {foreach from=$theskills key = key item=skill}
                            <option value="{$key}">{$skill.name}</option>
                          {/foreach}
                        </select>
                      </div>
                      <div class="col-md-5 ">
                        <input type="text" name="exp" value="0" />
                      </div>
                      <div class="col-md-3 nopadding">
                        <input type="submit" value="Add skill experience"/>
                      </div>
                  </div>
                </div>
              </div>
            
            
          </form>
          {foreach from = $skills item = skill}
            <div class="row mb10">
                <div class="col-md-12">
                  <div class="row-fluid">
                      <div class="col-md-4 nopadding">
                        <div class="well">
                          {$theskills[$skill.skill].name} 
                        </div>
                      </div>
                      <div class="col-md-2 ">
                        <button disabled>LEV {$skill.level}</button>
                      </div>
                      <div class="col-md-3 ">
                        <button disabled>EXP {$skill.exp}/{$skill.expNext}</button>
                      </div>
                      <div class="col-md-3 nopadding">
                        
                      </div>
                  </div>
                </div>
              </div>
          {/foreach}
          {elseif $load eq "credentials"}
          <form method="post">
            <div class="row mb10">
              <div class="col-md-12">
                <div class="row-fluid">
                  {foreach from=$credentials key=column item=value}
                    {if $column ne "password" && $column ne "pin"}
                    <div class="col-md-2 mb10">
                      <button disabled class="disabled" type="button">{$column}</button>
                    </div>
                    <div class="col-md-2  mb10">
                      {if $column eq 'group_id'}
                        <select name="group_id">
                          {foreach from = $groups item = group}
                            <option value="{$group.group_id}" {if $group.group_id eq $value}selected{/if}>{$group.name}</option>
                          {/foreach}
                        </select>
                      {else}
                      <input type="text" name="{$column}" value="{$value}"/>
                      {/if}
                    </div>
                    {/if}
                  {/foreach}
                </div>
              </div>
            </div>
             <input type="submit" value="Update"/>
            </form>
          {elseif $load eq "missions"}
            {foreach from=$missions item=mission}
              <div class="row mb10">
                <div class="col-md-12">
                  <div class="row-fluid">
                
                    <div class="col-md-4 nopadding">
                      <div class="button cut-text">
                      {if $mission.title}{$mission.title}{else}Mission not found in database{/if}
                      </div>
                    </div>
                    <div class="col-md-1 ">
                      <div class="button cut-text text-center">
                        {if $mission.type eq 0}N{elseif $mission.type eq 1}D{else}R{/if}
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="well black text-center cut-text">
                        {if $mission.groupName}{$mission.groupName}{else}QGROUP ERROR{/if}
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="well black text-center">
                        {$mission.created}
                      </div>
                    </div>
                    <div class="col-md-1 nopadding">
                      <form method="post">
                        <input type="hidden" name="quest" value="{$mission.quest}"/>
                        <button type="submit" name="del" value="true" {if !$user.cardinal}disabled class="disabled"{/if}>X</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            {foreachelse}
              <div class="well text-center">
                No missions completed
              </div>
            {/foreach}
            <div class="text-center">
              {$pages}
            </div>
          {elseif $load eq "bans"}
            {include file="admin/hacker/ban.tpl"}
			
					{elseif $load eq "achievements"}
					  {include file="admin/hacker/achievements.tpl"}
					{/if}