{include file="header_home.tpl"}


	
		
				{include file="error_success.tpl"}
				{foreach from=$masks key=kk item=g}
					<form method="post">
					<table width=100% class="destiny">
					
					{foreach from=$g key=k item=h}
					<tr><td width=30%>{$k}</td>
					<td>
						<input type="text" name="{$k}" value="{$h}"/>
					</td>
					</tr>
					{/foreach}
					
					<tr><td class="text-center" colspan=100%>
						<input type="hidden" value="{$g.id}" name="mid"/>
						<input type="submit" value="Update"/>
					</td></tr>	
					</table>
					</form>
				
					<br/>
				{/foreach}
			
	{include file="footer_home.tpl"}
		