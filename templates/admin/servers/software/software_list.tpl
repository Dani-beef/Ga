{include file="header_home.tpl" no_sidebar = true}

{include file="error_success.tpl"}


<form method="post">
	<button type="submit" name="add" value="true">Add new software</button>
</form>
<br/>
<div class="row">
{foreach from = $apps item = app}
<div class="col-md-6">
<a class="button" href="{$config.url}admin/view/software/app/{$app.app_id}">{$app.name}</a>
<br/>
</div>


{/foreach}
</div>