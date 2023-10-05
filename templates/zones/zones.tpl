{include file="header_home.tpl" no_sidebar=true}


{foreach from = $zones item = zone}
  {if $zone.id eq $user.zone}
    <h2 class="text-center">ZONE {$zone.id|romanic_number}</h2>
    <br/>
    <div class="row">
      <div class="col-md-6">
    <button disabled class="disabled mb10">Population {$zone.nrm|number_format}</button>
      </div>
      <div class="col-md-6">

      </div>
    </div>

    <a href="{$config.url}zones/zone/{$zone.id}" class="button text-center mb10">
      ZONE {$zone.id|romanic_number}
    </a>
    <br/><br/>
    
  {/if}
{/foreach}


<div class="row">
{foreach from = $zones item = zone}
  {if $zone.id ne $user.zone}
  <div class="col-md-6 mb10">
    <h2 class="text-center">ZONE {$zone.id|romanic_number}</h2>
    <br/>
    
    <div class="row">
      <div class="col-md-6">
    <button disabled class="disabled mb10">Population {$zone.nrm|number_format}</button>
      </div>
      <div class="col-md-6">
      </div>
    </div>
   
    <a href="{$config.url}zones/zone/{$zone.id}" class="button text-center mb10">
      ZONE {$zone.id|romanic_number}
    </a>
    <br/>
  </div>
  {/if}
{/foreach}
</div>