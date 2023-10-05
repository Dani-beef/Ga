<div id = "emails_{$service.service_id}" style="padding:20px">
  <h3>Emails on service</h3>

  {foreach from=$service.emails item=email key=emailKey}
     <div class="row" id = "file_{$service.service_id}_{$email.file_id}">
     
      <div class="col-md-12">
        <div class="row-fluid">
          <div class="col-md-2 nopadding">
            <div class="well black text-center">
               ID: {$emailKey|str_pad:4:"0"}
            </div>
          </div>
          <div class="col-md-7 nopadding">
            <a class="button" data-toggle="collapse" data-target="#file_{$service.service_id}_{$email.file_id}_collapse" id="file_{$service.service_id}_{$email.file_id}_button">
              {$email.title} 
            </a>
          </div>
        
          <div class="col-md-3 nopadding">
            <div class="well black text-center">
               {$email.sender}
            </div>
          </div>
        </div>
      </div>
    </div>
      
    <div class="collapse mb10" id = "file_{$service.service_id}_{$email.file_id}_collapse">
      <form method="post" action="#file_{$service.service_id}_{$email.file_id}">
        <input type="hidden" name="service" value="{$service.service_id}"/>
        <input type="hidden" name="file" value="{$email.file_id}"/>
        <input type="hidden" name="host" value="{$host.id}"/>
		<div class="row">
			<div class="col-xs-4">
        		<input type="text" name="title" value="{$email.title}" placeholder="Title"/>
			</div>
			<div class="col-xs-4">
        		<input type="text" name="sender" value="{$email.sender}" placeholder="Sender"/>
			</div>
			<div class="col-xs-4">
			     <select name="requiredObjective">
				 	<option>No required (side)objective</option>
				 	{foreach $objectives as $objective}
						{if !$objective.side}
						<option value="{$objective.id}" {if $email.requiredObjective eq $objective.id}selected{/if}>{$objective.oorder} objective</option>
							{foreach $objectives as $oobjective}
						{if $oobjective.side eq $objective.id}
						<option value="{$objective.id}" {if $email.requiredObjective eq $objective.id}selected{/if}>SIDE - {$objective.type} - {$objective.data}</option>
						{/if}
					{/foreach}
						{/if}
					{/foreach}
					
				 </select>
              </div>
			 </div><br/>
        <textarea name="content" rows="20" class="input-block-level">{$email.content}</textarea>
       
        <div class="row mb10">
          <div class="col-md-12">
            <div class="row-fluid">
              <div class="col-md-8 nopadding">
                <input type="submit" name="updateFile" value="Update email"/>
              </div>
              <div class="col-md-4 nopadding">
                <input type="submit" name="deleteFile" value="Delete email"/>
              </div>
            </div>
          </div>
        </div>
      </form>
    
    </div>
    
     {foreachelse}
      <div class="well text-center mb10">
         No emails added
      </div>
     {/foreach}
  <form method="post" class="text-center" action="#emails_{$service.service_id}">
    <input type="hidden" name="host" value="{$host.id}"/>
    <input type="hidden" name="service" value="{$service.service_id}"/>
    <input type="submit" name="new_file" value="Add email to service" />
  </form>
</div>