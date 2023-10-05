		{include file="header_home.tpl"}
		
    {if $logged}
      <div class="alert alert-info">
        Access the <strong><a href="{$config.url}rankings/details/show">Rankings Data interface</a></strong> to find detailed information regarding your own ranking.
      </div>
    {/if}
		{$rankingsGrid}
