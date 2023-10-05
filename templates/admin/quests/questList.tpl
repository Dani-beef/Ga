
{include file="header_home.tpl" no_sidebar=true} 

{include file="error_success.tpl"}
<div class="row">
	<div class="col-md-4">
<div class="alert alert-info text-center">
	Only Cardinal administrators can make your mission live or lock it as uneditable!
</div>
	</div>
	<div class="col-md-4">
<div class="alert alert-danger text-center">
We are looking forward to seeing what crazy complex workarounds you'll found to present your stories the way YOU want ^^.</div>
	</div>
	<div class="col-md-4">
<div class="alert alert-warning text-center">
You <strong>MUST</strong> read these guides before attempting to create missions: <a href="https://docs.google.com/document/d/1yRvaLqwfA3U7fqYHZbG2CEyAJvEyC7Prdsiitjh17EI/edit#" target="_blank">Management Guide</a> -- <a href="https://docs.google.com/document/d/12zamzZLg9_VXAyYqKLNp5EWZ0mbGeWZO3p-QIDtCCS4/edit#" target="_blank">Console Guide</a> (opens in new window)

</div>
	</div>
</div>
<div class="row mb10">
	<div class="col-md-5">
	<a class="button text-center" href="{$config.url}admin/view/manageQuest/tree/show">MISSIONS TREE</a>
	</div>	
	<div class="col-md-7">
	<a class="button text-center" href="{$config.url}admin/view/manageQuest/group/create">CREATE NEW MISSION GROUP</a>
	</div>
</div>

<h3>Groups</h3>
<hr/>
{foreach from = $groups key = groupK item = group}

 
 {include file="dialogs/osx_dialog_box.tpl" id="addQuest{$group.qgroup_id}" title="Add quest" content='
<form method="post" action="#" >
	<input type="text" name="title" maxlength="40" placeholder="Quest title" />
	<button type="submit" name="qgroup_id" value="{$group.qgroup_id}"><span class="glyphicon glyphicon-plus"></span></button>
</form>
 '} 
 
  <div class="row mb10">
    <div class="col-md-12">
      <div class="row-fluid">
        {if $group.type eq 1}
        <div class="col-xs-4 col-md-2 nopadding">
			    <div class="well nomargin black text-center">
			      {$group.gorder}			 
			    </div>
			  </div>
			  {else}<div class="col-xs-4 col-md-2 nopadding">
			    <div class="well black text-center nomargin">SPECIAL</div>
			    </div>
			  {/if}
	    
		
		
        <div class="col-xs-8 col-md-7 nopadding">
          <button onclick="panelToggling('#viewQuests{$groupK}', '.viewQuests'); ">{$group.name} {if $group.type eq 1} - LEV {$group.level}{/if} ({$group.nrQuestsLive}/{$group.nrQuests} live) </button>
        </div>
      
      
        <div class="col-xs-6 col-md-1 nopadding">
          <a href="#myModaladdQuest{$group.qgroup_id}" data-toggle="modal" class=" button text-center" id="addQuest{$group.qgroup_id}">
            <span class="glyphicon glyphicon-plus"></span>
          </a>
        </div>
        <div class="col-xs-6  col-md-2 nopadding">
          <a href="{$config.url}admin/view/manageQuest/group/{$group.qgroup_id}"  class=" button text-center">
            <span class="glyphicon glyphicon-pencil"></span>
          </a>
        </div>
        
        
      </div>
    </div>
  </div>
  <div id="viewQuests{$groupK}" class="nodisplay viewQuests pointer" >
  {assign var = found value = false}
    {foreach from = $quests item = quest}
		
      {if $quest.qgroup_id eq $group.qgroup_id}
	   {assign var = found value = true}
        {include file = "admin/quests/questBit.tpl"}
      {/if}
	 
    {foreachelse}
      <div class="well text-center">
        No quests in database
      </div>
    {/foreach}
	 {if !$found}
	  	<div class="well black text-center">
			no missions
		</div>
	  {/if}
  
  </div>

{/foreach}
<style>
  .viewQuests{
    padding:10px;
  }
   
</style>

