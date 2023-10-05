{include file="header_home.tpl" no_sidebar = true}

{include file="error_success.tpl"}

	
		
 <center><a class="button" href="#myModaladd" data-toggle="modal" id="addLevel">ADD LEVEL REWARD</a></center>
{include file="dialogs/osx_dialog_box.tpl" id="add" title="New group" content='
<form method="post" action="#" style="text-align:center">
	<input type="text" name="level_id" maxlength="15"/>
	<input type="submit" name="addLevel" value="Add level" class="button"/>
</form>
 '} <br/>

{foreach from=$levelRewards item=reward}
<div class="row" id="reward_{$reward.level_id}">
	<div class="col-md-12">
		<div class="row-fluid">
			<div class="col-md-2 nopadding">
				<div class="well nomargin">
					 Level {$reward.level_id}
				</div>
			</div>
			<div class="col-md-2 nopadding">
				<div class="well nomargin">
					 USP {$reward.skillPoints}
				</div>
			</div>
			<div class="col-md-2 nopadding">
			  <button disabled>{$reward.money|number_format}$</button>
			</div>
			<div class="col-md-4 nopadding">
			  
			  <button disabled>{if $reward.achievement}{$reward.achievement}{else}no achievement{/if}</button>
			</div>
			<div class="col-md-1 nopadding">
				<button onclick="panelToggling('#editLevel{$reward.level_id}', '.editPanel'); ">EDIT</button>
			</div>
			<div class="col-md-1 nopadding">
				 
				<form method="post" action="#reward_{$reward.level_id}" style="margin:0px">
					<input type="hidden" name="level_id" value="{$reward.level_id}"/>
					<input type="submit" name="deleteLevel" value="X"/>
				</form>
			
			</div>
		</div>
	</div>
</div>
<div id="editLevel{$reward.level_id}" class="{if $smarty.post.level_id ne $reward.level_id}nodisplay{/if} editPanel">
	<form method="post" action="#">
		<input type="hidden" value="{$reward.level_id}" name="level_id"/>
		    <div class="row">
          <div class="col-md-12">
            <div class="row-fluid">
              <div class="col-md-2 nopadding">
                  <button type="button" disabled>Money</button>
               </div>
               <div class="col-md-2 nopadding">
                 <input type="text" name="money" value="{$reward.money}"/>
               </div>
               <div class="col-md-2 nopadding">
                  <button type="button" disabled>Uni skill points</button>
               </div>
               <div class="col-md-2 nopadding">
                 <input type="text" name="skillPoints" value="{$reward.skillPoints}"/>
               </div>
               <div class="col-md-2 nopadding">
                  <button type="button" disabled>Achievement</button>
               </div>
               <div class="col-md-2 nopadding">
                  <select name="achievement_id">
                    <option value="0">No achievement</option>
                    {foreach from=$achievements item=achievement}
                      <option value="{$achievement.achievement_id}" {if $achievement.achievement_id eq $reward.achievement_id}selected{/if}>{$achievement.name}</option>
                    {/foreach}
                  </select>
               </div>
               
            </div>
          </div>
        </div>
		<input type="submit" name="updateLevel" value="UPDDATE Level"/>
	</form>

	  
		 
	
	
</div><br/>
{/foreach}