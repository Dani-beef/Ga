{include file="header_home.tpl" }

<div class="row mb10">
	<div class="col-xs-4">
		<a href="{$config.url}hackdown/rankings/gimme"><button>Hackers</button></a>
	</div>
	<div class="col-xs-4">
		<a href="{$config.url}hackdown/rankings/gimme/organizations/go"><button>Organizations</button></a>

	</div>
	<div class="col-xs-4">
		<a href="{$config.url}hackdown/rankings/gimme/zones/go"><button>Zones</button></a>

	</div>
</div>


<div class="well text-center">
	These rankings are for the Hackdown of {$lastDate}. They are computed moments after the end of a Hackdown, as rewards are delivered.
</div>
{if $users}

	{foreach $users as $user}
		<div class="row mb10">
			<div class="col-md-8">
				<a href="{$config.url}profile/hacker/{$user.username}">
					<button>{$user.username}</button>
				</a>
			</div>
			<div class="col-md-4">
				<button disabled>
					{$user.points|number_format} points
				</button>
			</div>
		</div>
	
	{foreachelse}
		<div class="alert alert-info">
			Nothing to display
		</div>
	{/foreach}
{elseif $organizations}
	{foreach $organizations as $org}
	
		<div class="row mb10">
			<div class="col-md-8">
				<a href="{$config.url}organization/show/{$org.org_id}">
					<button>{$org.name}</button>
				</a>
			</div>
			<div class="col-md-4">
				<button disabled>
					{$org.points|number_format} points
				</button>
			</div>
		</div>
	{foreachelse}
		<div class="alert alert-info">
			Nothing to display
		</div>
	{/foreach}

{elseif $zones}

	{foreach $zones as $zone}
		<div class="row mb10">
			<div class="col-md-4 ">
					<button disabled>Zone {$zone.zone}</button>
			</div>
			<div class="col-md-8 ">
					<button disabled>{$zone.points|number_format} points</button>
			</div>
		</div>
	
	{foreachelse}
		<div class="alert alert-info">
			Nothing to display
		</div>
	{/foreach}
{/if}


<div class="text-center">
	{$pages}
</div>