<div id = "tables_{$service.service_id}" class="panel panel-glass">
  <div class="panel-heading">SQL Tables</div>
  <div class="panel-body">
  {foreach from=$service.tables item=table key=tableKey}
     <div class="row mb10" id = "table_{$service.service_id}_{$table.file_id}">
     
      <div class="col-md-12">
        <div class="row-fluid">
          <div class="col-md-12 nopadding">
            <a class="button" data-toggle="collapse" data-target="#file_{$service.service_id}_{$table.file_id}_collapse" id="file_{$service.service_id}_{$table.file_id}_button">
              {$table.title} 
            </a>
          </div>
          
        </div>
      </div>
    </div>
      
    <div class="collapse mb10" id = "file_{$service.service_id}_{$table.file_id}_collapse">
      <form method="post" action="#table_{$service.service_id}_{$table.file_id}">
        <input type="hidden" name="service" value="{$service.service_id}"/>
        <input type="hidden" name="file" value="{$table.file_id}"/>
        <input type="hidden" name="host" value="{$host.id}"/>
        <input type="text" name="title" value="{$table.title}" placeholder="Title" class="mb10"/>
        <textarea name="content" rows="20" class="input-block-level">{$table.content}</textarea>
        
        <div class="row mb10">
          <div class="col-md-12">
            <div class="row-fluid">
              <div class="col-md-8 nopadding">
                <input type="submit" name="updateFile" value="Update table"/>
              </div>
              <div class="col-md-4 nopadding">
                <input type="submit" name="deleteFile" value="Delete table"/>
              </div>
            </div>
          </div>
        </div>
      </form>
    
    </div>
    
     {foreachelse}
      <div class="well text-center mb10">
         No files added
      </div>
     {/foreach}
	</div>
  <form method="post" class="text-center" action="#tables_{$service.service_id}">
    <input type="hidden" name="host" value="{$host.id}"/>
    <input type="hidden" name="service" value="{$service.service_id}"/>
    <input type="submit" name="new_file" value="Add file to service" />
  </form>
</div>