{include file="header_home.tpl" no_sidebar=true}
{include file="grid/grid_header.tpl"}


<div class="row">
  <div class="col-md-2">
    <a href="{$config.url}grid/" title="Zoom in to Nodes view">
      <button><span class="glyphicon glyphicon-zoom-in"></span></button>
    </a>
  </div>
  <div class="col-md-10">
		<div class="well mb10">
	    These are the clusters of Zone {$currentZone}. 
		  
		</div>
	</div>
	
	
	
</div>




<div class="row">
	{foreach $clusters as $cluster_index => $cluster}
		<div class="col-md-4">
			<div class="panel panel-glass">
				<div class="panel-heading">
					Cluster #{$cluster_index} ({$cluster.nrn} nodes in use)
				</div>
				<div class="panel-body text-center">
					{if $cluster.name}
						{$cluster.name}
					{else}
						unnamed
					{/if}
				</div>
			</div>

		</div>
	{/foreach}

</div>

<div class="text-center">
	{$pages}
</div>
