<br/>
<div class="text-center" >
  <h3><strong>FROM</strong> Z{$userNode.zone_id} | CLUSTER {$userNode.cluster} | NODE {$userNode.node}</h3>
  <h1 style="font-size:150px;line-height: 110px;"> 
    {if $type eq 4}
      <span class="glyphicon glyphicon-certificate"></span>
    {elseif $type eq 3}
      <span class="glyphicon glyphicon-trash"></span>

     {elseif $type eq 2}
      <span class="glyphicon glyphicon-screenshot"></span>
       {elseif $type eq 1}
      <span class="glyphicon glyphicon-eye-open"></span>
    {/if}
  </h1>

  
  <h3><Strong>TO</strong> Z{$node.zone_id} | CLUSTER {$node.cluster} | NODE {$node.node}</h3>

</div>
<br/>
{include file="error_success.tpl"}

{include file='components/resources_cost.tpl' data = $attack}
  <br/>