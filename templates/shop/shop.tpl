{include file="header_home.tpl"}


{if $load eq "pick_server"}
	<form method="post">
	<select name="server">
		{foreach from = $servers item = server}
			<option value="{$server.server_id}">{$server.hostname} - {$server.ip}</option>
		{foreachelse}
			<option>No server available</option>
		{/foreach}
	</select>
	<br/>
	<button type="submit" name="buy" value="{$smarty.post.buy}">Select server</button>
	</form>
{else}



<div class="futureNav middle ">
       <ul>
          <li><a href="{$config.url}shop">Hardware</a></li>
          <li><a href="{$config.url}shop/software/go">Software</a></li>
        </ul>
        
      </div>

<div class="text-center ">
	<h1  style="font-size:130px"><span class="glyphicon glyphicon-shopping-cart"></span></h1>
</div>


	  <div class="well">
	This public shop contains only low to medium quality server components and software. Advanced ones can be gained only through inolvement in the competition.
</div>
	  
	  <br/>
<div class="row">
{if $GET.software}
	<div class="col-sm-3 mb10">
		<a href="{$config.url}shop/software/show/filter/skill" class="button text-center">SKILL AMPLIFIERs</a>
	</div>
	<div class="col-sm-3 mb10">
		<a href="{$config.url}shop/software/show/filter/grid" class="button text-center">GRID MANIPULATORs</a>
	</div>
{else}

	<div class="col-sm-2 mb10">
		<a href="{$config.url}shop/filter/cpu" class="button text-center">CPUs</a>
	</div>
	<div class="col-sm-2 mb10">
		<a href="{$config.url}shop/filter/board" class="button text-center">BOARDs</a>
	</div>
	<div class="col-sm-2 mb10">
		<a href="{$config.url}shop/filter/case" class="button text-center">CASEs</a>
	</div>
	<div class="col-sm-2 mb10">
		<a href="{$config.url}shop/filter/source" class="button text-center">SOURCEs</a>
	</div>
	<div class="col-sm-2 mb10">
		<a href="{$config.url}shop/filter/ram" class="button text-center">RAMs</a>
	</div>
	<div class="col-sm-2 mb10">
		<a href="{$config.url}shop/filter/hdd" class="button text-center">HDDs</a>
	</div>


{/if}
</div>
<br/>
{include file="error_success.tpl"}	

<form method="post">
<div class="row">
{foreach from = $items item = item}
	{if $GET.filter eq 'skill' and $item.skill_id eq 15}
		{continue}
	{elseif $GET.filter eq 'grid' and $item.skill_id ne 15}
		{continue}
	{elseif $GET.filter eq 'cpu' and $item.type ne 1}
		{continue}
	{elseif $GET.filter eq 'board' and $item.type ne 2}
		{continue}
	{elseif $GET.filter eq 'case' and $item.type ne 3}
		{continue}
	{elseif $GET.filter eq 'source' and $item.type ne 4}
		{continue}
	{elseif $GET.filter eq 'ram' and $item.type ne 5}
		{continue}
	{elseif $GET.filter eq 'hdd' and $item.type ne 6}
		{continue}
	{/if}
	<div class="col-md-6">
		<div class = "panel panel-glass">
			<div class="panel-heading">
				{$item.name}
			</div>
			<div class="panel-body">
				
				{include file="storage/item_description.tpl"}
				
				
				
			</div>
			<button {if $item.price > $user.money}disabled{/if} type="submit" name="buy" value="{$item.item_id}">BUY FOR {$item.price}$</button>

		</div>
		
	</div>
{/foreach}
</div>
</form>

{/if}