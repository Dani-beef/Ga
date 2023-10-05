<div class="row">
  <div class="col-md-6">
    <h3>Received war requests</h3>
    {foreach from=$receivedRequests item=request}
    <div class="panel panel-future">
      <div class="panel-heading">
        {$request.name}
      </div>
      <div class="panel-body">
	  	<p>Received on {$request.created}.</p>
        {if $request.status eq 1}
        {if !$request.expired}
        Expires on {$request.expires}.
        {else}
        Request has expired.
        {/if}
        {elseif $request.status eq 2}
        Accepted on {$request.answer_date}.
        {elseif $request.status eq 3}
        Declined on {$request.answer_date}.
        {/if}
      </div>
  
      {if !$request.expired && $request.status eq 1}
      <form method="post" class="nomargin">
        <input type="hidden" value="{$request.request_id}" name="warRequestAnswer" />
        <div class="row">
          <div class="col-md-8">
            <input type="submit" name="accept" value="Accept" class="btn"/>
          </div>
          <div class="col-md-4">
            <input type="submit" name="decline" value="Decline" class="btn"/>
          </div>
        </div>
      </form>
      {/if} 
    </div>
    {foreachelse}
    <div class="alert alert-info">
      No war requests received
    </div>
    {/foreach}
  </div>
  <div class="col-md-6">
    <h3 class="text-right">Sent war requests</h3>
    {foreach from=$sentRequests item=request}
    <div class="panel panel-future">
      <div class="panel-heading">
        {$request.name}
      </div>
      <div class="panel-body">
	  	 
		
        {if $request.status eq 1}
		{if !$request.expired}
        Request expires on {$request.expires}.
        {else}
        Request has expired.
        {/if}       
        {elseif $request.status eq 2}
        Request accepted on {$request.answer_date}.
        {elseif $request.status eq 3}
        Request declined on {$request.answer_date}.
        {/if}
      </div>
      <div class="panel-footer text-right">
        sent on {$request.created}
      </div>
    </div>
    {foreachelse}
    <div class="alert alert-info">
      No war requests sent
    </div>
    {/foreach}
  </div>
</div>