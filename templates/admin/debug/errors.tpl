{include file="header_home.tpl" no_sidebar=true}

{include file="admin/debug/debug_header.tpl"}
	
    {foreach from=$debug_errors item=p}
      <div class="row mb10">
        <div class="col-md-12">
          <div class="row-fluid">
            <div class="col-md-1 nopadding">
              <button disabled>
                {$p.errno}
              </button>
              <button disabled>
                L: {$p.errline}
              </button>
              
            </div>
            <div class="col-md-4 nopadding">
              <div class="well black">
                {$p.errstr}
              </div>
            </div>
            
            <div class="col-md-2 nopadding">
              <input type="text" value="{$p.errfile}"/>
              
            </div>
            <div class="col-md-3 nopadding">
              <button disabled>
                {$p.created}
              </button>
            </div>
            <div class="col-md-2 nopadding">
              <div class="well black text-center">
                {if $p.username}{$p.username}{else}none{/if}
              </div>
            </div>
           
          </div>
        </div>
      </div>
    {/foreach}
					
					
    <div class="text-center">
      {$pages}
    </div>
	
		