{include file="organization/members_header.tpl"}

{foreach from=$members key=memberKey item=member}
<form method="post" action="#">
<div class="row">
	<div class="col-md-12">
		<div class="row-fluid">
			<div class="col-md-{if !$member.owner}5{else}7{/if} nopadding">
				<div class="well nomargin">
					 {$member.username|profile_link}
				</div>
			</div>
			<div class="col-md-5 ">
				{if !$member.owner}
					<select name="rank">
					  {foreach from=$ranks key=rankKey item=rank}
						  <option value="{$rank.rank_id}" {if $rank.rank_id eq $member.org_group}selected{/if}>{$rank.name}</option>

					  {/foreach}
					</select>
				{else}
				<button disabled>{$member.name}</button>
				{/if}
			</div>
			{if !$member.owner}
			<div class="col-md-1 nopadding">
			  	<button type="submit" title="Save" name="member" value="{$member.id}"><span class="glyphicon glyphicon-floppy-save"></span></button>
							
			</div>
			
			<div class="col-md-1 nopadding">
				 
          
				<button type="submit" title="Kick out of organization" name="kickMember" value="{$member.id}"><span class="glyphicon glyphicon-remove-sign"></span></button>

				 
			</div>
			{/if}
		</div>
	</div>
</div>
</form>
<br/>
{/foreach}

<div class="text-center">
      {$pages}
      </div>