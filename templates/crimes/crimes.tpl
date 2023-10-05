{include file="header_home.tpl"}

{include file="error_success.tpl"}

			
			
			<div class="well">
				Feel your mastermind talent awakening? Then this is the place to be.
			</div>
			{if $done}
				
						<table class="table">
				{if $done eq 1}
					
							<tr><td colspan=100%>{$cctask.name}</td></tr>
							<tr><td colspan=100%><div class="success">{$load}</div></td></tr>
							<tr><td>Money</td><td>{$earned}$</td></tr>
							<tr><td>Experience</td><td>{$exp}</td></tr>
							
						
						
				{else}
					<tr><td><div class="errors">{$load}</div></td></tr>
				{/if}
					<tr><td colspan=100%>
					<center>
						<a href="{$config.url}crimes" class="button">Back to cyber-crimes</a>
					</center></td></tr>
				</table>
					
			{else}
				
				{if $ctask}
					<div class="box-destiny text-center">
					{include file="knob_countdown.tpl" date=$ctask.date width=150}
					</div>
				{else}
				<form method="post">
					<table class="table">
					
					<tr><td width=1%></td><td></td><td>Energy</td><td>Level</td><td>Success rate</td><td>Avg. earnings</td><td>Time</td></tr>
					{foreach from=$crimes key=k item=c}
					<tr onclick="$('#radio_{$k}').attr('checked','checked');" style="cursor:pointer">
						<td>
							<input type="radio" id="radio_{$k}" name="poison" value="{$k}"/>
							<!--#{$k}-->
						</td>
						<td><div class="text-left">
							{$c.name}</div>
						</td>
						<td>{$c.energy}</td>
						<td>>={$c.level}</td>
						<td>
							{$c.rate}%
							
						</td>
						<td>
							
							{($c.min_money+$c.max_money)/2|round}$
							
						</td>
						<td>
							
								{$c.takes|sec2hms}
							
						</td>
					</tr>
					
					{/foreach}
					<tr><td colspan="100%" class="text-center">
						<input type="submit" value="GO"/>
					</td></tr>
					</table></form>
					{if $pages}
						<div class="text-center">
							{$pages}
						</div>	
					{/if}
				{/if}
			{/if}
			
	
	{include file="footer_home.tpl"}
		