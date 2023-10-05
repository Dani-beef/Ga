{include file="header_home.tpl"}


				
		
				{include file="error_success.tpl"}
					<div class="text-center">
				  {$pages}
				</div>
	
	{if $GET.convo}
				{foreach from=$messages item=message}
				 
				 <div class="panel panel-glass">
				 <div class="panel-heading">by {$message.sender_username}</div>
				 	<div class="panel-body">
						{$message.message}
					</div>
				 </div>
			
				{/foreach}
	{else}
				{foreach from=$convos item=convo}
				 <div class="row mb10">
				 	<div class="col-xs-5">
						<a href="{$config.url}admin/view/conversations/convo/{$convo.message_id}">
							<button class="cut-text text-left">
								{$convo.title}
							</button>
						</a>
					</div>
					<div class="col-xs-2">
						<button disabled>{$convo.sender_username}</button>
					</div>
					<div class="col-xs-2">
						<button disabled>{$convo.receiver_username}</button>
					</div>
					<div class="col-xs-3">
						<button disabled>{$convo.created|date_fashion}</button>
					</div>
				 </div>
				 {foreachelse}
				 <div class="alert alert-info text-center">
				 	nothing found
				</div>
				{/foreach}
	{/if}
				<div class="text-center">
				  {$pages}
				</div>
	
		