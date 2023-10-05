{include file="header_home.tpl" no_sidebar=true}
{include file="grid/grid_header.tpl"}


{include file="grid/grid_attack_header.tpl" type=4}

<form method="post">
      <div class="alert alert-info">
        <strong>Only servers</strong> which run applications that improve <strong>NODE INITIALIZATION SUCCESS RATE (NISR)</strong> will contribute to this mission. If more servers are selected, their NISR gets summed up. <strong>Default NISR</strong> (without any servers added) is <strong>5%</strong>.
      </p></div>

      {if $stats}
        <input type="hidden" name="start" value="true"/>
        <input type="hidden" name="servers" value="{$servers}"/>
        <div class="row mb10">
          <div class="col-md-9">
            <button disabled>NISR Default</button>
          </div>
          <div class="col-md-3">
            <button disabled>
              {$stats.nisrDefault}%
            </button>
          </div>
        </div>
        <!--
        <div class="row">
          <div class="col-md-9">
            <button disabled>NISR by your skills</button>
          </div>
          <div class="col-md-3">
            <button disabled>
              {$stats.nisrUserSkills}%
            </button>
          </div>
        </div>
        -->
        <div class="row mb10">
          <div class="col-md-9">
            <button disabled>NISR by servers</button>
          </div>
          <div class="col-md-3">
            <button disabled>
              {$stats.nisrServersSkills}%
            </button>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <button disabled>Total NISR</button>
          </div>
          <div class="col-md-6">
            <button disabled>
              {$stats.nisrTotal}%
            </button>
          </div>
        </div>
      {else}
        {include file='grid/pick_unused_servers.tpl'}
       {/if}
      <br/>
      <div class="row">
        <div class="col-md-9">
          {if !$attack.cant}
          <button type="submit" name="initiate" value="true">
            <span class="glyphicon glyphicon-certificate"></span>
          </button>
          {else}<div class="alert alert-danger">
          Not enough resources to executed
        </div>
        {/if}
      </div>
      <div class="col-md-3">
        <a class="button text-center" href="{$config.url}grid"><span class="glyphicon glyphicon-remove"></span></a>
      </div>
    </div>
    

  </form>

