{include file="header_home.tpl"}
{include file="servers/servers_header.tpl"}

{include file='components/resources_cost.tpl' data = $repair}


{include file="error_success.tpl"}  


<div class="alert alert-info">
Based on your repairing skill level, your <Strong>success rate</strong> for repairing this item is <strong>{$repair.successRate}%</strong>.
</div>

{if $repair.cant}
<div class="alert alert-danger">
  Not enough resources to initiate repair
</div>
{else}
<form method="post">

  <button type="submit" name="form_identifier" value="repair">
    <span class="glyphicon glyphicon-wrench"></span>
  </button>
  </form>
{/if}