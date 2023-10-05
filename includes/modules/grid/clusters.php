<?php

$clustersPerPage = 30;

$pages                 = new Paginator;
$pages->items_per_page = $clustersPerPage;
  $pages->items_total    = configs('gridClustersPerZone');
  $pages->paginate();

  $clusterStartIndex = $pages->low;
  $clusterEndIndex = $pages->low + $clustersPerPage;
  $clusterEndIndex = $clusterEndIndex > configs('gridClustersPerZone') ? configs('gridClustersPerZone') : $clusterEndIndex;

$clusters = $db->rawQuery('select zgc.*, (select count(*) from zone_grid_cluster_nodes zgcn 
                                          where zgcn.zone_id = zgc.zone_id and zgc.cluster = zgcn.cluster) nrn
          from zone_grid_clusters zgc 
                where zone_id = ? 
               and cluster between ? and ?',
               array($currentZone, $clusterStartIndex, $clusterEndIndex));

$clusters_data = array();

for ($cluster_index = $clusterStartIndex; $cluster_index < $clusterEndIndex; $cluster_index++)
  $clusters_data[$cluster_index] = array();

foreach ($clusters as $cluster)
  $clusters_data[$cluster['cluster']] = $cluster;


$tVars['clusters'] = $clusters_data;
$tVars['display'] = 'grid/clusters.tpl';