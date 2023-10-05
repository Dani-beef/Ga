<div  id="sideObjectives_{$objective.id}">


<div class="row">

      <div class="col-md-9">
        <h3>Objective {$objectiveKey+1} Sub Objectives</h3>
      </div>
      <div class="col-md-3">
        <form method="post" class="text-center" action="#sideObjectives_{$objective.id}">
        <input type="hidden" name="objective" value="{$objective.id}"/>
        <input type="submit" name="newSideObjective" value="Add Side objective"/>
      </form>
      </div>
   
</div>
	 {foreach from=$objective.sideObjectives key=sideObjKey item=sideObjective}
	 
    <div class="row" id = "sideObjective_{$objective.id}_{$sideObjective.id}" >
     		<div class="col-md-1">
				<button disabled>
					{$sideObjective.oorder}
					
				</button>
			</div>
           <div class="col-md-3 ">
            {if $sideObjective.compulsory}<div class="alert alert-error text-center">Compulsory{else}<div class="alert alert-warning text-center">Optional{/if}</div>
          
          </div>
          <div class="col-md-8 ">
            <a data-toggle="collapse" data-target="#sideObjective_{$objective.id}_{$sideObjective.id}_collapse" id="sideObjective_{$objective.id}_{$sideObjective.id}_button">
			<button class="text-left cut-text">
            [{$sideObjective.type|strtoupper}] [{$sideObjective.data}]
			</button></a>
          </div>
          
         
      
    </div>
      
    <div class="collapse mb10" id = "sideObjective_{$objective.id}_{$sideObjective.id}_collapse" >
	<form method="post" action="#sideObjectives_{$objective.id}">
  	  <div class="panel panel-glass">
	  	<div class="panel-heading">{$sideObjective.type|strtoupper}</div>
		<div class="panel-body">
      
        <input type="hidden" name="objective" value="{$objective.id}"/>
        <input type="hidden" name="sideObjective" value="{$sideObjective.id}"/>
        <div class="row mb10">
         
			
             <div class="col-md-4 ">
                <select name="compulsory">
                  <option value="0" {if !$sideObjective.compulsory}selected{/if}>Not compulsory</option>
                  <option value="1" {if $sideObjective.compulsory}selected{/if}>Compulsory</option>
                </select>
              </div>
			  
              <div class="col-md-4 ">
                <select name="type">
                   {foreach from=$objectiveTypes item=type}
                  <option value="{$type}" {if $type eq $sideObjective.type}selected{/if}>{$type|strtoupper}</option>
                   {/foreach}
                </select>
              </div>
              <div class="col-md-4 ">
                <input type="text" value="{$sideObjective.data}" placeholder="OBJECTIVE DATA" name="data"/>
                
              </div>
             
              
              
         
        </div>
        <div class="row mb10">
   				<div class="col-md-4">
					<select name="oorder">
							<option value="0">No group</option>
								 {for $index=1 to 100}
								  <option value="{$index}" {if $sideObjective.oorder eq $index}selected{/if}>Group {$index}</option>
								 {/for}
							</select>
				</div>
               <div class="col-md-4 ">
                <input type="text" name="extraTime" placeholder="Extra time (s)" value="{if $sideObjective.extraTime}{$sideObjective.extraTime}{/if}"/>
                
              </div>
              <div class="col-md-4 ">
                <select name="achievement">
                  <option value="0">No achievement</option>
                   {foreach from = $achievements item=ach}
                  <option value="{$ach.achievement_id}" {if $sideObjective.achievement_id eq $ach.achievement_id}selected{/if}>{$ach.name}</optionn>
                  {/foreach}
                </select>
              </div>
           
        </div>
        
      
    	</div>
		<div class="row ">
         
              <div class="col-md-8 ">
                <input type="submit" name="updateSide" value="Update side objective {$sideoObjKey+1}"/>
              </div>
              <div class="col-md-4 ">
                <input type="submit" name="deleteSide" value="Delete"/>
              </div>
           
        </div>
	  </div>
	  </form>
    </div>
    
    
	 {foreachelse}
	<div class="well text-center mb10">
		No side objectives
	</div>
	 {/foreach}

</div>