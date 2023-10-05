{include file="header_home.tpl"}
<h1>wars inprogress</h1>
{foreach from = $inprogress item = war}
<div class="row mb10">
	<div class="col-md-7">
		<a href="{$config.url}organization_wars/war/{$war.war_id}">
		<button>
				{$war.org1_name} 
			
			({$war.org1_points|number_format}) vs 
			
			
				{$war.org2_name} 
			
			
			({$war.org2_points|number_format})
		</button>
		</a>
	</div>
	<div class="col-md-5">
		<div class="well black text-right">
			{if $war.start <= time()}
				war started 
			{else}war will start{/if} 
			{$war.start|date_Fashion}
		</div>
	</div>
	
</div>
{foreachelse}
<div class="alert alert-info">
	No wars in progress. Organizations are at peace. Boring!
</div>
{/foreach}
<br/>
<h1>war history</h1>
<h3>ended wars</h3>
<hr/>
{foreach from = $wars item = war}
<div class="row">
	<div class="col-md-7">
		<div class="well">
			<a href="{$config.url}organizations/view/{$war.org1_id}">
				{$war.org1_name} 
			</a>
			({$war.org1_points|number_format}) vs 
			
			<a href="{$config.url}organizations/view/{$war.org2_id}">
				{$war.org2_name} 
			</a>
			
			({$war.org2_points|number_format})
		</div>
	</div>
	<div class="col-md-5">
		<div class="well black text-right">
			finished {$war.finished|date_Fashion}
		</div>
	</div>
	
</div>

{/foreach}

<div class="text-center">
{$pages}
</div>