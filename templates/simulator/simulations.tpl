{include file="header_home.tpl"}

{include file="grid/grid_header.tpl"}

<div class="row mb10">
	<div class="col-md-7"></div>
	<div class="col-md-5">
		<a href="{$config.url}simulator/simulate/mony"><button>NEW <span class="glyphicon glyphicon-screenshot"></span> SIMULATION</button></a>
	</div>
</div>
<div class="well">
	Very old simulations are deleted automagically by the Cardinal Mainframe.
</div>
{foreach from = $simulations item = simulation}
	
			<a href="{$config.url}simulator/simulation/{$simulation.simulation_id}">
				<button class="mb10 text-left">Simulated on {$simulation.created}</button>
			</a>
	

{foreachelse}

	<div class="well text-center">
		you've not made any simulations, yet
	</div>
{/foreach}

<div class="text-center">
	{$pages}
	</div>