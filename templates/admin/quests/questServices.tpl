<h3>Services for host</h3>


<div id="services_{$host.id}" style="padding:20px">
	 {foreach from=$host.services key=serviceKey item=service}
	<div class="row" id = "service_{$service.service_id}">
		
			  <div class="col-md-3 ">
			    <button disabled>{$service.port}</button>
			  </div>
			
				<div class="col-md-6 ">
					<a class="button" data-toggle="collapse" data-target="#service_{$service.service_id}_collapse" id="service_{$service.service_id}_button">
					[{$service.type|strtoupper}] Service {$serviceKey+1} </a>
				</div>
				<div class="col-md-3 ">
					<div class="well black text-center">
						 {if $service.encryption}ENC: {$service.encryption}{else}Unprotected{/if}
					</div>
				</div>
				
		
	</div>
	<div class="collapse mb10" id = "service_{$service.service_id}_collapse" style="padding:20px">
	{if $hostKey ne 0}
		<form method="post" action="#service_{$service.service_id}">
			<input type="hidden" name="service" value="{$service.service_id}"/>
			<input type="hidden" name="host" value="{$host.id}"/>
			
			<div class="row">
				
					  <div class="col-md-9 ">
					    {if $service.type ne "http"}
						<div class="panel panel-glass">
							<div class="panel-heading">Welcome message - BBCODE ENABLED</div>
							<div class="panel-body nopadding">
              					<textarea name="welcome">{$service.welcome}</textarea>
							</div>
								<div class="row ">
				
						<div class="col-xs-9 ">
							<input type="submit" name="updateService" value="Update service {$serviceKey+1}"/>
						</div>
						<div class="col-xs-3 ">
							<input type="submit" name="deleteservice" value="X"/>
						</div>
					</div>
						</div>
              {/if}
					   
					  </div>
						<div class="col-md-3 ">
						   <button disabled>Port</button>
							<input type="text" placeholder="Port" name="port" value="{$service.port}"  class="mb10"/>
							<button disabled>Encryption</button>
							<input type="text" name="encryption" value="{$service.encryption}" placeholder="Encryption"  class="mb10"/>
						</div>
						
				
			</div>
			
		
				
		</form>
		
		{/if}
		{if $service.type eq "ssh"}
		  {include file="admin/quests/questServiceSSH.tpl"}
		{elseif $service.type eq "sql"}
		  {include file="admin/quests/questServiceSQL.tpl"}
		{elseif $service.type eq "smtp"}
		  {include file="admin/quests/questServiceSMTP.tpl"}
		{/if}

	</div>
	 {foreachelse}
	<div class="well text-center mb10">
		 No services added
	</div>
	 {/foreach}
</div> 
{if $hostKey ne 0}

{if $host.services|count lt 5}
  <form method="post" class="text-center" action="#services_{$host.id}">
    <input type="hidden" name="host" value="{$host.id}"/>
    <div class="row">
      <div class="col-md-12">
        <div class="row-fluid">
          <div class="col-md-6">
            <select name="type">
               {foreach from=$serviceTypes item=type}
                  <option value="{$type}" {if $type eq $service.type}selected{/if}>{$type|strtoupper}</option>
               {/foreach}
            </select>
          </div>
          <div class="col-md-6">
           <input type="submit" name="new_service" value="Add service"/>
          </div>
        </div>
      </div>
    </div>
  </form>
  {else}
    <div class="alert alert-error">
     Services limit reached. Cannot add any more services.
    </div>
  {/if}

 {/if}
