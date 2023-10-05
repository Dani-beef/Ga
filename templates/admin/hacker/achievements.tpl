
					  <form method="post">
					    <select name="add"> 
					      {foreach from=$achievements item=achievement}
					        <option value = "{$achievement.achievement_id}">{$achievement.name}</option>
					      {/foreach}
					    </select>
					    <input type="submit" value="Add achievement"/>
					  </form>
					  <br/><br/>
					  {foreach from = $userAchievements item = achievement}
					  
					  <form method="post">
					  	<input type="hidden"  value = "{$achievement.achievement_id}" name="achievement"/>

					    <div class="row" style="margin-bottom:10px">
					      <div class="col-md-12">
					        <div class="row-fluid">
					          <div class="col-md-7 nopadding">
					            <div class="well nomargin">
					              {foreach from =$achievements item = ach}
					                {if $ach.achievement_id eq $achievement.achievement_id}
					                  [{$achievement.user_achievement_id}] {$ach.name} [{$ach.achievement_id}]
					                {/if}
					              {/foreach}
					            </div>
					          </div>
					          <div class="col-md-2 nopadding">
					            <input type="text" class="text-center" value = "{$achievement.times}" name="times"/>
					          </div>
					          <div class="col-md-2 nopadding">
					            <input type="submit" name="update" value="UPDATE"/>
					          </div>
					           <div class="col-md-1 nopadding">
					            <input type="submit" name="del" value="X"/>
					          </div>
					        </div>
					      </div>
					    </div>
					  </form>
					  {foreachelse}
					    <div class="well text-center">
					      No achievements
					    </div>
					  {/foreach}
				
	
		