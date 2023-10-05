{include file="header_home.tpl" no_sidebar=true} 

{include file="error_success.tpl"}


{$tree|displayTree}
{if 1 eq 2}
{foreach $tree as $node}
	<div class="panel panel-glass">
		<div class="panel-heading">{$node.name}</div>
	<div class="panel-body">
	{foreach $node.quests as $quest}
		<button disabled>{$quest.title}</button>
		<div style="padding:20px">
		{foreach $quest.groups as $group}
			<div class="panel panel-glass">
				<div class="panel-heading">{$group.name}</div>
					<div class="panel-body">
						
					</div>
				</div>
		{/foreach}
		</div>
	{/foreach}
	</div>
	</div>
{/foreach}
{/if}