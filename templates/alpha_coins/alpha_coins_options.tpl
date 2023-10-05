{include file="header_home.tpl"}
{include file="alpha_coins/alpha_coins_header.tpl"}
<div style="background-image:url({$config.url}layout/img/modules/bird_red.png); background-repeat:no-repeat; background-position:50% 50%">

	{if $smarty.get.fortumo}



		{else}


		<br/>
		<div class="row">
			<div class="col-md-6">
				<blockquote>

						<h1 class=" nomargin" >{$user.alphaCoins|number_format}</h1>
					<div>Alpha Coins</div>
				</blockquote>
			</div>


			<div class="col-md-6">
				<blockquote class="pull-right">


						<h1 class="nomargin">10 A-C / $</h1>

						<div>
							
							<strong>all orders over {$config.ac_bonus_when_above - 1} Alpha-C receive {$config.ac_bonus_percent}% <span class="glyphicon glyphicon-gift"></span> </strong> (for {$config.ac_bonus_when_above}AC, {($config.ac_bonus_when_above/100)*$config.ac_bonus_percent}AC extra)

						</div>

				</blockquote>

			</div>



						





		</div>


		<br/>
		{include file="error_success.tpl"}
		{if $GET.option}
		<script type="text/javascript">
		$(window).load(function(){
			scrollToElement('#{$GET.option}');
		});

		</script>
		{/if}

				
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<form method="post">

				<h2>active services</h2>
				<hr/>

				{foreach from = $items item = item}
				{if $item.alreadyActive}
					{assign found true}
					{include file='alpha_coins/alpha_coins_item_bit.tpl'}	
				{/if}

					{/foreach}
					{if !$found}
					<div class="alert alert-warning">
						No active services. Top up your Alpha Coins and activate some goodness ASAP!
					</div>
					{/if}
					<br/>

					<h2>take your pick</h2>
					<hr/>

				

					{assign found false}
					{foreach from = $items item = item}
						{if !$item.alreadyActive}
							{assign found true}
							{include file='alpha_coins/alpha_coins_item_bit.tpl'}	
						{/if}

						{/foreach}

						{if !$found}
						<div class="alert alert-warning">
							All available services are active. <a href="#" title="Good Game, Well played!">GG WP!</a>
						</div>
						{/if}

					</form></div>
				</div>
				<br/>
				<h2> Coupon </h2>
				<div class="alert alert-info">
					Coupon codes can be obtained on large Alpha-C transactions, special events or by simply being an awesome hacker.
				</div>
				<form method="post">
					<div class="row">
						<div class="col-xs-8">
							<input type="text" class="text-center" placeholder="Coupon Code" name="coupon"/>
						</div>
						<div class="col-xs-4">
							<button type="submit"><span class="glyphicon glyphicon-gift"></span></button>
						</div>
					</div>
				</form>
				{/if}


