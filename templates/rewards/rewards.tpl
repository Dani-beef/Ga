{include file="header_home.tpl" }
{include file="profile/profile_header.tpl"}


<div class="row mb10">
	<div class="col-xs-8">
		<div class="well black">
			You receive rewards as you complete different tasks, participate events or earn <a href="{$config.url}achievements">achievements</a>.
		</div>
	</div>
	<div class="col-xs-4">
		<form method="post">
			<button type="submit" name="claim" value="true" {if !$user.rewardsToReceive}disabled{/if}>CLAIM ALL</button>
		</form>
	</div>
</div>

{include file="error_success.tpl"}


{foreach from = $rewards item = reward}
  {assign var=randVar value=rand(1,3)}
  <div class="row ">
        <div class="col-md-{3 + $randVar} cut-text col-sm-{4 + $randVar}">
          <a href="{$config.url}rewards/myReward/{$reward.reward_id}" class="button">{$reward.title}</a>
        </div>
        <div class="col-md-{6 - $randVar} hidden-xs hidden-sm">
          <div class="black well text-center">
            {$reward.created|date_fashion}
          </div>
        </div>
		<div class="col-md-3 col-sm-{12 - 4 - $randVar}">
		{if !$reward.received}
			<a href="{$config.url}rewards/myReward/{$reward.reward_id}" class="button text-center">CLAIM</a>
		{else}
          <div class="black well text-right">
            {if $reward.received}{$reward.received|date_fashion}
			{else}not claimed{/if}
          </div>
		  {/if}
        
    </div>
  </div>
{foreachelse}
<div class="well text-center">
  You have not received any rewards, yet, {$user.username}.
</div>
{/foreach}

<div class="text-center">
  {$pages}
</div>
