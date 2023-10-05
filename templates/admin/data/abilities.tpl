{include file="header_home.tpl" no_sidebar="true"}

{include "admin/data/data_header.tpl"}
<h3>Total (super-over-estimated) skills up to ab. level {$GET.toLevel} | user lvl {$GET.userLevel}</h3>
<table class="table table-striped" style="font-size:11px"> 
  <tr>
    {foreach from=$theskills key = skill item = data}
      <td>{$data.name}</td>
    {/foreach}
  </tr>
  <tr>
    {foreach from=$theskills key = skill item = data}
      {assign var = found value = 0}
       {foreach from=$totalSkills key = tSkill item = amount}
        {if $tSkill eq $skill}
        {assign var = found value = 1}
        <td>{$amount|number_format}</td>
        {/if}
       {/foreach}
       {if !$found}
       <td></td>
       {/if}
    {/foreach}
   
  </tr>

</table>
<h3>Some money fucked-up approximation: {$totalMoney|number_format} $$$</h3>
{if 1 eq 2}
				 <div class="">
			    
			    <table class="table table-bordered" style="font-size:11px"> 
			    
			      <tr>
			        <td>skills</br>lev</td>
			        {foreach from=$skills key=skillId item=skill}
			          <td>
			            [{$skillId}]<br/>
			            {$skill.name}
			          </td>
			        {/foreach}
			        <td>en</td>
			        <td></td>
			      </tr>
			      {foreach from=$abilities key=abilityKey item=ability}
			      <tr>
			        <td colspan="100%">{$ability.name} - {if $ability.level}Level {$ability.level}{else}No level restriction{/if}</td>
			      </tr>
			      {foreach from=$ability.levels key=levelKey item=level}
			        <tr>
			          <td>{$levelKey}</td>
			          {foreach from=$skills key=skillId item=skill}
			            <td>{$level.skills[$skillId]}</td>
			          {/foreach}
			          <td>{$level.energy}</td>
			          <td>{$level.price}$</td>
			          <td>{$level.time|sec2hms}</td>
			        </tr>
			      {/foreach}
			      {/foreach}
			      <tr>
			        <td><strong>TOTAL</strong></td>
			        {foreach from=$skills key=skillId item=skill}
			          <td>
			            {$skillsTotal[$skillId]}
			          </td>
			        {/foreach} <td></td><td></td><td>{$timeTotal|sec2hms}</td>
			      </tr>
			       <tr>
			        <td></td>
			        {foreach from=$skills key=skillId item=skill}
			          <td>
			            [{$skillId}]<br/>
			            {$skill.name}
			          </td>
			        {/foreach}
			        <td></td><td></td><td></td>
			      </tr>
			    </table>

			   </div>
	{/if}		  
				
	
		