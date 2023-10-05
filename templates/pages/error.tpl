{include file="header_home.tpl" }

					<h1 class="text-center weirdHeading">CARDINAL SYSTEM ERROR</h1>
					<div class="row">
					<div class="col-xs-4">
						<div class="text-center"> <img src="http://secretrepublic.net/layout/img/characters/Irene-A.I.png" style=" max-width:240px"> </div>
					</div>
					<div class="col-xs-8">
					<div class="alert alert-error">
						
						ERROR recorded. Please contact us if you think this is a bug!
					
					</div>
					<div class="alert alert-info">
						To track this specific error please provide the following: <strong>ISSUE#{$issue_id}</strong> in your inquiry.
					</div>
				{if $insertData}
					<div class="panel panel-glass">
						<div class="panel-heading">debugging</div>
						<div class="panel-body">
							{$insertData|nl2br}
						</div>
					</div>
				{/if}
				<a href="{$config.url}" class="button text-center">GO TO HOME</a>
				</div>
			</div>
	
		
