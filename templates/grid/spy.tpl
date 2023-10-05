{include file="header_home.tpl" no_sidebar=true}
{include file="grid/grid_header.tpl"}


{include file="grid/grid_attack_header.tpl" type=1}




<form method="post" class="mb10">

	{if $stats}
        <input type="hidden" name="start" value="true"/>
        <input type="hidden" name="servers" value="{$servers}"/>
        <div class="row mb10">
          <div class="col-md-5">
            <button disabled>Spy ATK Power</button>
          </div>
          <div class="col-md-7">
            <button disabled>
              {$stats.spyAttack|number_format}
            </button>
          </div>
        </div>
      
      {else}
        {include file='grid/pick_unused_servers.tpl'}
       {/if}
      <br/>


	<div class="row">
		<div class="col-md-9">
			{if !$attack.cant}
			<button type="submit" name="initiate" value="true"><span class="glyphicon glyphicon-eye-open"></span></button>
			{else}<div class="alert alert-danger">
			Not enough resources to executed
		</div>
		{/if}
	</div>
	<div class="col-md-3">
		<a class="button text-center" href="{$config.url}grid"><span class="glyphicon glyphicon-remove"></span></a>
	</div>
</div>
</form>

