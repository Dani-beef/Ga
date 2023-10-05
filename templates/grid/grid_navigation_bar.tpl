<form method="post">
  <input type="hidden" name="form_identifier" value="browse_grid"/>
  <div class="row mb10">


    <div class="col-sm-1 col-xs-4" title="10 nodes back">
      <a href="{$config.url}grid/show/clusters" title="Zoom out from Nodes view to Clusters view">
        <button type="button" class="button-clear"><span class="glyphicon glyphicon-zoom-out"></span></button>
      </a>
    </div>

    <div class="col-sm-1 col-xs-4" title="10 nodes back">

      <button type="submit" value="<<" name="direction" class="button-clear" {if $currentNode <= 10}disabled{/if}><span class="glyphicon glyphicon-fast-backward"></span></button>
    </div>
    <div class="col-sm-1 col-xs-4" title="1 node back">
      <button type="submit" value="<" name="direction" class="button-clear" {if $currentNode eq 1}disabled{/if}><span class="glyphicon glyphicon-backward"></span>
      </button>
    </div>

    <div class="col-sm-3 col-xs-6">
      <select name="zone" class="glass-input">
        {for $zone=1 to 6}

        <option value="{$zone}" {if $zone eq $currentZone}selected{/if}>Zone {$zone|romanic_number}</option>
        {/for}
      </select>


    </div>

    <div class="col-sm-3 col-xs-6">
        <!--
        <input type="text" class="text-center glass-input" data-no-voice name="gridCluster" value="{$currentCluster}"/>-->
        <select class="glass-input" name="gridCluster">
          {for $c=0 to 1000}
          <option value="{$c}" {if $currentCluster eq $c}selected{/if}>Cluster {$c}</option>
          {/for}
        </select>
      </div>
      <div class="col-sm-1 col-xs-4" title="Navigate to these Grid coordinates">

        <button type="submit" name="go" value="true" class="button-clear"><span class="glyphicon glyphicon-play"></span></button>
      </div>

      <div class="col-sm-1 col-xs-4" title="1 node forward">
        <button type="submit" value=">" name="direction" class="button-clear"><span class="glyphicon glyphicon-forward"></span></button>
      </div>
      <div class="col-sm-1 col-xs-4" title="10 nodes forward">
        <button type="submit" value=">>" name="direction" class="button-clear"><span class="glyphicon glyphicon-fast-forward"></span></button>
      </div>
    </form>

  </div>
  <div class="text-center">
    <small><strong>it costs {$config.gridBrowseNode} <a href="{$config.url}/pages/page/data-points">data points</a> to navigate from Cluster to Cluster and {$config.gridBrowseZone} when traversing to another Zone</strong></small>
  </div>
</form>