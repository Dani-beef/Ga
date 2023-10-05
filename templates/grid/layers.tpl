{include file="header_home.tpl" no_sidebar=true}

{include file="grid/grid_header.tpl"}
	 
	 
	<div class="text-right mb10">


		<a title="About layers" href="{$config.url}frequently-asked-questions/open/grid-layers"> 
              <span class="fa fa-question-circle"  style="font-size:26px"></span> 
            </a>
	
</div>
<br/>



	  {include file="error_success.tpl"}

	  	<div class="panel-group" id="accordion" role="tablist" >

<div class="row mb10">
	<div class="col-md-6">
		<a class="button" data-toggle="collapse" data-parent="#accordion" href="#layer_spy_collapse" >SPY Layer</a>
	</div>
	<div class="col-md-1">
		<button disabled>DEF</button>
	</div>
	<div class="col-md-2">
		<button disabled>{$player.spyProtection|number_format}</button>
	</div>
	<div class="col-md-1">
		<button disabled>ATK</button>
	</div>
	<div class="col-md-2">
		<button disabled>{$player.spyAttack|number_format}</button>
	</div>
	
</div>

<div id="layer_spy_collapse" class="panel-collapse collapse mb10" role="tabpanel" >
			

<div class="panel panel-future">
	<div class="panel-heading">
		SPY Layer
	</div>
	<div class="panel-body">
		
		<div class="panel panel-future">
		<div class="panel-heading">
		defense
		</div>
		<div class="panel-body">
		{foreach from = $player['skills'] key = skill item = level}
		
			{if $theskills[$skill].spy > 0}
				<div class="row">
					<div class="col-md-6">
						<button disabled>
							{$theskills[$skill].name}
					         - 
							LvL {$level}
						</button>
					</div>
					<div class="col-md-3">
						<button disabled>
							RATE {$theskills[$skill]["spy"]}
						</button>
					</div>
					<div class="col-md-3">
						<button disabled>
							CONTRIBUTION {$theskills[$skill]["spy"] * $level}
						</button>
					</div>
					
				</div><br/>
			{/if}
		{/foreach}
		</div>
		</div>
		<br/>
		<div class="panel panel-future">
		<div class="panel-heading">attack</div>
		<div class="panel-body">
		
		{foreach from = $player['skills'] key = skill item = level}
			{if $theskills[$skill].spy < 0}
				<div class="row">
					<div class="col-md-6">
						<button disabled>
							{$theskills[$skill].name}
						    -  
							LvL {$level}
						</button>
					</div>
					<div class="col-md-3">
						<button disabled>
							RATE {-$theskills[$skill]["spy"]}
						</button>
					</div>
					<div class="col-md-3">
						<button disabled>
							CONTRIBUTION {-$theskills[$skill]["spy"] * $level}
						</button>
					</div>
					
				</div><br/>
			{/if}
		{/foreach}
		
		</div></div>
		
		<br/>
		<div class="panel panel-future">
		<div class="panel-heading">servers skills contribution</div>
		<div class="panel-body">
		
		
			<div class="panel-group" id="servers_spy" role="tablist" >
			{foreach from = $player.servers item = server}
				<a class="button" data-toggle="collapse" data-parent="#servers_spy" href="#layer_spy_server_{$server.server_id}_collapse" >{$server.hostname} - {$server.ip}</a>
				<br/>
				<div id="layer_spy_server_{$server.server_id}_collapse" class="panel-collapse collapse " role="tabpanel" style="padding:20px; padding-top:0; ">
					<div class="panel panel-future">
						<div class="panel-heading">Defense</div>
						<div class="panel-body">
				
					{assign var = foundDefence value = false}
					{foreach from=$server.server->skills key = skill item = data}
						{assign var = foundDefence value = true}
							{if $theskills[$skill]["spy"] > 0}
								<div class="row">
									<div class="col-md-6">
										<button disabled>{$layerIndex}
											{$theskills[$skill].name}
										     -   
											LvL {$data.level}
										</button>
									</div>
									<div class="col-md-3">
										<button disabled>
											RATE {$theskills[$skill]["spy"]}
										</button>
									</div>
									<div class="col-md-3">
										<button disabled>
											CONTRIBUTION {$theskills[$skill]["spy"] * $data.level}
										</button>
									</div>

								</div><br/>
							{/if}
					{/foreach}
					{if !$foundDefence}
						<button disabled>no contribution</button>
					{/if}
					</div></div>
					<br/>
					<div class="panel panel-future">
						<div class="panel-heading">Attack</div>
						<div class="panel-body">
				
					{assign var = foundAttack value = false}
					{foreach from=$server.server->skills key = skill item = data}
							{if $theskills[$skill]["spy"] < 0}
								{assign var = foundAttack value = true}
								<div class="row mb10">
									<div class="col-md-6">
										<button disabled>{$layerIndex}
											{$theskills[$skill].name}
										    -   
											LvL {$data.level}
										</button>
									</div>
									<div class="col-md-3">
										<button disabled>
											RATE {-$theskills[$skill]["spy"]}
										</button>
									</div>
									<div class="col-md-3">
										<button disabled>
											CONTRIBUTION {-$theskills[$skill]["spy"] * $data.level}
										</button>
									</div>
								</div>
							{/if}
					{/foreach}
					{if !$foundAttack}
						<button disabled>no contribution</button>
					{/if}
					</div>
					</div>
				</div>
				
			{foreachelse}
				<button disabled>no servers</button>
			{/foreach}
			</div>
		
	</div></div></div>

</div>
</div>




{for $layerIndex=1 to 3}

<div class="row mb10">
	<div class="col-md-6">
		<a class="button" data-toggle="collapse" data-parent="#accordion" href="#layer_{$layerIndex}_collapse" >LAYER {$layerIndex}</a>
	</div>
	<div class="col-md-1">
		<button disabled>DEF</button>
	</div>
	<div class="col-md-2">
		<button disabled>{$player['layers'][$layerIndex].defense|number_format}</button>
	</div>
	<div class="col-md-1">
		<button disabled>ATK</button>
	</div>
	<div class="col-md-2">
		<button disabled>{$player['layers'][$layerIndex].attack|number_format}</button>
	</div>
	
</div>

<div id="layer_{$layerIndex}_collapse" class="panel-collapse collapse mb10 " role="tabpanel" >
			<br/>


<div class="panel panel-future">
<div class="panel-heading">
Layer {$layerIndex}
</div>
	<div class="panel-body">
		
		<div class="panel panel-future">
		<div class="panel-heading">defense</div>
		<div class="panel-body">
		{foreach from = $player['skills'] key = skill item = level}
		
			{if in_array($layerIndex, array_keys($theskills[$skill]["layer"]))}
				<div class="row">
					<div class="col-md-6">
						<button disabled>
							{$theskills[$skill].name}
						    -   
							LvL {$level}
						</button>
					</div>
					<div class="col-md-3">
						<button disabled>
							RATE {$theskills[$skill]["layer"][$layerIndex]}
						</button>
					</div>
					<div class="col-md-3">
						<button disabled>
							CONTRIBUTION {$theskills[$skill]["layer"][$layerIndex] * $level}
						</button>
					</div>
					
				</div><br/>
			{/if}
		{/foreach}
		</div>
		</div>
		<br/>
		<div class="panel panel-future">
		<div class="panel-heading">attack</div>
		<div class="panel-body">
		{foreach from = $player['skills'] key = skill item = level}
			{if in_array(-$layerIndex, array_keys($theskills[$skill]["layer"]))}
				<div class="row">
					<div class="col-md-6">
						<button disabled>
							{$theskills[$skill].name}
						 -   
							LvL {$level}
						</button>
					</div>
					<div class="col-md-3">
						<button disabled>
							RATE {$theskills[$skill]["layer"][-$layerIndex]}
						</button>
					</div>
					<div class="col-md-3">
						<button disabled>
							CONTRIBUTION {$theskills[$skill]["layer"][-$layerIndex] * $level}
						</button>
					</div>
					
				</div><br/>
			{/if}
		{/foreach}
		
		</div>
		
		</div>
		<br/>
		<div class="panel panel-future">
			<div class="panel-heading">
				servers skills contribution</div>
			<div class="panel-body">
			
			<div class="panel-group" id="servers_{$layerIndex}" role="tablist"  >
			{foreach from = $player.servers item = server}
				<a class="button" data-toggle="collapse" data-parent="#servers_{$layerIndex}" href="#layer_{$layerIndex}_server_{$server.server_id}_collapse" >{$server.hostname} - {$server.ip}</a>
				<br/>
				<div id="layer_{$layerIndex}_server_{$server.server_id}_collapse" class="panel-collapse collapse " role="tabpanel" style="padding:20px; padding-top:0; ">
					<div class="panel panel-future">
					<div class="panel-heading">Defense</div>
					<div class="panel-body">
					{assign var = foundDefence value = false}
					{foreach from=$server.server->skills key = skill item = data}
						{assign var = foundDefence value = true}
							{if in_array($layerIndex, array_keys($theskills[$skill]["layer"]))}
								<div class="row">
									<div class="col-md-6">
										<button disabled>{$layerIndex}
											{$theskills[$skill].name}
										    -   
											LvL {$data.level}
										</button>
									</div>
									<div class="col-md-3">
										<button disabled>
											RATE {$theskills[$skill]["layer"][$layerIndex]}
										</button>
									</div>
									<div class="col-md-3">
										<button disabled>
											CONTRIBUTION {$theskills[$skill]["layer"][$layerIndex] * $data.level}
										</button>
									</div>

								</div><br/>
							{/if}
					{/foreach}
					{if !$foundDefence}
						<button disabled>no contribution</button>
					{/if}
					</div></div><br/>
					
					<div class="panel panel-future">
					<div class="panel-heading">Attack</div>
					<div class="panel-body">
					
				
					{assign var = foundAttack value = false}
					{foreach from=$server.server->skills key = skill item = data}
							{if in_array(-$layerIndex, array_keys($theskills[$skill]["layer"]))}
								{assign var = foundAttack value = true}
								<div class="row">
									<div class="col-md-6">
										<button disabled>{$layerIndex}
											{$theskills[$skill].name}
										     -   
											LvL {$data.level}
										</button>
									</div>
									<div class="col-md-3">
										<button disabled>
											RATE {$theskills[$skill]["layer"][-$layerIndex]}
										</button>
									</div>
									<div class="col-md-3">
										<button disabled>
											CONTRIBUTION {$theskills[$skill]["layer"][-$layerIndex] * $data.level}
										</button>
									</div>

								</div><br/>
							{/if}
					{/foreach}
					{if !$foundAttack}
						<button disabled>no contribution</button>
					{/if}
					</div></div>
				</div>
				
			{foreachelse}
				<button disabled>no servers</button>
			{/foreach}
			</div>
		</div></div>
	</div>

</div>
</div>

{/for}</div>

