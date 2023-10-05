<div class="row mb10">
	<div class="col-md-12">
		<div class="row-fluid">
			<div class="col-md-1 col-xs-2 ">
				<button disabled>{$quest.qgroup_order}</button>
			</div>
			<div class="col-md-6 col-xs-8 ">
				<div class="well black nomargin cut-text">
					 {if $quest.type eq 2}<span class="badge alert-warning">REPEAT</span>{elseif $quest.type eq 1}<span class="badge alert-info">DAILY</span>{else}<span class="badge alert-success">NORM</span>{/if} {$quest.title} (level {$quest.level}) <small>by {$quest.creator_name|profile_link}</small>
				</div>
			</div>
			<div class="col-md-1 col-xs-2  ">
				<form method="post" action="{$config.url}quests" target="_blank">
					<button type="submit" name="play" value="{$quest.id}"><span class="glyphicon glyphicon-play"></span></button>
				</form>
			</div>
			 {if $user.globalQuestManager}
			<div class="col-md-1 col-xs-3  ">
				<form method="post" class="">
					<input name="quest" type="hidden" value="{$quest.id}"/>

<button type="submit" name="isLive" value="true" {if !$quest.isLive}style="opacity:.6"{/if}>LIVE</button>
				</form>
			</div>
			<div class="col-md-1 col-xs-3  ">
				<form method="post">
					<input name="quest" type="hidden" value="{$quest.id}"/>
					<button type="submit" name="isLocked" value="true" {if !$quest.isLocked}style="opacity:.6"{/if}>
						<span class="glyphicon glyphicon-lock"></span>
					</button>
				</form>
			</div>
			 {else}
			<div class="col-md-1 col-xs-3  ">
				<button {if !$quest.islive}disabled {/if}>Live</button>
			</div>
			 {/if} 
			 {if $quest.creatorid eq $user.id || $user.globalQuestManager} 
			 {if $user.globalQuestManager || !$quest.isLocked}
			<div class="col-md-1 col-xs-2 ">
				<a href="{$config.url}admin/view/manageQuest/qid/{$quest.id}" class="button text-center"><span class="glyphicon glyphicon-pencil"></span></a>
			</div>
			<div class="col-md-1 col-xs-2 ">
				 {include file="dialogs/osx_dialog_box.tpl" id="deleteQ{$quest.id}" title="Delete quest" content='
				<form method="post" action="#" ">
					<input type="hidden" name="quest" value="{$quest.id}"/>
					<input type="hidden" name="del" value="true"/>
					<input type="submit" value="Delete {$quest.title}"/>
				</form>
				 '} <a href="#myModaldeleteQ{$quest.id}" data-toggle="modal" class=" button text-center" id="deleteQ{$quest.id}">
				<span class="glyphicon glyphicon-remove"></span>
				</a>
			</div>
			 {elseif $quest.isLocked}
			<div class="col-md-3 col-xs-4 ">
				<button disabled class="disabled">QUEST LOCKED</button>
			</div>
			 {/if} 
			
			 {/if}
		</div>
	</div>
</div>
