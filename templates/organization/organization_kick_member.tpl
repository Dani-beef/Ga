		
		<div class="well nomargin text-center">
			Are you sure you want to kick <strong>{$member.username}</strong> from {$org.name}?<br/>
		</div>
		<div class="row">
		  <div class="col-md-12">
		    <div class="row-fluid">
          <div class="col-md-6 nopadding">
          <form method="post">
            <input type="hidden" name="kickMember" value="{$member.id}"/>
            <input type="submit" value="Yes" name="do"/>
          </form>
          </div>
          <div class="col-md-6 nopadding">
          <a href="{$config.url}organization/view/manageMembers"><button>No</button></a>
          </div>
        </div>
		  </div>
		</div>
			
		