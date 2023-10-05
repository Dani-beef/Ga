 <div class="futureNav middle ">
       <ul>
          <li><a href="{$config.url}admin/view/manageQuest/qid/{$quest.id}/load/stats">Stats</a></li>
      
        </ul>
      </div>
		<form method="post" class="form-horizontal" action="#top">
		<div class="panel panel-future">
			<div class="panel-heading">{$quest.title}</div>
			<div class="panel-body">
			
			<input type="hidden" name="updateQuest" value="true"/>
			
				<input type="text" name="title" value="{$quest.title}" class="mb10" required maxlength="50"/>
				<div class="row mb10">
					
					<div class="col-xs-2 ">
						<select name="type">
							<option value="2" {if $quest.type eq 2}selected{/if}>Repeatable</option>
							<option value="1" {if $quest.type eq 1}selected{/if}>Daily</option>
							<option value="0" {if $quest.type eq 0}selected{/if}>Normal</option>
						</select>
					</div>
					<div class="col-xs-3 ">
						<select name="party">
						  <option value="0" >Solo</option>
							<option value="1" {if $quest.party eq 1}selected{/if}>Party</option>
							
						</select>
					</div>
					
					<div class="col-xs-3 ">
						<select name="time">
							 {for $index=1 to 200}
							<option value="{$index}" {if $quest.time eq $index}selected{/if}>{if $index eq 1}One minute{else}{$index} minutes{/if}</option>
							 {/for}
						</select>
					</div>
					
					<div class="col-xs-4 ">
						<select name="achievement_id">
						  <option value="0">No achievement</option>
							 {foreach from = $achievements item=ach}
							<option value="{$ach.achievement_id}" {if $quest.achievement_id eq $ach.achievement_id}selected{/if}>{$ach.achievement_id}|{$ach.name}</optionn>
							{/foreach}
						</select>
					</div>
				</div>
			
			{if !$quest.isLive || $user.cardinal}
			<div class="row mb10">
			      <div class="col-xs-2 ">
						<select name="level">
							 {for $index=1 to 300}
							<option value="{$index}" {if $quest.level eq $index}selected{/if}>User level <= {$index}</optionn>
							{/for}
						</select>
					</div>
			      <div class="col-xs-3 ">
						<select name="qgroup_id">
							 {foreach from=$groups item=group}
							<option value="{$group.qgroup_id}" {if $quest.qgroup_id eq $group.qgroup_id}selected{/if}>{$group.name}</option>
							 {/foreach}
						</select>
					</div>
					<div class="col-xs-3 ">
						<select name="qgroup_order">
							 {for $index=0 to 200}
							<option value="{$index}" {if $quest.qgroup_order eq $index}selected{/if}>Order {$index} in group</option>
							 {/for}
						</select>
					</div>
					
				
					
					
			      <div class="col-xs-4 ">
			        <select name="required_quest_id">
			          <option value="0">No required parent quest</option>
                 {foreach from = $quests item = q}
                  <option value="{$q.id}" {if $q.id eq $quest.required_quest_id}selected{/if}>{$q.title}</option>
                 {/foreach}
              </select>
			        
			      </div>
				  </div>
				  <div class="row mb10">
			      <div class="col-xs-1 ">
			        <button type="button">EXP</button>
			      </div>
			      <div class="col-xs-2 ">
			        <input type="text" class="text-center" name="experience" value="{$quest.experience}" placeholder="Experience"/>
			      </div>
			      <div class="col-xs-2 ">
			        <button type="button">Money</button>
			      </div>
			      <div class="col-xs-1 ">
			        <input type="text" class="text-center" name="money" value="{$quest.money}" placeholder="Money reward"/>
			      </div>
			      <div class="col-xs-1 ">
			        <button type="button">USP</button>
			      </div>
			      <div class="col-xs-1 ">
			        <input type="text" class="text-center" name="skillPoints" value="{$quest.skillPoints}" placeholder="USP"/>
			      </div>
			      <div class="col-xs-2 ">
			        <button type="button">Energy</button>
			      </div>
			      <div class="col-xs-2 ">
			        <input type="text" class="text-center" name="energy" value="{$quest.energy}" placeholder="Energy"/>
			      </div>
			   
			</div>
			{/if}
			<div class=" well text-center " >QUEST SUMMARY</div>
			<textarea name="summary">{$quest.summary}</textarea>
		</div>
      <button type="submit"><span class="glyphicon glyphicon-send"></span></button>
	  </div>
	</form>
