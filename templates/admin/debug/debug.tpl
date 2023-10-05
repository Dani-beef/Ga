{include file="header_home.tpl"}


	
		
				<div class="content blue_back_border" >
				
			
					<table width=100%>
					<tr style="text-align:center">
						<td width=33%><br/>
							
							<div class="module" style="margin: 0 auto;">
								<span style="font-size:23px">
								<strong>
								<a>{$data.page_memory} kb</a><br/>
								</strong>
								</span>
								avg. memory usage
								
								
							</div>
						</td><td width=1%></td>
						<td width=33%>
							<div class="module blue_back_border" style="margin: 0 auto;">
								<span style="font-size:23px">
								<strong>
								<a>{$data.page_views}</a><br/>
								</strong>
								</span>
								page views
							</div><br/>
							<div class="module blue_back_border" style="margin: 0 auto;">
								<span style="font-size:23px">
								<strong>
								<a>{$data.page_load}</a><br/>
								</strong>
								</span>
								seconds avg. page load
							</div>
							<br/>
							<div class="module blue_back_border" style="margin: 0 auto;">
								<span style="font-size:23px">
								<strong>
								<a>{$data.404} & {$data.sql_errors}</a><br/>
								</strong>
								</span>
								404 & sql errors recorded
							</div>
						</td>
						<td width=1%></td>
						<td width=33%>
				
							<div class="module" style="margin: 0 auto;">
								<span style="font-size:23px">
								<strong>
								<a>{$data.page_queries}</a><br/>
								</strong>
								</span>
								avg. queries
							</div>
						</td>
					</tr>
					</table><br/>	
					<center>
					<a class="button" href="{$config.url}debug.php">Main</a>
					<a class="button" href="{$config.url}debug.php?a=404">404</a>
					<a class="button" href="{$config.url}debug.php?a=sql">SQL</a>
					</center>
					<br/>
					{if !$smarty.get.a}
					
						<table width=100% class="cobra" style="text-align:center">
						<tr style="font-weight:bold">
							<td>
							Page
							</td>
							<td>Page views</td>
							<td>Avg. load time</td>
							<td>Avg. mem. usage</td>
							<td>Queries</td>
							<td>Details</td>
						</tr>
						{foreach from=$data.pages key=k item=p}
						<tr>
						<td style="text-align:left">{$k}</td>
						<td>{$p.page_views}</td>
						<td>{$p.page_load}</td>
						<td>{$p.page_memory} kb</td>
						<td>{$p.page_queries}</td>
						<td><a href="{$config.url}debug.php?page={$k}" class="button">Details</a></td>
						</tr>
						{/foreach}
						</table>
					{elseif $smarty.get.a eq "404"}
					<table width=100% class="cobra" style="text-align:center">
						<tr style="font-weight:bold">
							<td>
							URL
							</td>
							<td>Page</td>
							<td>User</td>
							<td>Date</td>
							
						</tr>
						{foreach from=$data.404_errors key=k item=p}
						<tr>
						<td><a href="{$p.url}" target="_blank">{$p.url}</a></td>
						<td>{$p.page}</td>
						<td>{$p.user}</td>
						<td>{$p.date}</td>
						
						</tr>
						{/foreach}
						</table>
					{elseif $smarty.get.a eq "sql"}
					<table width=100% class="cobra" style="text-align:center">
						<tr style="font-weight:bold">
							<td>
							URL
							</td>
							<td>Page</td>
							<td>Error</td>
							<td>User</td>
							<td>Date</td>
							
						</tr>
						{foreach from=$data.sql_errorss key=k item=p}
						<tr>
						<td><a href="{$p.url}" target="_blank">{$p.url}</a></td>
						<td>{$p.page}</td>
						<td>{$p.error}</td>
						<td>{$p.user}</td>
						<td>{$p.date}</td>
						
						</tr>
						{/foreach}
						</table>
					
					
					{/if}
					<Br/><center>
						{if $num_pages gt 1}
									{$pages}
								{/if}
						</center>
				</div>
	
	{include file="footer_home.tpl"}
		