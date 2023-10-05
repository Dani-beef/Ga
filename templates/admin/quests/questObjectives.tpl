<script type="text/javascript">
  
</script>
<div class="row">

      <div class="col-md-9">
        <h3>Objectives </h3>
      </div>
      <div class="col-md-3">
        <form method="post" class="text-center" action="#objectives">
          <input type="submit" name="new_objective" value="Add objective"/>
        </form>
      </div>
  
</div>

<div class="alert alert-warning">
	<strong>TIP</strong> if you set the same objective order for two or more objectives, one of them will be picked randomly for the hacker to complete.
</div>
<div id="objectives">
	 {foreach from=$quest.objectives key=objectiveKey item=objective}
	<div class="row mb10" id = "objective_{$objective.id}">
	
			  <div class="col-md-1 ">
			    <button disabled>{$objective.oorder}</button>
			  </div>
				<div class="col-md-9 ">
					<a class="button" data-toggle="collapse" data-target="#objective_{$objective.id}_collapse" id="objective_{$objective.id}_button">
					OBJECTIVE {$objectiveKey+1} <em><small>{$objective.story|substr:0:70}..</small></em></a>
				</div>
				<div class="col-md-2 ">
					<button disabled>
						 
						 {$objective.sideObjectives|count} sides
						
					</button>
				</div>
		
	</div>
	<div class="collapse mb10" id = "objective_{$objective.id}_collapse" style="padding:20px">
		<form method="post" action="#objective_{$objective.id}">
			<input type="hidden" name="objective" value="{$objective.id}"/>
			<div class="row">
			
					  <div class="col-md-9 nopadding">
			        <textarea name="story" style="height:400px" maxlength="9999">{$objective.story}</textarea>
					    
					  </div>
						<div class="col-md-3 ">

							<select name="oorder" class="mb10">
								 {for $index=1 to 100}
								  <option value="{$index}" {if $objective.oorder eq $index}selected{/if}>Order {$index}</option>
								 {/for}
							</select>
							<button type="button" disabled >Extra time (seconds)</button>
							<input type="text" name="extraTime" placeholder="Give extra time (s)" value="{$objective.extraTime}" class="text-center mb10"/>
							<button type="button" disabled >Achievement</button>
							<select name="achievement">
                  <option value="0">No achievement</option>
                   {foreach from = $achievements item=ach}
                  <option value="{$ach.achievement_id}" {if $objective.achievement_id eq $ach.achievement_id}selected{/if}>{$ach.name}</optionn>
                  {/foreach}
                </select>
						</div>
					
					
			</div>
			
			<div class="row mb10">
				
						<div class="col-md-11 nopadding">
							<input type="submit" name="objectiveUpdate" value="Update objective {$objectiveKey+1}"/>
						</div>
						<div class="col-md-1 nopadding">
							<input type="submit" name="deleteObjective" value="X"/>
						</div>
					</div>
				
		</form>
		
		{include file="admin/quests/questSideObjectives.tpl"}
	</div>
	 {foreachelse}
	<div class="well text-center mb10">
		 No objectives added
	</div>
	 {/foreach}
</div>
 
