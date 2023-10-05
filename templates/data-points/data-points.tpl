{include file="header_home.tpl" no_sidebar = true page_title="Data Points"}



{include file="error_success.tpl"}  


{if $logged} <br/>
<div class="panel panel-glass">
  <div class="panel-heading">Your Data Points Production Rate</div>
  <div class="panel-body">
    <div class="row">
      <div class="col-xs-3">
        <button disabled>{$user.dataPointsPerHour|number_format:2} / hour</button>
      </div>
      <div class="col-xs-4">
        <a href="{$config.url}alpha_coins/option/extraDataPoints15">
        <button>
      
  {if $smarty.session.premium.extraDataPoints15}
      {assign var= bonus value=round(($user['dataPointsPerHour'] / 100) * 15, 2) }
    
        + 15% [{$bonus|number_format:2}] (Mining Consultant)
    
  {else}
    + 0% bonus [hire a Data Points Consultant]
  {/if}
  
        </button>
        </a>
      </div>
      <div class="col-xs-5">
        <button disabled>Final Prod. Rate: {($user.dataPointsPerHour + $bonus)|number_format:2} / hour</button>
      </div>
      
    </div>
  </div>
</div>

{/if}

<div class="text-center">
  <img src="{$config.url}layout/img/dataPoint.png" style="width:20%"/>
</div><br/>

<div class="row">
  <div class="col-md-6 logo-container">
    
    
    <div class="panel panel-glass mb10">
      <div class="panel-body">
        <p>
          <strong>Data Points / Data Coins</strong> are resources to be <strong>mined (obtained)</strong> using <strong>servers</strong> (which earn you <strong>10 DP/hour each</strong> by default) on which you can install additional <strong>software and hardware</strong> to help you <strong>mine faster</strong>.
        </p>
        There are a couple more ways of collecting Data Points, such as browsing <strong><a href="{$config.url}grid">the Grid</a> for lost floating Data Points</strong> (reminiscences of past battles between mighty hackers) or by initiating Grid Attacks on other competitors.
      </div>
    </div>
    
    <div class="panel panel-glass ">
      <div class="panel-body">
        <p>If one were to give a short description of the Data Coins or Data Points, it would resume to <strong>the building blocks of the Grid</strong>.</p>
        <p>Companies around the glove and even Alpha themselves have adopted this system thanks to earlier successful pre-World War III implementations.</p>
        <p>Some of you might remember the controversial <a href="http://en.wikipedia.org/wiki/Bitcoin" target="_blank" rel="nofollow">Bit Coin decentralised virtual currency</a> which has slowly but steadily increased its value to rival real monetary markets through its independent nature.
        </p>
        Being used mostly by hackers and becoming ever more popular after the <strong>competition</strong> has started, Alpha is unsatisfied with the anonymity of Data Points earnings and transactions and constantly researches way to track them.
      </div>
    </div>

  </div>
  <div class="col-md-6">
    
    <div class="panel panel-white panel-white-card">
      <div class="panel-body">
        <h2 class="white-holder">SPIN THE DATA POINTS</h2>
        <small>
        <p>
        {$spin1SuccessRate}% chances to win one of the following components/software (some of which are not available in the shop)
        </p>
        <strong>
          {$spin1apps}<br/>
          {$spin1comps}</strong><br/>
         
        
       The cost is adjusted by the Grid-aware Cardinal System</small>
      </div>
      <form method="post">
        <button type="submit" {if $user.dataPoints<$spin1Costs || !$logged}disabled{/if} class="button-white" name="form_identifier" value="spin1">
          Spin for {$spin1Costs|number_format} Data Points
        </button>
      </form>
    </div>
    
  </div>
</div>
