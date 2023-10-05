{include file="header_home.tpl"  no_sidebar=1}

{include file="error_success.tpl"}
  
	{if !$load}
	  
<div style="background-image:url({$config.url}layout/img/characters/Mary-A.I-opacity.png); background-repeat:no-repeat;
 background-position: 50% 0%; min-height:600px;">

			{foreach from=$category item=c}
        {if $c.type eq 2}
			
            <h2>{$c.name}</h2>
			
            <div style="padding:10px">
              <div class="row">
			  
			  	<div class="col-md-6">
				{assign var=index value= -1}
                {foreach from = $category item=f key=k}
                  {if $f.parent eq $c.id}
				  {assign var=index value=$index+1}
                    {if $index % 2 == 0}
						          {include file="forum/forum_bit.tpl"}
                     
                   	{/if}
                  {/if}
                {/foreach}
				 </div>
				 
				 <div class="col-md-6">
				{assign var=index value= -1}
                {foreach from = $category item=f key=k}
                  {if $f.parent eq $c.id}
				  {assign var=index value=$index+1}
                    {if $index % 2 != 0}
						{include file="forum/forum_bit.tpl"}
                    
                   {/if}
                  {/if}
                {/foreach}
				 </div>
				 
			
              
           </div>
		   		</div>
          {/if}
        {foreachelse}
          <div class="well text-center">
            No sections available
          </div>
        {/foreach}

    </div>
			
	{else}
	
		{include file=$load}
	
	
	{/if}
		
