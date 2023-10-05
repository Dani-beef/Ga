{include file="header_home.tpl"}


	
		
				<div class="content blue_back_border" >
				{include file="error_success.tpl"}
			
					<form method="post">
					<center>
					<select name="group">
					<option value=666>Everyone</option>

					{foreach from=$groups item=g}
					<option value={$g.id}>{$g.name}</option>
					{/foreach}
					</select><br/>
					<input type="text" name="title"value="{$smarty.post.title}" style="width:500px" /><br/>
					<textarea name="msg">{$smarty.post.msg}</textarea>
					<br/>
					<input type="submit" value="Send"/>
					</center>
					
					</form>
				</div>
	
	{include file="footer_home.tpl"}
		