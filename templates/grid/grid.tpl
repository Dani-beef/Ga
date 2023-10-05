{include file="header_home.tpl" no_sidebar=true}
{include file="grid/grid_header.tpl"}


<style>
.grid .node
{
  background-color: rgba(7, 71, 134, 0.07);
  padding:10px;  border: 1px solid rgba(0, 85, 129, 0.18);
}

.glass-grid{

  border-left:2px solid rgba(45, 152, 236, 0.81); 
  border-right:2px solid rgba(45, 152, 236, 0.81);
  border-radius:3px;
}
.glass-grid .grid-row{
  background-color:rgba(0, 0, 0, 0.15);
  padding:21px; font-size:14px; border-bottom:1px dotted rgba(45, 152, 236, 0.31);
  -webkit-transition-property: color, border, background-color;
  -webkit-transition-duration: .3s,.3s,.3s;
  -webkit-transition-timing-function: ease-in,ease-in,ease-in;

  -moz-transition-property: color, border, background-color;
  -moz-transition-duration: .3s,.3s,.3s;
  -moz-transition-timing-function: ease-in,ease-in,ease-in;


  -o-transition-property: color, border, background-color;
  -o-transition-duration: .3s,.3s,.3s;
  -o-transition-timing-function: ease-in,ease-in,ease-in;
}
.glass-grid .grid-row:hover{
  background-color:rgba(0, 0, 0, 0.41);

}
.glass-grid .grid-row:last-child{
  border-bottom:0;
}
</style>




{include file="error_success.tpl"}


<br/>
{include file="grid/grid_navigation_bar.tpl"}

<br/>




{if $cluster.can_change_name}
<div class="panel panel-glass">
  <div class="panel-heading">(Re)name this cluster</div>
  <div class="panel-body">
    <div class="alert alert-info">
      Cluster inhabitants can change its name every 15 days.
    </div>
    <form method="post">
      <div class="row">
        <div class="col-md-9">
          <input type="text" name="name" maxlength="100" value="{$cluster.name}"/>
        </div>
        <div class="col-md-3">
          <button type="submit" name="form_identifier" value="change_cluster_name">name this cluster</button>
        </div>
      </div>
    </form>
  </div>
</div>
{/if}




<div class="row">
  <div class="col-md-10">
    <h4 style="text-transform:uppercase"><small>cluster</small> {$cluster.name}</h4>
  </div>
  <div class="col-md-2 text-right">
    <a href="{$config.url}frequently-asked-questions/open/the-grid">
      <span style="font-size:26px; " class="fa fa-question-circle"></span>
    </a>
  </div>
</div>
<div class=" glass-grid grid-container">
  {foreach from=$clusterNodes item=node}
  
      {if !$node.user_id}
        <div class=" grid-row">
          <div class="row">
            <div class="col-md-12">
              <a href="{$config.url}grid/node/{$node.node}/occupy/node" title="Occupy node">
              uninhabbited node <span class="glyphicon glyphicon-certificate"></span> initialize a node instance
              </a>
            </div>
            </div>
            </div>
        {continue}
      {/if}
   <div class=" grid-row">
    <div class="row">
      <div class="col-xs-1 text-center">
        {$node.node|romanic_number}
      </div>
      <div class="col-md-3 col-sm-4 col-xs-8">

        <a href="{$config.url}profile/hacker/{$node.username}">{$node.username}</a>
        {if $node.innactive}<small>innactive for a while</small>{/if}
      </div>
      <div class="col-md-3 col-sm-4 col-xs-3 text-center">
        <strong>{if $node.organization}
          <a href="{$config.url}organization/show/{$node.organization}">{$node.orgTag} </a>
          {/if}</strong>
        </div>
        <div class="col-md-3 col-sm-9 text-center">
          {if $node.floatingDataPoints}
          <a href="{$config.url}grid/node/{$node.node}/collect/ohyeah" title="Scavenge">
            {$node.floatingDataPoints|number_format:2} floating DP's
          </a>
          {else}
          <em>no <a href="{$config.url}frequently-asked-questions/open/floating-data-points">floating data points</a></em>
          {/if}
        </div>
        {if $node.user_id ne $user.id}
        <div class="col-md-2 col-sm-3 col-xs-12 text-center">
          <a href="{$config.url}conversations/new/emilia/to/{$node.username}" title="Send message">
            <span class="glyphicon glyphicon-envelope" ></span>
          </a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="{$config.url}grid/node/{$node.node}/spy/initiate" title="Initiate spy attempt">
            <span class="glyphicon glyphicon-eye-open"></span>
          </a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="{$config.url}grid/node/{$node.node}/attack/configure" title="Configure attack">
            <span class="glyphicon glyphicon-screenshot"></span>
          </a>
        </div>
        {/if}
      </div>
    </div>

    

    {/foreach}
  </div>
<div class="text-right">
    <h4 style="text-transform:uppercase"><small>cluster</small> {$cluster.name}</h4>
  </div>
<br/>
  {include file="grid/grid_navigation_bar.tpl"}



  {if $user.cardinal and true==false}

  <div class=" grid-container">

    <div class="grid">
      {foreach from=$clusterNodes item=node}
      <div class="node">
        {if !$node.user_id}
        <div class="well nomargin">
          EMPTY NODE
        </div>

        {else}
        <form method="post">
          <input type="hidden" name="form_identifier" value="node_action"/>
          <input type="hidden" name="node" value="{$node.node}"/>
          <div class="row ">
            <div class="col-xs-1 text-center">
              <div class="well nomargin"  >{$node.node}</div>
            </div>
            <div class="col-xs-4 ">
              <a href="{$config.url}profile/hacker/{$node.username}" class="button">
                {$node.username} {if $node.innactive}<small><em>inactive lately</em></small>{/if}
              </a>
            </div>
            
            <div class="col-xs-1 nopadding text-center">
              {if $node.organization}
              <a class="button" href="{$config.url}organization/show/{$node.organization}"  style="border-radius:50px;">{$node.orgTag}</a>
              {else}
              <button disabled style="border-radius:50px;"></button>
              {/if}
            </div>


            <div class="col-xs-4 ">
              {if $node.floatingDataPoints}
              <button type="submit" name="collect" value="true" title="Free floating Data Points scraps. Collect?">{$node.floatingDataPoints|number_format:2} floating DP's</button>
              {else}

              <div class="well  text-center nomargin">



                <em>no <a href="{$config.url}pages/page/data-points">floating points</a></em>

              </div>
              {/if}
            </div>



            {if $node.id ne $user.id}
            <div class="col-xs-1" >
              <button type="submit" value="spy" title="Spy" name="spy" ><span class="glyphicon glyphicon-eye-open"></span></button>
            </div>
            <div class="col-xs-1">
              <button type="submit" value="attack" title ="Attack" name="attack"><span class="glyphicon glyphicon-screenshot"></span></button>
            </div>

            {/if}



            
          </div>
        </form>


        {/if}
      </div>
      {/foreach}
    </div>

  </div>{/if}
