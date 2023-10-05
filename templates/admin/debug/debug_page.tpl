{include file="header_home.tpl"}


		
			
			
		
		
				<div class="content blue_back_border">
				<center><a class="button" href="{$config.url}debug.php">Back to main</a></center>
			<div class="blue-box">{$smarty.get.page}</div>
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
								
								
							</div><br/>
							<div class="module" style="margin: 0 auto;">
								<span style="font-size:23px">
								<strong>
								<a>{$data.404_nr}</a><br/>
								</strong>
								</span>
								404 errors recorded
								
								
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
							<br/>
							<div class="module" style="margin: 0 auto;">
								<span style="font-size:23px">
								<strong>
								<a>{$data.sql_errors_nr}</a><br/>
								</strong>
								</span>
								SQL errors recorded
							</div>
						</td>
					</tr>
					</table>	
				</div>
	
	{include file="footer_home.tpl"}
		