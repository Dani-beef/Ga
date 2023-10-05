			
		
			
			{foreach from=$apps key=k item=a}
				<div class="panel panel-future">
					<div class="panel-heading">{$a.username|profile_link}</div>
					<div class="panel-body">
						 {$a.content}
					</div>
					<form method="post">
					<input type="hidden" name="answer" value="{$a.id}"/>
					<div class="row">
					  <div class="col-md-12">
						<div class="row-fluid">
						  <div class="col-xs-6 nopadding">
							{if !$onlyDecline}
							<input type="submit" name="accept" value="Accept"/>
							{/if}
						  </div>
						  <div class="col-xs-6 nopadding">
							<input type="submit" name="decline" value="Decline"/>
						  </div>
						</div>
					  </div>
					</div>
					</form>

					<div class="panel-footer text-right">
						{$a.created}
					</div>
				</div>
				
				
			{foreachelse}
			<div class="well text-center">
				No applications to join {$org.name}.
			</div>
			{/foreach}

			<div class="text-center">
				{$pages}
			</div>
			
			
			
			
		