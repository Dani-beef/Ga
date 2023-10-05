
	{foreach from = $servers item = server}
		<div class="row mb10">
			<div class="col-xs-8">
				<a href="{$config.url}servers/server/{$server.server_id}" target="_blank" class="button">
				{$server.hostname}
				</a>
			</div>
			<div class="col-xs-4">
				{if $server.cant_use}
					<div class="alert alert-info text-center nomargin">
						in use
					</div>
				{else}
				<input type='checkbox' name='servers[]' value='{$server.server_id}' id="server{$server.server_id}" class="nodisplay"/>
	        	<button type="button" id="server{$server.server_id}_button" onclick="doCheckboxToggle2('server{$server.server_id}');" style="opacity:.5">
	        		<span class="glyphicon glyphicon-ok"></span>

	        	</button>
				{/if}
			</div>
		</div>
	{foreachelse}
	
		<div class="alert alert-warning">
			No servers available - you would use only your <a href="{$config.url}skills">skills</a>. 
		</div>
	
	{/foreach}