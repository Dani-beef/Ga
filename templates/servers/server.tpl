{include file="header_home.tpl"}
{include file="servers/servers_header.tpl"}

<div class="row">
	<div class="col-sm-10">
		<h1 style="display:inline-block">{if $server->server.server_id eq $user.server}[MAIN] {/if}{$server->server.hostname}</h1> <div style="margin-left:10px;display:inline-block"><a href="{$config.url}servers/server/{$server->server['server_id']}/change/hostname" title="change hostname"><span class="glyphicon glyphicon-pencil"></span></a></div>
	</div>
	<div class="col-sm-2 text-right" title="About software, hardware and what happens when they're damaged">
		<a href="{$config.url}frequently-asked-questions/open/damaged-software-hardware">  
			<span class="fa fa-question-circle" style="font-size:25px;padding:20px"></span> </a>
	</div>

</div>





{include file="servers/server_stats.tpl"}


{include file="error_success.tpl"}	



 <div class = "row">
 	<div class="col-md-4">

		<div class="panel-group" id="components" role="tablist" aria-multiselectable="true">
			<button class="text-left" data-toggle="collapse" data-parent="#components" href="#cpu_collapse" >
			
			{$server->components.cpu.name} 
			{if $server->components.cpu.damage}
				<span class="badge alert-danger">{$server->components.cpu.damage}% dmg</span>{/if} 
			
			</button>

			<div id="cpu_collapse" class="panel-collapse collapse " role="tabpanel" >
				<div class="well black text-center button-stack">
					
					<button disabled>{$server->server['cpu_usage']} / {$server->components.cpu.cpu} in use</button>

					
					<button disabled>Power usage: {$server->components.cpu.power_usage}</button>
				</div>
			</div>
			<br/>
			<button class="text-left" data-toggle="collapse" data-parent="#components" href="#motherboard_collapse" >
				{$server->components.motherboard.name} 
				{if $server->components.motherboard.damage}
				<span class="badge alert-danger">{$server->components.motherboard.damage}% dmg</span>
				{/if} 
			</button>
			<div id="motherboard_collapse" class="panel-collapse collapse " role="tabpanel" >
				<div class="well black button-stack">
					<button disabled>{$server->server.used_ram_slots} / {$server->server.ram_slots} RAM slots</button>
				
					<button disabled>Power usage: {$server->components.motherboard.power_usage}</button>
				</div>
			</div>
			<br/>

			<button class="text-left" data-toggle="collapse" data-parent="#components" href="#case_collapse" >
				{$server->components.case.name} 
				{if $server->components.case.damage}
				<span class="badge alert-danger ">{$server->components.case.damage}% dmg</span>
				{/if}
			</button>
			<div id="case_collapse" class="panel-collapse collapse " role="tabpanel" >
				<div class="well black">
					<button disabled>{$server->server.used_hdd_slots} / {$server->server.hdd_slots} HDD slots</button>
				</div>
			</div>
			<br/>

			<button class="text-left" data-toggle="collapse" data-parent="#components" href="#power_collapse" >
				{$server->components.power_source.name}
				{if $server->components.power_source.damage}
				 <span class="badge alert-danger ">{$server->components.power_source.damage}% dmg</span>
				 {/if}
			</button>

			<div id="power_collapse" class="panel-collapse collapse " role="tabpanel" >
				<div class="well black">
					<button disabled>Power: {$server->server.power_usage}/{$server->components.power_source.power}</button>
				</div>
			</div>
			<br/>
			<form method="post">
			<button class="text-left" data-toggle="collapse" data-parent="#components" href="#ram_collapse" >RAMs <small>({$server->server.used_ram_slots}/{$server->server.ram_slots})</small></button>
			<div id="ram_collapse" class="panel-collapse collapse " role="tabpanel" >
				
				<div class="well black">
					{foreach from = $server->components.rams key = key item = ram}
						<button data-toggle="collapse" data-parent="#components" href="#rams_{$key}_collapse" >
							{if $ram.disabled}<span class="glyphicon glyphicon-ban-circle"></span> {/if}
							{$ram.name}
							{if $ram.damage}
							<span class="badge alert-danger">{$ram.damage}% dmg</span>
							{/if} 
						</button>
						<div id="rams_{$key}_collapse" class="panel-collapse collapse " role="tabpanel" style="padding:20px;padding-bottom:0">
							
							<button disabled>{$ram.ram} RAM</button><br/>
							<button name="unmount_ram" value="{$ram.relation_id}" title="Unmount card"><span class="glyphicon glyphicon-eject"></span></button>
						</div>
						<br/>
					{foreachelse}
						<button disabled>no RAM mounted</button><br/>
					{/foreach}
				</div>
			</div>
			<br/>
			<button class="text-left" data-toggle="collapse" data-parent="#components" href="#hdd_collapse" >HDDs <small>({$server->server.used_hdd_slots}/{$server->server.hdd_slots})</small></button>
			<div id="hdd_collapse" class="panel-collapse collapse " role="tabpanel" >
				<div class="well black">
					{foreach from = $server->components.hdds item = hdd key=key}
						<button data-toggle="collapse" data-parent="#components" href="#hdds_{$key}_collapse" >
							{if $hdd.disabled}<span class="glyphicon glyphicon-ban-circle"></span> {/if}
							{$hdd.name}
							{if $hdd.damage}
							<span class="badge alert-danger ">{$hdd.damage}% dmg</span>
							{/if}
						</button>
						<div id="hdds_{$key}_collapse" class="panel-collapse collapse " role="tabpanel" style="padding:20px;padding-bottom:0">
							{if $hdd.disabled}<div class="alert alert-error">Disabled due to MBoard damage</div>{/if}
							<button disabled>{$hdd.hdd} HDD</button><br/>
							<button name="unmount_hdd" value="{$hdd.relation_id}" title="Unmount card"><span class="glyphicon glyphicon-eject"></span></button>
						</div>
						<br/>
					{foreachelse}
					<button disabled>no HDDs mounted</button><br/>
					{/foreach}
				</div>
			</div>
			</form>
		</div>
	</div>
	
	<div class="col-md-8">


{if $user.cardinal and true == false}
		<div class="row" >
			<div class="col-md-4">
				<div class="panel panel-glass text-center">
					<div class="panel-heading">RAM [{$server->server.ram_usage|number_format}/{$server->server.total_ram|number_format}]</div>
					
					<div class="panel-body">
						<strong><small>{$server->server.ram_usage_percent}%</small></strong>
					</div>
						<div class="progress " style="border-radius:0;border-width:0;border-top-width:1px"> <div class="progress-bar" role="progressbar" style="width: {$server->server.ram_usage_percent}%;"> </div> </div>

				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-glass text-center">
					<div class="panel-heading ">CPU [{$server->server.cpu_usage|number_format}/{$server->server.total_cpu|number_format}]</div>
					
					<div class="panel-body ">
						<strong><small>{$server->server.cpu_usage_percent}%</small></strong>
					</div>
					<div class="progress " style="border-radius:0;border-width:0;border-top-width:1px"> <div class="progress-bar" role="progressbar" style="width: {$server->server.cpu_usage_percent}%;"> </div> </div>

				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-glass text-center">
					<div class="panel-heading ">HDD [{$server->server.hdd_usage|number_format}/{$server->server.total_hdd|number_format}]</div>
					
					<div class="panel-body ">
						<strong><small>{$server->server.hdd_usage_percent}%</small></strong>
					</div>
						<div class="progress " style="border-radius:0;border-width:0;border-top-width:1px"> <div class="progress-bar" role="progressbar" style="width: {$server->server.hdd_usage_percent}%;"> </div> </div>

				</div>
			</div>
		</div><br/>
				{/if}
		
		
		
		<form method="post">
		
	
			
			
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		{foreach from = $server->apps item = app}
		<div class="mb10">
			<div class="row">
				<div class="col-xs-10">
					<a  data-toggle="collapse" data-parent="#accordion" href="#app_{$app.process_id}_collapse" >
					<button class="text-left">
						<div class="row">
							<div class="col-xs-7 cut-text">
								{$app.name} <small>{if $app.damage}<span class="badge alert-danger">{$app.damage}% damaged</span>{/if}</small>
							</div>
							<div class="col-xs-5 text-right">
						{$app.cpu|number_format} CPU - {$app.ram|number_format} RAM - {$app.hdd|number_format} HDD
							</div>
						</div>
						</button>
					</a>
				</div>
				
				{if !$app.locked && !$server->server.disabled}
				<div class="col-xs-2">
					<button type="submit" name="runKill" value="{$app.process_id}">
						{if $app.running}<span class="glyphicon glyphicon-stop"></span>{else}<span class="glyphicon glyphicon-play"></span>{/if}
					</button>
				</div>
				{/if}
			</div>
			<div id="app_{$app.process_id}_collapse" class="panel-collapse collapse  " role="tabpanel" >
				<div style="padding:20px">
			
				<div class="panel panel-future mb10">
					<div class="panel-body">

						{include file="storage/item_description.tpl" item=$app hideResourceUsage = true}

					</div>
				</div>
				<div class="row">
					{if $app.damage}
						<div class="col-xs-5">
							{if !$app.running}
							<a href="{$config.url}workbench/server_app/{$app.process_id}" class="button text-center">
								<span class="glyphicon glyphicon-wrench"></span>
							</a>
							{else}
							<button disabled><span class="glyphicon glyphicon-wrench"></span></button>
							{/if}
						</div>
						<div class="col-xs-5">
					{else}

					<div class="col-xs-10">
					{/if}
					
						{if !$app.running}
						<a href="{$config.url}servers/server/{$server->server_id}/transfer/{$app.process_id}"><button type="button">TRANSFER</button></a>
						{else}
						<button disabled>transfer</button>
						{/if}
					</div>
				
					<div class="col-xs-2">
						<button {if $app.running}disabled{/if} type="submit" name="remove" value="{$app.process_id}"><span class="glyphicon glyphicon-trash"></span></button>
					</div>
				</div>
				
				</div>
				
			</div>
		</div>
		{foreachelse}
		<button disabled>no apps installed</button>
		{/foreach}
		</form>
		
		</div>
		
		<h3 class="text-right">current server skill levels <span class="glyphicon glyphicon-compressed"></span></h3>
		<div class="panel-group" id="skillsAccordion" role="tablist">
		{foreach from = $server->skills key = skill_ID item = data}
			<div class="row mb10">
				<div class="col-md-8">
					<a data-toggle="collapse" data-parent="#skillsAccordion" href="#skill_{$skill_ID}" >
					<button class="text-left">
						
						{$theskills[$skill_ID].name}
						</button>
					</a>
				</div>
				<div class="col-md-4">
					<button disabled>Level {$data.level} ({$data.exp}/{$data.expNext})</button>
				</div>
			</div>
			<div id="skill_{$skill_ID}" class="panel-collapse collapse " role="tabpanel">
				<blockquote>
				
									{foreach from = $theskills[$skill_ID].commands key = command item = influence}
										<p>{$commandActions[$command].name}{if 1 eq 2} with a rate of {$influence}{/if} {$commandActions[$command].verb} by {$influence*$data.level}{if !$commandActions[$command].unit}%{else}{$commandActions[$command].unit}{/if}</p>
									
									{/foreach}
								
				</blockquote>
			</div>
			
		{foreachelse}
		<button disabled>no skill levels</button>
		{/foreach}
		</div>
	</div>
 
 	
 </div>