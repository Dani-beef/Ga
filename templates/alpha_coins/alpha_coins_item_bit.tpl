<div class="row" id="{$item.user_premium_col}">
   {if $item.alreadyActive}
  <div class="col-md-6">
    <a data-toggle="collapse" data-parent="#accordion" title="{$item.monthly_cost} Alpha Coins / month" href="#item_{$item.item_id}_collapse">
      <button class="text-left cut-text mb10">
        {$item.name}
      </button>
    </a>  
  </div>
  <div class="col-md-3 col-xs-6">

    <button disabled><span class="glyphicon glyphicon-ok-circle"></span>  {$item.alreadyActive}</button>

  </div>
  <div class="col-md-3 col-xs-6 mb10 ">

    <button type="submit" name="addMonth" value="{$item.item_id}" {if $user.alphaCoins lt $item.monthly_cost}disabled{/if}>{$item.monthly_cost} A-C <span class="glyphicon glyphicon-plus"></span> ONE MONTH
    </button>
  </div>
  {else}
    <div class="col-md-8">
      <a data-toggle="collapse" data-parent="#accordion" title="{$item.monthly_cost} Alpha Coins / month" href="#item_{$item.item_id}_collapse">
        <button class="text-left cut-text mb10">
          {$item.name}
        </button>
      </a>  
    </div>
    <div class="col-md-4 mb10 ">
      <button type="submit" name="addMonth" value="{$item.item_id}" {if $user.alphaCoins lt $item.monthly_cost}disabled{/if}>{$item.monthly_cost} A-C <span class="glyphicon glyphicon-plus"></span> ONE MONTH</button>
    </div>

  {/if}
</div>
<div id="item_{$item.item_id}_collapse" class="panel-collapse collapse {if $GET.option eq $item.user_premium_col}in{/if} " role="tabpanel" >


  <blockquote>
    {$item.description}
  </blockquote>
</div>