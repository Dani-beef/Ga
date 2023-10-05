{include file="header_home.tpl"} 

{include file="error_success.tpl"}

<form method="post" action="#" >
<div class="panel panel-future">
	<div class="panel-heading">
		Group
	</div>
	<div class="panel-body">

	<div class="row mb10">
		<div class="col-xs-2">
			<select name="gorder">
     {for $index=1 to 200}
    <option value="{$index}" {if $group.gorder eq $index}selected{/if}>Order {$index}</option>
     {/for}
  </select>
  		</div>
		<div class="col-xs-10">
	<input type="text" name="name" maxlength="15" class="mb10" value="{if $smarty.post.name}{$smarty.post.name}{else}{$group.name}{/if}" placeholder="Group name"/>
		</div>
	</div>
	<div class="row mb10">
		<div class="col-xs-6">
			<input type="text" name="level" placeholder="Level" value="{if $smarty.post.level}{$smarty.post.level}{else}{$group.level}{/if}"/>
		</div>
		<div class="col-xs-6">
			<select name="qparent">
				 <option value="0">No parent quest</option>
				 {foreach from=$quests item=q}
					<option value="{$q.id}" {if $group.qparent eq $q.id}selected{/if}>{$q.title}</option>
				 {/foreach}
			  </select>
  		</div>
	</div>

  
  
  </div>
	<button type="submit" name="qgroup_id" value="{$group.qgroup_id}"><span class="glyphicon glyphicon-send"></span></button>
</div>


	<div class="row">
		<div class="col-xs-6">
			<a class="button text-center" href="{$config.url}admin/view/manageQuest"><span class="glyphicon glyphicon-arrow-left"></span></a>
		</div>
		
		{if $group}
			<div class="col-xs-6">
				<button type="submit" name="delete" value="true" title="Delete if not quests inside" {if !$group['can_delete']} disabled{/if}><span class="glyphicon glyphicon-remove-circle"></span></button>
			</div>
		{/if}
	</div>

</form>