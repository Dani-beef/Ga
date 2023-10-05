<div id = "files_{$service.service_id}" class="panel panel-glass">
  <div class="panel-heading"> Files on drive</div>
  <div class="panel-body">
<div class="alert alert-error">
Use unique file names! Do not use the same file twice in any quest! The Cardinal System won't execute your change if you attempt to do so.
</div>
  {foreach from=$service.files item=file key=fileKey}
     <div class="row" id = "file_{$service.service_id}_{$file.file_id}">
    
          <div class="col-md-6 ">
            <a class="button" data-toggle="collapse" data-target="#file_{$service.service_id}_{$file.file_id}_collapse" id="file_{$service.service_id}_{$file.file_id}_button">
              {$file.title} 
            </a>
          </div>
          <div class="col-md-3 ">
            <div class="well black text-center">
               {if $file.encryption}Encrypted {$file.encryption}{else}Not encrypted{/if}
            </div>
          </div>
          <div class="col-md-3 ">
            <div class="well black text-center">
               {if $file.canRun}Runnable{else}File{/if}
            </div>
          </div>
       
    </div>
      
    <div class="collapse mb10" id = "file_{$service.service_id}_{$file.file_id}_collapse">
      <form method="post" action="#file_{$service.service_id}_{$file.file_id}">
	  
        <input type="hidden" name="service" value="{$service.service_id}"/>
        <input type="hidden" name="file" value="{$file.file_id}"/>
        <input type="hidden" name="host" value="{$host.id}"/>
		<div class="panel panel-glass">
			<div class="panel-heading">{$file.title}</div>
			<div class="panel-body">
		<div class="row mb10">
			<div class="col-md-8">
        <input type="text" name="title" value="{$file.title}" placeholder="Title"/>
			</div>
			 <div class="col-md-2 ">
                <button disabled>Encryption</button>
              </div>
			  
			<div class="col-md-2 ">
                <input type="text" name="encryption" value="{$file.encryption}" placeholder="Encryption"/>
              </div>
			 
		</div>
			  
        <textarea name="content" rows="20" class="mb10">{$file.content}</textarea>
        <div class="row mb10">
         
           
			   <div class="col-md-2 ">
                <input type="text" name="size" value="{$file.size}" placeholder="Size"/>
              </div>
              
              <div class="col-md-2 ">
    
				
				<input type="checkbox" id = "canRun_{$file.file_id}" name="canRun" {if $file.canRun}checked{/if} style="display:none"/>
				<button type="button" id ="canRun_{$file.file_id}_button"  onclick="doCheckboxToggle2('canRun_{$file.file_id}');" {if !$file.canRun}style="opacity:.6"{/if}>RUNNABLE</button>
	
	
	
              </div>
				<div class="col-md-2 ">
			  	<input type="checkbox" id = "running_{$file.file_id}" name="running" {if $file.running}checked{/if} style="display:none"/>
				<button type="button" id ="running_{$file.file_id}_button"  onclick="doCheckboxToggle2('running_{$file.file_id}');" {if !$file.running}style="opacity:.6"{/if}>RUNNING</button>
				
               
              </div>
              <div class="col-md-2 ">
			  	<input type="checkbox" id = "cantKill_{$file.file_id}" name="cantKill" {if $file.cantKill}checked{/if} style="display:none"/>
				<button type="button" id ="cantKill_{$file.file_id}_button"  onclick="doCheckboxToggle2('cantKill_{$file.file_id}');" {if !$file.cantKill}style="opacity:.6"{/if}>CAN'T KILL</button>
				
               
              </div>
			  <div class="col-md-2 ">
			  	<input type="checkbox" id = "burst_{$file.file_id}" name="burst" {if $file.burst}checked{/if} style="display:none"/>
				<button type="button" id ="burst_{$file.file_id}_button"  onclick="doCheckboxToggle2('burst_{$file.file_id}');" {if !$file.burst}style="opacity:.6"{/if}>BURST</button>
				
               
              </div>
			  <div class="col-md-2 ">
				<input type="text" name="executionTime" value="{$file.executionTime}" placeholder="Execution time (s)"/>

               
              </div>
			  </div>
			  <div class="row ">
			  
			 
			  <div class="col-md-3 ">
                <input type="text" name="parameters" value="{$file.parameters}" placeholder="Parameters (separator: |)"/>
              </div>
             
              <div class="col-md-3 ">
			    <input type="text" name="requiredToRun" placeholder="Running on current host (sep.: |)" value="{$file.requiredToRun}"/>               
              </div>
              
      
              <div class="col-md-3 ">
			     <input type="text" name="requiredOnMainToRun" placeholder="Running on main host (sep.: |)" value="{$file.requiredOnMainToRun}"/>   
                
              </div>
			  <div class="col-md-3 ">
			     <select name="requiredObjective">
				 	<option>No required (side)objective</option>
				 	{foreach $objectives as $objective}
						{if !$objective.side}
						<option value="{$objective.id}" {if $file.requiredObjective eq $objective.id}selected{/if}>{$objective.oorder} objective</option>
							{foreach $objectives as $oobjective}
						{if $oobjective.side eq $objective.id}
						<option value="{$oobjective.id}" {if $file.requiredObjective eq $oobjective.id}selected{/if}>SIDE - {$oobjective.type} - {$oobjective.data}</option>
						{/if}
					{/foreach}
						{/if}
					{/foreach}
					
				 </select>
              </div>
          
        </div>
		</div>
        <div class="row ">
    
              <div class="col-md-8 ">
                <input type="submit" name="updateFile" value="Update file"/>
              </div>
              <div class="col-md-4 ">
                <input type="submit" name="deleteFile" value="Delete file"/>
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
  <form method="post" class="text-center" action="#files_{$service.service_id}">
    <input type="hidden" name="host" value="{$host.id}"/>
    <input type="hidden" name="service" value="{$service.service_id}"/>
    <input type="submit" name="new_file" value="Add file to service" />
  </form>
  
</div>