{include file="header_home.tpl" no_sidebar = true}

{include file="error_success.tpl"}

	
		
 <center><a class="button" href="#myModaladd" data-toggle="modal" id="add">CREATE ACHIEVEMENT</a></center>
{include file="dialogs/osx_dialog_box.tpl" id="add" title="New achievement" content='
<form method="post" action="#" class="text-center">
	<input type="text" name="newAchievement" maxlength="15"/>
	<input type="submit" value="Add achievement" class="button"/>
</form>
 '} <br/>

{foreach from=$achievements key=achKey item=achievement}
<div class="row mb10">
			<div class="col-xs-6 ">
				<div class="well nomargin">
					 {$achievement.achievement_id} - {$achievement.name}
				</div>
			</div>
			<div class="col-xs-2 ">
				<button class="disabled" disabled>{$achievement.points} points</button>
			</div>
			<div class="col-xs-2 ">
				<button onclick="panelToggling('#editRank{$achKey}', '.editPanel'); "><span class="glyphicon glyphicon-pencil"></span></button>
			</div>
			<div class="col-xs-2 ">
				<form method="post" action="#">
					<input type="hidden" name="achievement_id" value="{$achievement.achievement_id}"/>
					<input type="hidden" name="del" value="true"/>
					<input type="submit" value="X"/>
				</form>
			</div>
	
</div>
<div id="editRank{$achKey}" class="nodisplay editPanel">
	<div style="padding:20px">
	<form method="post" action="#">
	
		<input type="hidden" value="{$achievement.achievement_id}" name="achievement_id"/>
		<input type="hidden" value="true" name="update"/>
		<div class="row">
			
			  {foreach from = $achievement key = column item=value}
			    {if $column ne "achievement_id"}
					<div class="col-xs-6 mb10">
				    <input type="text" name ="{$column}" placeholder="{$column}" value="{$value}"/>
					</div>
				  {/if}
				{/foreach}
			
		</div>
	 <button type="submit" class="mb10"><span class="glyphicon glyphicon-send"></span></button>
	</form>
	</div>
	
</div>
{/foreach}