{include file="header_home.tpl"}


{if $GET.edit}
<div class="row mb10">
	<div class="col-xs-3">
		<a href="{$config.url}notes/note/{$note.note_id}">
			<button><span class="glyphicon glyphicon-arrow-left"></span></button>
		</a>
	</div>
</div>
{include file="error_success.tpl"}

<form method="post">
<div class="panel panel-glass">
	<div class="panel-heading">{if $smarty.post.title}{$smarty.post.title}{else}{$note.title}{/if}</div>
	<div class="panel-body">
		<input type="text" class="mb10" name="title" value="{$note.title}" maxlength="100" />
		<textarea name="content" maxlength="{$maxContentSize}">{if $smarty.post.content}{$smarty.post.content}{else}{$note.content}{/if}</textarea>
	
	</div>
	
		<button type="submit"><span class="glyphicon glyphicon-pencil"></span></button>
	
</div>
</form>
{else}
<div class="row mb10">
	<div class="col-xs-3">
		<a href="{$config.url}notes">
			<button><span class="glyphicon glyphicon-arrow-left"></span></button>
		</a>
	</div>
</div>
<div class="panel panel-glass">
	<div class="panel-heading">{$note.title}</div>
	<div class="panel-body">
		{$note.content}
	
	</div>
	<a href="{$config.url}notes/note/{$note.note_id}/edit/go">
		<button><span class="glyphicon glyphicon-pencil"></span></button>
	</a>
</div>
{/if}