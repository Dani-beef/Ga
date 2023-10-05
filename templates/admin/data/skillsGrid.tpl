
<h3>Skills</h3>
<table class="table table-striped">
  <tr>
    {foreach from=$parameters item = parameter}
      <td>{$parameter}</td>
    {/foreach}
  </tr>
  {foreach from=$skills item = skill}
  <tr>
    {foreach from=$parameters item = parameter}
      <td>{if $skill[$parameter]|is_array}{($skill[$parameter]|array_keys)|print_r}{else}{$skill[$parameter]}{/if}</td>
    {/foreach}
  </tr>
  {/foreach}
</table>
		
<h3>Levels Experience</h3>	    
<table class="table table-striped" style="font-size:11px"> 

   <tr>
      <td>experience(skill, level)</td>
      {foreach from =$skills item = skill}
     
    
        <td class="text-center">{$skill.name}</td>
      {/foreach}
    
    </tr>
     {for $index =1 to $skills[1].level|count}
  
    <tr>
      <td>LEV {$index}</td>
      {foreach from =$skills item = skill}
     
        <td class="text-center">{$skill.level[$index].exp}</td>
      
       {/foreach}
    </tr>
 
  {/for}
</table>

<h3>Spy / level</h3>
<table class="table table-striped" style="font-size:11px"> 

   <tr>
      <td>spyProtAtt(skill, level)</td>
      
      {foreach from =$skills item = skill}
     
    
        <td class="text-center">{$skill.name}</td>
      {/foreach}
      <td class="text-center">TOTAL</td>
    </tr>
    
    {for $index =1 to $skills[1].level|count}
 
    <tr>
      <td>LEV {$index}</td>
      
         {foreach from =$skills item = skill}
        <td class="text-center">
            {if $skill.level[$index].spyProtection}
            P: {$skill.level[$index].spyProtection}<br/>
            {/if}
            {if $skill.level[$index].spyAttack}
            A: {$skill.level[$index].spyAttack}
            {/if}
        </td>
      
        {/foreach}
        <td class="text-center">P: {$spyTotal[$index].protection}<br/>A: {$spyTotal[$index].attack}</td>
    </tr>
    {/for}

 
</table>

<h3>Layers / Level</h3>
<table class="table table-striped" style="font-size:11px"> 

   <tr>
      <td>layer(skill, level)</td>
      
     {foreach from =$skills item = skill}
        <td class="text-center">{$skill.name}</td>
      {/foreach}
      <td class="text-center">TOTAL</td>
    
    </tr>
  {for $index =1 to $skills[1].level|count}
    <tr>
      <td class="text-center">LEV {$index}</td>
      {foreach from =$skills item = skill}
      
        <td class="text-center">
          {for $layer = 1 to 3}
            {if $skill.level[$index].layer[$layer]}
              <strong>L({$layer})</strong><br/>
              {if $skill.level[$index].layer[$layer].attack}
              A: {$skill.level[$index].layer[$layer].attack}<br/>
              {/if}
              {if $skill.level[$index].layer[$layer].protection}
              P: {$skill.level[$index].layer[$layer].protection}<br/>
              {/if}
            {/if}
          {/for}
        </td>
     {/foreach}
      <td class="text-center">
        {for $layer =1 to 3}
            {if $layers[$index][$layer]}
              <strong>L({$layer})</strong><br/>
              {if $layers[$index][$layer].attack}
              A: {$layers[$index][$layer].attack}<br/>
              {/if}
              {if $layers[$index][$layer].protection}
              P: {$layers[$index][$layer].protection}<br/>
              {/if}
            {/if}
          {/for}
      </td>
    </tr>
     {/for}
  
  
</table>

<h3>Rankings</h3>
<table class="table table-striped" style="font-size:11px"> 

   <tr>
      <td>rankingPoints(skill,level)</td>
      
      {foreach from =$skills item = skill}
        <td class="text-center">{$skill.name}</td>
      {/foreach}
      <td class="text-center">TOTAL</td>
    </tr>
    {for $index =1 to $skills[1].level|count}
  
    <tr>
      <td class="text-center">LEV {$index}</td>
      {foreach from =$skills item = skill}
      
        <td class="text-center">{$skill.level[$index].ranking}</td>
      
      {/foreach}
      <td class="text-center">{$rankingTotal[$index]}</td>
    </tr>
  
  {/for}
  
</table>