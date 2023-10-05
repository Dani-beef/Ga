<div class="row">

      <div class="col-md-9">
        <h3>Hosts</h3>
      </div>
      <div class="col-md-3">
        {if $quest.hosts|count lt 21}
          <form method="post" class="text-center" action="#hosts">
            <input type="submit" name="new_host" value="Add host" />
          </form>
          {else}
            <div class="alert alert-error">
              Host limit reached. Cannot add any more hosts.
            </div>
          {/if}
      </div>
    
</div>		

<div class="alert alert-warning">
  Advice: Only one SSH per host usually exists in the real world. Other services are arguable.
</div>
<div id = "hosts">
  {foreach from=$quest.hosts key=hostKey item=host}
  <div class="row" id = "host_{$host.id}">
		
			  <div class="col-md-1 ">
				  <button disabled>IP_{$hostKey}</button>
				</div>
			  <div class="col-md-5 ">
			   
			    <a class="button" data-toggle="collapse" data-target="#host_{$host.id}_collapse" id="host_{$host.id}_button">
					HOST {$hostKey} <em><small>{$host.services|count} services</small></em>
					</a>
			  
				</div>
				<div class="col-md-3 ">
					<div class="well text-center">
					{if $hostKey eq 0}<strong> MAIN COMPUTER </strong>
					{else}
					  SERVER
					{/if}
					</div>
				</div>
				<div class="col-md-3 ">
					<div class="well black text-center">
						 {$host.hostname}
					</div>
				</div>
				
		
	</div>
	<div class="collapse mb10" id = "host_{$host.id}_collapse">
	  {if $hostKey ne 0}
		<form method="post" action="#host_{$host.id}">
			<input type="hidden" name="host" value="{$host.id}"/>
			<div class="row">
			  <div class="col-md-12">
          <div class="row-fluid">

            <div class="col-md-5 nopadding">
              <input type="text" value="{$host.hostname}" name="hostname" placeholder="HOSTNAME"/>
            </div>
            <div class="col-md-4 nopadding">
              <select name="maxBounces">
                {for $index=0 to 50}
							  <option value="{$index}" {if $host.maxBounces eq $index}selected{/if}>{$index} max bounces</option>
							 {/for}
              </select>
            </div>
            <div class="col-md-3 nopadding">
              <select name="discovered">
                <option value="0" {if !$host.discovered}selected{/if}>Not discovered</option>
                <option value="1" {if $host.discovered}selected{/if}>Discovered</option>
              </select>
            </div>
            
          </div>
          
        </div>
      </div>
			<div class="row mb10">
				<div class="col-md-12">
					<div class="row-fluid">
						<div class="col-md-8 nopadding">
							<input type="submit" name="updateHost" value="Update host {$hostKey+1}"/>
						</div>
						<div class="col-md-4 nopadding">
							<input type="submit" name="deleteHost" value="Delete"/>
						</div>
					</div>
				</div>
			</div>
		</form>
		{/if}
		{include file="admin/quests/questServices.tpl"}
	</div>
  {foreachelse}
    <div class="well text-center mb10">No hosts added</div>
  {/foreach}
  
</div>

      