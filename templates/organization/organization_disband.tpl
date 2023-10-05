
		<div class="row">
		<div class="col-md-12">
		<div class="row-fluid">
		<div class="col-md-12 nopadding">
			<div class="well text-center nomargin">
			
		Please make sure you really want to disband the organization you have invested money, energy and time into.
			
		</div>
		{if $org.nrm eq 1}
			<a href="#myModaldisband" data-toggle="modal" ><button>Begin disband procedure</button></a>
			{include file="dialogs/osx_dialog_box.tpl" id="disband" title="Disband organization" content='
			<center><br/>
		   Are you sure?<br/><br/>
			<a href="{$config.url}organization/view/disband/do/sure"><button>Initiate</button></a>
			</center>
			'}
			
			{else}
			<br/>
			<button disabled class="disabled"><strong>You must first cancel the memberships of all the organization members</strong></button>
			
			{/if}
			
		</div></div></div></div>
			
		