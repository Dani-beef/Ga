{include file="header_home.tpl" no_sidebar = true}

{include file="error_success.tpl"}

<button disabled>{$component.name}</button>
<br/>

<form method="post">
<div class="row-fluid">
	{foreach from = $component key = col item = value}
		<div class="col-md-2 mb10">
			<button disabled>{$col}</button>
		</div>
		<div class="col-md-2 mb10">
			<input type="text" name="{$col}" value="{$value}" class="text-center"/>
		</div>
	{/foreach}
</div>
<div class="row">
<div class="col-md-8">
<button type="submit">Update</button>
</div>
<div class="col-md-4">
<a class="button" href="{$config.url}admin/view/hardware">Back to Hardware</a>
</div>
</div></form>
