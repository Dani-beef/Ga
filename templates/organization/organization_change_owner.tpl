<h1 class="text-center">Change owner</h1><br/>
<form method="post">

<div class="row">
  <div class="col-md-7">
    <select name="member">
      {foreach from=$members item = member}
        <option value="{$member.id}">{$member.username}</option>
      
      {/foreach}
    </select>
  </div>
  <div class="col-md-5">
    <input type="submit" value="Make owner"/>
  </div>
</div>
</form>