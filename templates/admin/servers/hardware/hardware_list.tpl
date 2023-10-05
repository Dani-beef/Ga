{include file="header_home.tpl" no_sidebar = true}

{include file="error_success.tpl"}


<form method="post">
	<button type="submit" name="add" value="true">Add new component</button>
</form>
<br/>

{foreach from = $components item = component}

<a class="button" href="{$config.url}admin/view/hardware/component/{$component.component_id}">{$component.name}</a>
<br/>

{/foreach}