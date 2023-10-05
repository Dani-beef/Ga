
  <div class="row">
        <div class="col-md-3">
        <div class="text-center">
          <a href="{$config.url}organization/show/{$org.id}/">
            <img src="{$config.url}layout/img/characters/Irene-A.I.png" style=" max-width:240px" title="Welcome to {$org.name}"/>
          </a>
            </div>

        </div>
        <div class="col-md-9">
          <div class="text-center">
            <h1><a href="{$config.url}organization/show/{$org.id}/">{$org.name}</a></h1>
			<h4>alias [{$org.tag}]{if $org.id eq $user.organization}, ran by {$org.ownern|profile_link}{/if}</h3>
            <p>
              {if $org.orank > 0}
                Ranked #{$org.orank} in the world with {$org.points|number_format} points{else}not ranked{/if} - {$org.nrm}/{$org.max_nrm|number_format} members - {$org.wars_won|number_format} wars won out of {$org.wars} fought</p>
            {if $org.myOrg}
              <p>{$org.name} has <strong><a href="{$config.url}organization/show/{$org.id}/view/hackingPoints">{$org.hacking_points|number_format} hacking points</a></strong></p>
              <p>Your rank is {$access.name}</p>
            {/if}
          </div><br/>




            <div class="futureNav middle">
              <ul>
              {if $access}
                 <li><a href="{$config.url}organization/show/{$org.id}/view/forum" title="Our private Forum"><span class="glyphicon glyphicon-comment"></span></a></li>

                   <li>
                    <a href="{$config.url}organization/show/{$org.id}/view/wars">
                      {if $org.wars_inprogress}<strong>WAR IN TOW</strong>{else}<span class="glyphicon glyphicon-fire"></span>{/if}
                    </a>
                  </li>

                 {if $access.viewMembers}
                  <li><a href="{$config.url}organization/show/{$org.id}/view/members/"><span class="glyphicon glyphicon-user"></span></a></li>
                {/if}
                {if $access.manageApplications and $org.applications}
                  <li><a href="{$config.url}organization/show/{$org.id}/view/applications">App's ({$org.applications})</a></li>
                {/if}


                {if $access.manageOrganization}
                  <li><a href="{$config.url}organization/show/{$org.id}/view/core"><span class="glyphicon glyphicon-cog"></span></a></li>
                {/if}
                {if !$access.owner}
                  <li><a href="{$config.url}organization/show/{$org.id}/view/leave">Leave</a>	</li>
                {/if}
              {else}
              <!--
                  <li><a href="{$config.url}organization/show/{$org.id}/">Main</a></li>
                   -->
                    {if !$user.organization && $logged && $org.allow_app}

                        <li><a href="{$config.url}organization/show/{$org.id}/apply/now">Apply</a></li>
                    {elseif !$logged}
                      <li><a href="{$config.url}organization/show/{$org.id}/">Connect</a></li>
                    {/if}

                    <li><a href="{$config.url}organization/show/{$org.id}/view/wars">Wars</a></li>

                {/if}
              </ul>

            </div>
            {include file="error_success.tpl"}
            <div class="alert alert-info text-center">
              <strong>
              <a href="http://secretrepublic.net/forum/tid/717"> 100 Alpha Coins prize for the BEST organization Public Intro</a>
            </strong>
            </div>
            {if !$access && !$org.allow_app}

              <div class="alert alert-danger">
                  {$org.name} does not accept new members right now.
              </div>

            {/if}


           {if !$load}
           {include file="organization/organization_main.tpl"}
           {elseif $load eq "forum"}
           {include file="organization/organization_forum.tpl"}
           {elseif $load eq "forum_post"}
           {include file="organization/organization_forum_post.tpl"}
           {elseif $load eq "show_thread"}
           {include file="organization/organization_forum_show_thread.tpl"}
           {elseif $load eq "members"}
           {include file="organization/organization_members.tpl"}
           {elseif $load eq "manageMembers"}
           {include file="organization/organization_edit_members.tpl"}
           {elseif $load eq "kick_member"}
           {include file="organization/organization_kick_member.tpl"}
           {elseif $load eq "manageRanks"}
           {include file="organization/organization_edit_ranks.tpl"}
           {elseif $load eq "edit_org"}
           {include file="organization/organization_edit_org.tpl"}
           {elseif $load eq "disband"}
           {include file="organization/organization_disband.tpl"}
           {elseif $load eq "change_owner"}
           {include file="organization/organization_change_owner.tpl"}
           {elseif $load eq "applications"}
           {include file="organization/organization_manage_applications.tpl"}
           {elseif $load eq "apply"}
           {include file="organization/organization_apply.tpl"}
           {elseif $load eq "hackingPoints"}
           {include file="organization/organization_hackingPoints.tpl"}
           {elseif $load eq "quit"}
           {include file="organization/organization_quit.tpl"}

            {elseif $load eq "wars"}

              {include file="organization/wars/organization_wars.tpl"}

           {elseif $load eq "messageAll"}

           {include file="organization/organization_mesall.tpl"}
        
           {/if}
      </div>
    </div>
