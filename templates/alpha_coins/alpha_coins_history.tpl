{include file="header_home.tpl"}
{include file="alpha_coins/alpha_coins_header.tpl"}

<div class="row">
	<div class="col-md-6">
		<h3>transaction logs</h3>
		
		{foreach from = $transactions_logs item = transaction}
			<div class="panel panel-future">
				<div class="panel-heading">
					{$transaction.created|date_fashion}
				</div>
				<div class="panel-body">
					Requested {$transaction.alphaCoins|number_format} and received {$transaction.alphaCoinsGiven|number_format} Alpha Coins.
				</div>
				<div class="panel-footer text-right">
					via <em>
					{if $transaction.paypal}
						paypal[{$transaction.paypal}]
					{elseif $transaction.kongregate}
						kongregate [{$transaction.kongregate}]
					{elseif $transaction.fortumo}
						fortumo [{$transaction.fortumo}]
					{else}
						unknown
					{/if}
					</em>
				</div>
			</div>
		{foreachelse}
			<div class="well black text-center">
				no records available
			</div>
		{/foreach}
	</div>
	<div class="col-md-6">
		<h3 class="text-right">spending logs</h3>
		{foreach from = $shop_logs item = log}
			<div class="panel panel-future">
				<div class="panel-heading text-right">
					{$log.created|date_fashion}
				</div>
				<div class="panel-body">
					{if $log.name}{$log.name}{else}{if $log.reason}{$log.reason}{else}no description{/if}{/if}
				</div>
				<div class="panel-footer">
					via
					<em>
					{if $log.kongregate}
						kongregate[{$log.kongregate}]
					{else}
						Alpha Coins [{$log.ac_cost|number_format}]
					{/if}
					</em>
				</div>
			</div>
		{foreachelse}
		<div class="well black text-center">
				no records available
			</div>
		{/foreach}
	</div>
</div>
<div class="text-center">
	{$pages}
</div>