{include file="header_home.tpl"}

 

<div class="row mb10">
	<div class="col-xs-4">
		<a href="{$config.url}conversations" class="button text-center">GO BACK TO EMAILS</a>
	</div>
</div>
<div class="alert alert-info">
  	<strong>It costs {$config.newMessageDataPoints|number_format} Data Points to send a new message</strong>
  </div>
  {include file="error_success.tpl"}
<form method="post">
  <div class="row">
    <div class="col-md-6">
    <input type="text" maxlength="50" name="title" placeholder="Title" value="{$smarty.post.title}"/>
    </div>
    <div class="col-md-6">
          <input type="text" maxlength="70" name="username" placeholder="Username" value="{if $smarty.post.username}{$smarty.post.username}{else}{$GET.to}{/if}"/>
  </div>
  </div>
 <br/>
    <textarea name="message" style="min-height:400px" maxlength="4000">{$smarty.post.message}</textarea>
<hr/>
  
  <button type="submit"><span class="glyphicon glyphicon-send"></span></button>
  </form>
  
