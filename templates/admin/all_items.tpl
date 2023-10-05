{include file="header_home.tpl"}


	
		
				<div class="content blue_back_border" >
				
			
					<table width=100% class="cobra">
					
					{foreach from=$item_categories key=k item=c}
						<tr><td colspan=100%><h3 style="margin-top:10px;">{$c.name}</h3></td></tr>
						<tr style="font-weight:bold">
					<td>ID</td>
					<td>Name</td>
					<td>RAM</td>
					<td>CPU</td>
					<td>Powers</td>
					<td>RAM slots</td>
					<td>HDD Slots</td>
					<td>Space</td>
					<td>Power usage</td>					
					<td>For sale</td>					
					<td>Price</td>					
					</tr>
						{foreach from=$items key=kk item=i}
							{if $i.cat eq $k}
								<tr><td>{$kk}</td><td>{$i.name}</td><td>{$i.ram}</td><td>{$i.speed}</td><td>{$i.powers}</td><td>{$i.ram_slots}</td><td>{$i.hdd_slots}</td>
								<td>{$i.space}</td><td>{$i.power_usage}</td><td>{$i.forsale}</td><td>{$i.price}</td>
								</tr>
								<tr><td colspan=100%>
									{$i.description}
								</td></tr>
							{/if}
						{/foreach}
					{/foreach}
					
					</table>
				</div>
	
	{include file="footer_home.tpl"}
		