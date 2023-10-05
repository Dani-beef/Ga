{include file="header_home.tpl"}

{include file="error_success.tpl"}

{if $GET.hacker}
<div class="row mb10">
	<div class="col-xs-4">
		<a href="{$config.url}admin/view/hacker/hid/{$GET.hacker}"><button>BACK TO USER</button></a>
	</div>
</div>
{/if}
<div class="text-center">
{$pages}</div>
<div id="accordion" role="tablist" aria-multiselectable="true">

  
{foreach $tasks as $task}


<div class="row">


   
   <div class="col-xs-4">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse_{$task.id}" aria-expanded="true" aria-controls="collapse_{$task.id}">
         <button class="mb10 text-left cut-texts">[{$task.type}] {$task.name}</button>
		 
        </a>
		</div>
		<div class="col-xs-2">
			<a href="{$config.url}profile/hacker/{$task.processed.username}" target="_blank"><button>{$task.processed.username}</button></a>
		</div>
		<div class="col-xs-2">
			<button disabled>
				{$task.processed.start}
			</button>
		</div>
		<div class="col-xs-2">
			<button disabled>
				{$task.processed.duration}
			</button>
		</div>
		<div class="col-xs-2">
			<button disabled>
				{if $task.processed.log_created}
				{$task.processed.log_created}
				{else}no log{/if}
			</button>
		</div>
      </div>

    <div id="collapse_{$task.id}" class="panel-collapse collapse mb10" role="tabpanel" aria-labelledby="collapse_{$task.id}">
		<div style="padding:20px"><form method="post">
			<div class="panel panel-glass">
				<div class="panel-heading">
					Update
				</div>
				<div class="panel-body">
					<div class="row">
					{foreach $task as $col => $value}
						{if $col != 'processed' && $col != 'data'}
							<div class="col-xs-4">
								<input type="text" class="mb10" name="{$col}" value="{$value|htmlentities}" placeholder="{$col}"/>
							</div>
						{/if}
						
					{/foreach}
					</div>
					<textarea name="data">{$task.data}</textarea>
					
					
				</div>
				<button type="submit" name="update" value="true"><span class=""></span></button>
			</div></form>
			<div class="panel panel-glass">
				<div class="panel-heading">
					Task Data
				</div>
				<div class="panel-body" style="white-space:pre;word-break: break-all;word-wrap: break-word;">{$task.processed.data|var_export:true}</div>
			</div>
		</div>
     
    </div>
  


{foreachelse}
<div class="alert alert-info text-center">
no tasks to display
</div>
{/foreach}
</div>
<div class="text-center">
{$pages}</div>