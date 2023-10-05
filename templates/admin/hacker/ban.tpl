
{if $credentials.banned}
  <form method="post" class="mb10">
    <input type="submit" value="UNBAN" name="unban"/>
  </form>
{/if}

<form method="post">
  <div class="row mb10">
    <div class="col-md-12">
      <div class="row-fluid">
        <div class="col-md-2 nopadding">
          <select name="day">
            {for $day = 1 to 31}
              <option value="{$day}">{$day}</option>
            {/for}
          </select>
        </div>
        <div class="col-md-2 nopadding"> 
          <select name="month">
            {foreach from=$months item=month}
              <option value="{$month}">{$month}</option>
            {/foreach}
          </select>
        </div>
        <div class="col-md-2 nopadding">
          <select name="year">
            {for $year = 'Y'|date to 'Y'|date + 20}
              <option value="{$year}">{$year}</option>
            {/for}
          </select>
        </div>
        
        <div class="col-md-4 nopadding">
          <input type="text" name="reason" placeholder="Reason" required/>
        </div>
        
        <div class="col-md-2 nopadding">
          <button type="submit">Ban</button>
        </div>
      </div>
    </div>
  </div>
</form>
{foreach from=$bans item=ban}
  <div class="row mb10">
    <div class="col-md-12">
      <div class="row-fluid">
    
        <div class="col-md-4 nopadding">
          <div class="button">
            {$ban.reason}
          </div>
        </div>
        
        <div class="col-md-3">
          <div class="well black text-center">
             {$ban.created}
          </div>
        </div>
        <div class="col-md-2 ">
          <div class="well black text-center ">
             {$ban.expires}
          </div>
        </div>
        <div class="col-md-3 nopadding">
          <div class="well black text-center">
            by {$ban.by_username}
          </div>
        </div>
        
         
        
      </div>
    </div>
  </div>
{foreachelse}
  <div class="well text-center">
    No bans
  </div>
{/foreach}