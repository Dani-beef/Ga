{include file="header_home.tpl" } 

{if $logged}
{include file="profile/profile_header.tpl"}
{/if}

{include file="error_success.tpl"}


<div class="profile-container">

  <div class="row">

    <div class="text-right col-xs-6" >

      <h1 style="font-size:50px;">{if $quser.id eq $user.id}<a style="font-size:14px" href="{$config.url}dna/#changeUsername">change</a>{/if}{$quser.username}</h1>
      <p>
        level {$quser.level}
      </p>
      <p>
        {$quser.name}
      </p>



      <p>
        {if $quser.organization}
          Member of <a href="{$config.url}organization/show/{$quser.organization}">{$quser.oname}</a> (#{$quser.orank})
        {else}
        Not part of any organization
        {/if}
      </p>

      <p>
        {if $quser.rank > 0}
         {$quser.points|number_format} points (W#{$quser.rank}/Z#{$quser.zrank})
         {else}
         no rank
         {/if}

      </p>
      {if $user.id eq $quser.id}
      <p>




        <a href="{$config.url}dna" style="font-size:20px"><span class="glyphicon glyphicon-cog" title="DNA Management"></span></a>


      </p>
      {/if}

      
    </div>
    <div class="col-xs-6 text-left"><br/>
      {if $user.id eq $quser.id}<a href="{$config.url}dna">{/if}
      <img src="http://www.gravatar.com/avatar/{$quser.gavatar}?s=180" class="user-avatar"/>
      {if $user.id eq $quser.id}</a>{/if}
    </div>


  </div>

  <div class="text-center">
{if $user.manageUsers} 
        <a href="{$config.url}admin/view/hacker/hid/{$quser.id}" title="Manage DNA" ><span class="glyphicon glyphicon-cog"></span></a>
        <a href="{$config.url}admin/view/hacker/hid/{$quser.id}/load/bans" ><span class="glyphicon glyphicon-ban-circle"></span></a>
  {/if}
{if $user.manageDuality && $user.id != $quser.id} 

        <a href="{$config.url}admin/view/hacker/hid/{$quser.id}/duality/initiate" title="INITIATE DUALITY"><span class="glyphicon glyphicon-asterisk"></span></a>

  {/if}
</div>

  <br/>
  
  {if $quser.banned}
  <div class="alert alert-danger">
    Cardinal System Notice: Citizen is under arrest by the Grid Police Force. Account blocked.
  </div>
  {else}
  

  <div class="row">
    <div class="col-md-12">
      <div class="row-fluid">

        <!-- STATS -->
        <div class="col-md-6 ">





          <form method="post" name="rep">

            <div class="row mb10">
              <div class="col-xs-6 ">
                <div class="well black  ">
                  Reputation
                </div>
              </div>

              <div class="col-xs-4  ">
                <div class="button text-center ">
                  {$quser.rep|number_format}
                </div>
              </div>
              <div class="col-xs-2 ">

                {if $logged}
                {if $user.id ne $quser.id}
                <input type="submit" name="reputation" value="+"/>
                {else}
                <button type="button" disabled class="disabled"></button>
                {/if}
                {else}
                <button type="button" disabled class="disabled"></button>
                {/if}
              </div>
            </div>

          </form>


          <div class="row mb10">

            <div class="col-xs-3 ">
              <div class="well black  text-center">
                <span class="glyphicon glyphicon-th"></span>
              </div>
            </div>
            <div class="col-xs-9 ">
              <a href="{$config.url}zones/zone/{$quser.zone}" class="button text-center">
                ZONE {$quser.zone}
              </a>
            </div>

          </div>




          


          <h3>blogs</h3>
          {foreach from=$blogs item=blog}
          <div class="row mb10">
            <div class="col-xs-8 ">
              <a href="{$config.url}blogs/blog/{$blog.blog_id}" class="button cut-text">
                {$blog.name}
              </a>
            </div>
            

            <div class="col-xs-4  ">
              <div class="well black   text-center">
                {$blog.nrs} subscribers
              </div>
            </div>
          </div>

          {foreachelse}
          {if $quser.id ne $user.id}
          <div class="well black text-center">
            {$quser.username} has no blogs
          </div>
          {else}
          <a href="{$config.url}blogs/create/now" class="button text-center">Create a blog now</a>
          {/if}
          {/foreach}

          <h3 id ="forumPosts">public forum threads</h3>
          {foreach from=$forumThreads item = thread}

          <a href="{$config.url}forum/tid/{$thread.id}" >
            <button class="cut-text text-left mb10">
              {$thread.title}	<small>{$thread.replies|number_format} replies</small>
            </button>
          </a>




          {foreachelse}
          {if $quser.id ne $user.id}
          <div class="well black text-center">
            {$quser.username} has made no public threads
          </div>
          {else}
          <a href="{$config.url}forum" class="button text-center">No threads. Go to forums!</a>
          {/if}
          {/foreach}  
        </div>

        

        <div class="col-md-6 ">

          {if $logged && $quser.id ne $user.id}
          {if $quser.organization eq $user.organization}
          <div class="alert alert-warning">
            You are in the same organization as <em>{$quser.username}</em>.
          </div>
          {/if}




          <div class="row mb10">
            <div class="col-xs-3">
              <a href="{$config.url}conversations/new/emilia/to/{$quser.username}" class="mb10 text-center button"><span class="glyphicon glyphicon-envelope"></span></a>
            </div>
            <div class="col-xs-9">
              <form method="post">
                {if $areFriends}
                <button disabled class="disabled">FRIENDS</button>
                {elseif !$waitingRequest}

                <input type="submit" name="sendFriendRequest" value="Send friendship request"/>

                {elseif $waitingRequest eq $user.id}
                <a href="{$config.url}friends/requests/magic" class="button text-center">Answer {$quser.username}'s friend request</a>
                {else}

                <input type="submit" name="cancelFriendRequest" value="Cancel friendship request"/>

                {/if}
              </form>
            </div>
          </div>
          {/if}


          <h3 class="text-right">achievements</h3>
          <div class="text-right"><small><strong><a href="{$config.url}achievements">view list of publicly available achievements </a></strong></small></div>
          <br/>
          {if !count($achievements)}
          <div class="well text-center">
            No achievements :(, yet! {if $user.id eq $quser.id} How lazy can you be?{/if}
          </div>
          {else}
          {include file='profile/achievements.tpl'}
          {/if}
          <br/><br/>
          {if $quser.youtube}


          <iframe  class="youtubeIntro alphaGlow mb10 imageOpacity" src="http://www.youtube.com/embed/{$quser.youtube}?origin=http://secretrepublic.net&autohide=1&modestbranding=1&showinfo=0" frameborder="0" style="width:100%;height:300px;"></iframe>

          {elseif $quser.id eq $user.id}
          <a href="{$config.url}dna#youtube">
            <button><span class="glyphicon glyphicon-star-empty"></span></button>
          </a>
          {/if}

        </div>
      </div>
    </div>
  </div>
  {/if}

</div>
