{include file="header_home.tpl" no_sidebar=true}
{include file="grid/grid_header.tpl"}


{include file="grid/grid_attack_header.tpl" type=3}


 <form method="post">

	 <div class="row">
        <div class="col-md-9">
          {if !$attack.cant}
          <button type="submit" name="start" value="true">
            <span class="glyphicon glyphicon-trash"></span>
          </button>
          {else}<div class="alert alert-danger">
          Not enough resources to executed
        </div>
        {/if}
      </div>
      <div class="col-md-3">
        <a class="button text-center" href="{$config.url}grid">
        	<span class="glyphicon glyphicon-remove"></span>
        </a>
      </div>
    </div>
</form>


