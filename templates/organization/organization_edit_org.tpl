 <div class="futureNav middle ">
       <ul>
		<li><a href="{$config.url}organization/view/core/manage/forum"><span class="glyphicon glyphicon-comment"></span></a></li>

		<li><a href="{$config.url}organization/view/core/manage/intros">Intros</a></li>

		

		<li><a href="#myModaleditname" data-toggle="modal">Org. name</a></li>
 {if $access.owner}
		<li><a href="{$config.url}organization/view/disband/">Disband</a></li>
      {/if}
	</ul>
</div>
 {include file="dialogs/osx_dialog_box.tpl" id="editname" title="Edit name" content='
<div style="padding:20px">
	 <div class="alert alert-warning">Name change costs {$nameChangeHpCost} hacking points</div>
	<form method="post" action="#">
		<input type="hidden" name="form" value="cname"/>
		<div class="row mb10">
		<div class="col-xs-4">
		<input type="text" name="tag" maxlength="4" value="{$org.tag}"/>
		</div>
		<div class="col-xs-8">
	  <input type="text" name="name" maxlength="{$config.org_name_size}" value="{$org.name}"/>
	  </div>
	  </div>
	  
		<input type="submit" value="Update"/>
	</form>
</div>
 '}

 
{if $loadd eq 'manage_forum'} 
  {include file="organization/org_manage_forum.tpl"}  
{elseif $loadd eq 'manage_intros'}

<div class="alert alert-warning">You can use BBCODE. </div>
<form method="post">
<div class="panel panel-future">
	<div class="panel-heading">Public intro</div>
	<div class="panel-body">

	<input type="hidden" name="form" value="intros"/>
	<textarea name="intro" maxlength="1000">{if $smarty.post.intro}{$smarty.post.intro}{else}{$org.intro_unparsed}{/if}</textarea>
	</div>
</div>
<div class="panel panel-future">
	<div class="panel-heading">Members private intro</div>
	<div class="panel-body">
	<textarea name="memb_intro" maxlength="1000">{if $smarty.post.memb_intro}{$smarty.post.memb_intro}{else}{$org.memb_intro_unparsed}{/if}</textarea>
	</div>
</div>
<div class="panel panel-future">
	<div class="panel-heading">Applications intro</div>
	<div class="panel-body">
	<div class="alert alert-warning">Displayed when hackers apply to join. </div>
	<textarea name="app_intro" maxlength="100">{if $smarty.post.app_intro}{$smarty.post.app_intro}{else}{$org.app_intro_unparsed}{/if}</textarea>
	</div>
</div>

<button type="submit"><span class="glyphicon glyphicon-send"></span></button>

</form>
{else}
<hr/>
<div class="row mb10">
  <div class="col-md-8">
    <div class="well black mb10">Receive applications to join organization</div>
  </div>
  <div class="col-md-4 mb10">
    <form method="post">
      {if $org.allow_app}
        <input type="submit" name="allow_app" value="Enabled"/>
      {else}
        <input type="submit" name="allow_app" value="Disabled"/>
      {/if}
    </form>
  </div>
</div>

{if $access.owner}
<a href="{$config.url}organization/show/{$org.id}/view/changeOwner" class="button text-center">CHANGE OWNERSHIP</a>
{/if}
{/if}