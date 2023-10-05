{include file="header_home.tpl" no_sidebar=true} 

<div class="text-center">
<form method="post">
	<button name="addTemplate" value="true">Add template</button>
</form>
</div>
<br/>
{foreach from =$templates item=template}
<form method="post" id="template_{$template.template_id}" action="#template_{$template.template_id}">
<button disabled class="disabled" >{$template.name}</button>
	<input type="text" name="name" value="{$template.name}" placeholder="Template name"/>
	<input type="text" name="shortcut" value="{$template.shortcut}" placeholder="Template shortcut handler"/>
	<input type="text" name="subject" value="{$template.subject}" placeholder="Subject"/>
	<textarea name="message">{$template.message}</textarea>
	<button name="updateTemplate" value="{$template.template_id}">Update</button>

</form>
<br/><br/>
{/foreach}
