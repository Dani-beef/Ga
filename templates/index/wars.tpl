<br/>
<div class="row">
 
      <div class="col-md-6 ">
	  	<a href="{$config.url}organization_wars">
        <button   class=" mb10 text-left">
          Organization wars
        </button>
		</a>
		<div class="mb10 button-stack">
        {foreach from=$org_wars item = war}
          <a href="{$config.url}organization_wars/war/{$war.war_id}" class="button text-center cut-text">
		  	<strong>{$war.org1_name}</strong> <small>VS</small> <strong>{$war.org2_name}</strong>
		  </a>
          {foreachelse}
           <button  disabled>
          ORGANIZATIONS ARE AT PEACE
        </button>
          
        {/foreach}
		</div>
      </div>
     
      <div class="col-md-6 ">
        <button  disabled class="disabled text-right mb10">
          Zone wars
        </button>
        {foreach from=$zWars item = war}
          <div class="row">
            <div class="col-md-12">
              <div class="row-fluid">
                <div class="col-md-9 nopadding " style="margin-bottom:5px">
                  <a href="{$config.url}blogs/blog/{$top.blog_id}" class="button cut-text">{$top.name}</a>
                </div>
                <div class="col-md-3 hidden-xs nopadding">
                  <button disabled class="disabled" style="border-left:0">{$top.rank}#</disabled>
                </div>
              </div>
            </div>
          </div>
          {foreachelse}
          <button  disabled class="disabled mb10 text-center">
          ZONES ARE AT PEACE
        </button>
        
        {/foreach}
      </div>
   
</div>
