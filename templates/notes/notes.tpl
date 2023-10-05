{include file="header_home.tpl"}

<div class="well">
	You can create {$nrNotes} note(s) of {$maxContentSize|number_format} characters in length. 
	{if !$smarty.session.premium.removeAds && !$smarty.session.premium.notes}
		<a href="{$config.url}alpha_coins/option/notes">Upgrade to 5 notes with a maximum of 50 000 characters in length.</a>
	{/if}
</div>
<div class="row mb10">
	<div class="col-xs-8"></div>
	<div class="col-xs-4">
		<form method="post">
			<button type="submit" name="new" value="true">new note</button>
		</form>
	</div>
</div>
{foreach $notes as $note}


<div class="row mb10">
	<div class="col-xs-9">
		<a href="{$config.url}notes/note/{$note.note_id}">
			<button class="text-left">{$note.title}</button>
		</a>
	</div>
	<div class="col-xs-3">
		<form method="post">
			<button type="submit" name="delete" value="{$note.note_id}">
				<span class="glyphicon glyphicon-remove"></span>
			</button>
		</form>
	</div>
</div>
{foreachelse}
<div class="alert alert-info">
You have yet to create any notes
</div>
{/foreach}