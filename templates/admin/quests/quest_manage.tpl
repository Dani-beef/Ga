{include file="header_home.tpl" no_sidebar=true} 


 <div class="row mb10">
	<div class="col-xs-2">
		<a href="{$config.url}admin/view/manageQuest" ><button><span class="glyphicon glyphicon-arrow-left"></span></button></a>
	</div>
</div>
         <div class="futureNav middle ">
       <ul>
          <li><a href="{$config.url}admin/view/manageQuest/qid/{$quest.id}">Main</a></li>
          <li><a href="{$config.url}admin/view/manageQuest/qid/{$quest.id}/load/objectives">Objectives</a></li>
          <li><a href="{$config.url}admin/view/manageQuest/qid/{$quest.id}/load/hosts">Hosts</a></li>
      
        </ul>
      </div>
    
  
     
   
   
   
<script>
  $(document).ready(function(){
         /* var href = location.href;
      var param = href.split("#"); 
      var param = param.spli("_");
  */
    {if $smarty.post.objective}
      $("#objective_{$smarty.post.objective}_button").trigger("click");
      {if $smarty.post.sideObjective}
        $("#sideObjective_{$smarty.post.objective}_{$smarty.post.sideObjective}_button").trigger("click");
      {/if}
    {/if}
      
     
    {if $smarty.post.host}
      $("#host_{$smarty.post.host}_button").trigger("click");
      {if $smarty.post.service}
        $("#service_{$smarty.post.service}_button").trigger("click");
        {if $smarty.post.file}
          $("#file_{$smarty.post.service}_{$smarty.post.file}_button").trigger("click");
        {/if}
        
      {/if}
    {/if}
    
   
  });
</script>
    {include file="error_success.tpl"}
    
    {if $GET.load eq "stats"}
   
    {include file="admin/quests/questStats.tpl"}
    {elseif $GET.load eq "objectives"}
   
    {include file="admin/quests/questObjectives.tpl"}
    {elseif $GET.load eq "hosts"}
    {include file="admin/quests/questHosts.tpl"}
    {else}
    
      {include file="admin/quests/questGeneralDetails.tpl"}
    {/if}
	
	<br/><br/>
	<form method="post" action="{$url}#notepad">
	<div class="panel panel-glass" id="notepad">
		<div class="panel-heading">Creator's Notepad</div>
		<div class="panel-body ">
			<div class="alert alert-info">
				Make sure you've saved any other changes on this page before updating the notepad or you might lose data.
			</div>
			<textarea name="creatorsNotepad" maxlength="10000">{$quest.creatorsNotepad}</textarea>
		</div>
		<button type="submit"><span class="glyphicon glyphicon-pencil"></span></button>
	</div>
</form>