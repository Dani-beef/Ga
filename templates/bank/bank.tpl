{include file="header_home.tpl"}
{include file="error_success.tpl"}
<h1 class="text-center" style="font-size:150px;">
<span class="glyphicon glyphicon-piggy-bank"></span>
	</h1>
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-glass">
			<div class="panel-heading">
				Your Alpha bank Acccount
			</div>
			<div class="panel-body">
				<h1 class="nomargin text-center">
					{$account.amount|number_format}$ <small>/ {$bankLimit|number_format}$</small>
				</h1>
			</div>
			{if !$smarty.session.premium.removeAds && !$smarty.session.premium.bankLimit2}
				<a href="{$config.url}alpha_coins/option/{if $smarty.session.premium.bankLimit1}bankLimit2{else}bankLimit1{/if}">
					<button>protect more money - remove limits with A-COINS</button>
				</a>
			{/if}
			<div class="panel-footer text-right">
				you can secure 1,000$ by default and an extra 1,000 for every 5 levels
			</div>
		</div>
		
		<div class="well">
			Money inside the vault cannot be stolen by any means. We'll keep your treasure secure and out of harm's way.
		</div>
	</div>
	<div class="col-md-6">
		<form method="post">
		<div class="panel panel-glass">
			<div class="panel-heading">
				DEPOSIT
			</div>
			<div class="panel-body">
				<input type="text" name="amount" placeholder="Integer Amount"/>
			</div>
			<button type="submit" name="deposit" value="go"><span class="glyphicon glyphicon-plus"></span></button>
		</div>
		</form>
		
		<form method="post">
		<div class="panel panel-glass">
			<div class="panel-heading">
				WITHDRAW
			</div>
			<div class="panel-body">
				<input type="text" name="amount" placeholder="Integer Amount"/>
			</div>
			<button type="submit" name="withdraw" value="yeah"><span class="glyphicon glyphicon-minus"></span></button>
		</div>
		</form>
	</div>
</div>