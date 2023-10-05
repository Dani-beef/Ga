{include file="header_home.tpl" no_sidebar = true}

{include file="error_success.tpl"}

	
		
 <center><a class="button" href="#myModaladd" data-toggle="modal" id="add">CREATE GROUP</a></center>
{include file="dialogs/osx_dialog_box.tpl" id="add" title="New group" content='
<form method="post" action="#" style="text-align:center">
	<input type="text" name="newGroup" maxlength="15"/>
	<input type="submit" value="Add group" class="button"/>
</form>
 '} <br/>

{foreach from=$groups key=groupKey item=group}
<div class="row">
	<div class="col-md-12">
		<div class="row-fluid">
			<div class="col-md-6 nopadding">
				<div class="well nomargin">
					 {$group.name}
				</div>
			</div>
			<div class="col-md-2 nopadding">
			  <a href="{$config.url}admin/view/registered/group/{$group.group_id}" class="button text-center">
				{$group.nrMembers|number_format} members
				</a>
			</div>
			<div class="col-md-2 nopadding">
				<button onclick="panelToggling('#editRank{$groupKey}', '.editPanel'); ">EDIT</button>
			</div>
			<div class="col-md-2 nopadding">
				 
				<form method="post" action="#" style="margin:0px">
					<input type="hidden" name="del" value="{$group.group_id}"/>
					<input type="submit" value="X"/>
				</form>
			
			</div>
		</div>
	</div>
</div>
<div id="editRank{$groupKey}" class="nodisplay editPanel">
	<form method="post" action="#">
		<input type="hidden" value="{$group.group_id}" name="updateID"/>
		<div class="row">
			<div class="col-md-12">
			  {foreach from = $group key = column item=value}
			    {if $column|in_array:$nonPermissionColumns && !$column|in_array:$ignoreColumns}
				    <input type="text" name ="{$column}"  class="text-center" placeholder="{$column}" value="{$value}"/>
				  {/if}
				{/foreach}
			</div>
		</div>
		 {foreach from = $group key = column item=value}
         {if !$column|in_array:$nonPermissionColumns && !$column|in_array:$ignoreColumns}
        <div class="row">
          <div class="col-md-12">
            <div class="row-fluid">
              <div class="col-md-8 nopadding">
                <div class="well nomargin">
                   {$column} <input type="checkbox" id = "rank_{$groupKey}_perm_{$column}" name="{$column}" {if $value}checked{/if} style="display:none"/>
                </div>
              </div>
              <div class="col-md-4 nopadding">
                <button type="button" id ="rank_{$groupKey}_perm_{$column}_button"  onclick="doCheckboxToggle('rank_{$groupKey}_perm_{$column}');" {if !$value}style="opacity:0.6"{/if}>{if $value}ENABLED{else}DISABLED{/if}</button>
              </div>
            </div>
          </div>
        </div>
        {/if}
		 {/foreach}  <button type="submit">UPDDATE {$group.name}</button>
	</form>
	
</div><br/>
{/foreach}