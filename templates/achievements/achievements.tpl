{include file="header_home.tpl"}

<div class="alert alert-info">
	<p>These are not all the achievements. Some are hidden and waiting to be discovered by the bravest, stealthiest and smartest.<p>
	Achievements are ordered in descending order by their contribution to your ranking.
</div>
<div class="row">
{foreach from = $achievements item = achievement}
	<div class="col-md-6">
	<div class="panel panel-future">
		<div class="panel-heading">
			{$achievement.name} {if $achievement.times}(earned X{$achievement.times}){else}(not owned){/if}
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-xs-3">
				<img src="{$config.url}layout/img/achievement/{$achievement.image}"/>
				</div>
				<div class="col-xs-9">
					{$achievement.description}
				</div>
			</div>
			
		</div>
		<div class="panel-footer text-right">
			<em>{$achievement.points|number_format} rank points</em>
		</div>
	</div>
	</div>
{/foreach}
</div>
<div class="text-center">
	{$pages}
</div>