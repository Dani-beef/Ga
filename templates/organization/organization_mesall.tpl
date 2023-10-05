		{include file="organization/members_header.tpl"}
		<form method="post">
		<div class="row">
		  <div class="col-md-12">
	  <div class="row-fluid"> 
	    <div class="col-md-3 nopadding">
	      {foreach from=$ranks key=k item=rank}
	        <input type='checkbox' name='ranks[]' value='{$rank.rank_id}' id="group{$rank.rank_id}" class="nodisplay"/>
	        <button type="button" id="group{$rank.rank_id}_button" onclick="doCheckboxToggle2('group{$rank.rank_id}');" style="opacity:.5">{$rank.name}</button>
	      {/foreach}
	        {if $smarty.post.ranks}
	      <script>
	        $(document).ready(function(){
	        {foreach from = $smarty.post.ranks item = rank}
	          $('#group{$rank}_button').click();
	        {/foreach}
	        });
	      </script>
	    {/if}

	    </div>
	    <div class="col-md-9 nopadding">
	      <textarea name="content">{if $smarty.post.content}{$smarty.post.content}{else}{$content}{/if}</textarea>
	      <button type="submit">Send mass-email</button>
	    </div>
	  </div>
			
			
    
    </div></div>
    </form>
  