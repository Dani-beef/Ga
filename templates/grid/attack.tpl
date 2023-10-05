{include file="header_home.tpl" no_sidebar=true}
{include file="grid/grid_header.tpl" }

<!--
<div class="text-center">
  <img src="{$config.url}layout/img/modules/grid/heavy_attack.png"/>
</div>
<br/>-->
{include file="grid/grid_attack_header.tpl" type=2}



 
<form method="post">

    {if $stats}
        <input type="hidden" name="start" value="true"/>
        <input type="hidden" name="servers" value="{$servers}"/>

        {for $layer = 1 to 3}
        <button disabled class="mb10">
          <div class="row text-center">
            <div class="col-xs-4">
              Layer {$layer}
            </div>
            <div class="col-xs-8 ">
               {$stats[$layer].attack} ATK / {$stats[$layer].defense} DEF
            </div>
          </div>
        </button>
        {/for}
      {else}
      <div class="alert alert-info">
        <p>
        Servers will contributed to your attack and defense and might be dealt components damage. Check your <a href="{$config.url}grid/layers/show">layers</a> to evaluate your power.
        </p>
        <p>
        The servers used into the attack will be locked and become unavailable for usage in other attacks. While in use they no longer contribute to your defense in case you are attacked or spyed.
      </p></div>
        {include file='grid/pick_unused_servers.tpl'}
       {/if}





     <br/>
      <div class="row">
        <div class="col-md-9">
          {if !$attack.cant}
          <button type="submit" name="initiate" value="true">
            <span class="glyphicon glyphicon-screenshot"></span>
          </button>
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

