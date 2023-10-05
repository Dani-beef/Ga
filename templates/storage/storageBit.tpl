{include file="dialogs/osx_dialog_box.tpl" id='Storage{$s.storage_id}' title='Sell {$s.name}' content='
	 <div class="alert alert-warning">You are about to sell and as such lose this item. The official shop undervalues the item and gives you less money if the item is damaged.</div>
	<form method="post">
		<button type="submit" name="sell" value="{$s.storage_id}">Sell [{$s.default_sell_price|number_format}$]</button>
	</form>

 '}
 
 		<a data-toggle="collapse" data-parent="#accordion" href="#collapseItem{$s.storage_id}" aria-expanded="true" aria-controls="collapseItem{$s.storage_id}">
			<button class="mb10">{$s.name} {if $s.damage}<span class="badge alert-danger">{$s.damage}%</span>{/if}</button>
		</a>
		
		<div id="collapseItem{$s.storage_id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseItem{$s.storage_id}">
		<div style="padding:20px">
		<div class="panel panel-glass">
			<div class="panel-heading">
				{$s.name}
			</div>
			<div class="panel-body">
				{include file="storage/item_description.tpl" item=$s}
			</div>
			<form method="post">
			<div class="row">
				{if $s.damage}
				<div class="col-xs-3">
						<a href="{$config.url}workbench/storage/{$s.storage_id}" class="button text-center" title="Repair">
							<span class="glyphicon glyphicon-wrench"></span>
						</a>
				</div>
				<div class="col-xs-5">
				
				{else}

				<div class="col-xs-8">
				{/if}
					<button type="submit" name="mount" value="{$s.storage_id}"><span class="glyphicon glyphicon-download-alt"></span></button>
				</div>
				
				<div class="col-xs-4">
					<a href="#myModalStorage{$s.storage_id}" data-toggle="modal"><button>SELL [{$s.default_sell_price|number_format}$]</button></a>
				</div>
			</div>
			</form>
			
		</div>
		</div></div>