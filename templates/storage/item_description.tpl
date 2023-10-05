		<div class="row">
			<div class="col-xs-3 text-center">
				{if !$item.image}
				  {if $item.app_id}
				    <img src="{$config.url}layout/img/storage/software.png" style="max-width:100%;opacity:.7" class="mb10" />
				  {else}
				    <img src="{$config.url}layout/img/storage/hardware.png" style="max-width:100%;opacity:.7" class="mb10" />
				  {/if}
				 {else}
				<img src="{$config.url}layout/img/storage/{$item.image}" style="max-width:100%;opacity:.7" class="mb10" />
				{/if}
			</div>
			<div class="col-xs-9">
			{if $item.damage}
				<div class="alert alert-danger text-center" style="line-height:5px">
					{$item.damage}% damaged
				</div>
			{/if}
			<div class="row" style="line-height:40px; font-size:14px; text-transform:uppercase">
				{if !$hideResourceUsage}
				{if $item.power}
					<div class="col-md-6">
					Power output: {$item.power}
					</div>
				{/if}
				{if $item.cpu}<div class="col-md-6">
					CPU: {$item.cpu}</div>
				{/if}
				{if $item.power_usage}
					<div class="col-md-6">
					Power usage: {$item.power_usage}
					</div>
				{/if}
				{if $item.ram}
				<div class="col-md-6">
					RAM: {$item.ram|number_format}
				</div>
				{/if}
				
				{if $item.hdd}<div class="col-md-6">
					HDD: {$item.hdd|number_format}</div>
				{/if}
				{if $item.type eq 3}<div class="col-md-6">
					{$item.slots} HDD slots</div>
				{/if}
				{if $item.type eq 2}<div class="col-md-6">
					{$item.slots} RAM slots</div>
				{/if}
				{/if}
				{if $item.skill_id}
					<strong>
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-7">
								{$theskills[$item.skill_id].name}
							</div>
							<div class="col-md-5 text-right">
								{$item.skill_value} points
							</div>
						</div>
					</div>
					
				</strong>
				{/if}
		    </div>
			</div>
		</div>
		
		