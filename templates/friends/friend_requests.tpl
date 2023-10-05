{include file="header_home.tpl"}

{include file="profile/profile_header.tpl"}


{include file="friends/friends_header.tpl"}

											
{include file="error_success.tpl"}
  
  {foreach from=$requests key=k item=r}
  <form method="post">
    <input type="hidden" name="request" value="{$r.request_id}"/>
    <div class="row mb10">
     
          <div class="col-md-4 col-xs-6">
            <div class="well black">
              {$r.sender|profile_link}
            </div>
          </div>
          <div class="col-md-4 col-xs-6">
            <div class="well black text-center">
              {$r.created}
            </div>
          </div>
          <div class="col-md-2 col-xs-6">
            <button type="submit" name="accept" value="true"><span class="glyphicon glyphicon-ok"></span></button>
            
          </div>
          <div class="col-md-2 col-xs-6">
             <button type="submit" name="decline" value="true"><span class="glyphicon glyphicon-remove"></span></button>
          </div>
      
    </div>
    </form>
     
  {foreachelse}
    <div class="well text-center">
      No friendship requests to display
    </div>
  {/foreach}
  <div class="text-center">
      
        {$pages}
      
      </div>
	
		
		
		
		