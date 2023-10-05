{include file="organization/members_header.tpl"}
<div class="text-center"><a  href="#myModaladd" data-toggle="modal" id="add"><h3><span class="glyphicon glyphicon-plus-sign"></span></a></h3></div>

{include file="dialogs/osx_dialog_box.tpl" id="add" title="Add new rank" content='
<form method="post" action="#" style="text-align:center">
	<input type="text" name="newRank" maxlength="15" placeholder="Rank name - max 15 characters"/>
	<input type="submit" value="Add new rank" />
</form>
 '} 

{foreach from=$ranks key=rankKey item=rank}
<div class="row">
	<div class="col-md-12">
		<div class="row-fluid">
			<div class="col-md-7 nopadding">
				<div class="well nomargin">
					 {if $rank.rank_order}[{$rank.rank_order}] {/if}{$rank.name}
				</div>
			</div>
			<div class="col-md-3 nopadding">
				<button onclick="panelToggling('#editRank{$rankKey}', '.editPanel'); "><span class="glyphicon glyphicon-pencil"></span></button>
			</div>
			<div class="col-md-2 nopadding">
				 {if $rank.owner_rank} <button disabled>OWNER</button>
				{elseif $rank.default_rank} <button disabled>DEFAULT</button>
				{else}
          <form method="post" action="#" >

			<button type="submit" name="deleteRank" title="Delete rank" value="{$rank.rank_id}"><span class="glyphicon glyphicon-remove-sign"></span></button>
          </form>
				{/if}
			</div>
		</div>
	</div>
</div>
<div id="editRank{$rankKey}" class="nodisplay editPanel">
	<form method="post" action="#">
		<input type="hidden" value="{$rank.rank_id}" name="rank"/>
		<div class="row">
			{if $rank.owner_rank}
			<div class="col-md-12">
				<input type="text" name ="name"   placeholder="RANK NAME" value="{$rank.name}"/>
			</div>
			{else}
			<div class="col-xs-8">
				<input type="text" name ="name"  placeholder="RANK NAME" value="{$rank.name}"/>
			</div>
		
			<div class="col-xs-4">
				<input type="text" name ="rank_order"  class="text-center" placeholder="RANK ORDER" value="{$rank.rank_order}"/>
			</div>
			
			{/if}
		</div>
		 {if !$rank.owner_rank} {foreach from = $permissions key = key item=permission}
		<div class="row">
			<div class="col-md-12">
				<div class="row-fluid">
					<div class="col-md-8 nopadding">
						<div class="well nomargin">
							 {$permissionNames[$key]} 
							 <input type="checkbox" id = "rank_{$rankKey}_perm_{$key}" name="{$permission}" {if $rank[$permission]}checked{/if} style="display:none"/>
						</div>
					</div>
					<div class="col-md-4 nopadding">
						<button type="button" id ="rank_{$rankKey}_perm_{$key}_button"  onclick="doCheckboxToggle('rank_{$rankKey}_perm_{$key}');" {if !$rank[$permission]}style="opacity:.6"{/if}>{if $rank[$permission]}ENABLED{else}DISABLED{/if}</button>
					</div>
				</div>
			</div>
		</div>
		 {/foreach} {/if} <button type="submit"><span class="glyphicon glyphicon-floppy-save"></span></button>
	</form>
	
</div><br/>
{/foreach}