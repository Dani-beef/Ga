<?php




$page_title = 'Zones';

if (!$GET['zone'])
{

  $zones = $db->rawQuery('select z.*                   
                          from zones z');

  $tVars['zones'] = $zones;
  $tVars['display'] = 'zones/zones.tpl';
}
else
{
  $zone = $db->rawQuery('select z.*, u.username president_name, uu.username mdefence_name
                         from zones z
                         left outer join users u on z.president = u.id
                         left outer join users uu on z.min_defence = uu.id
                         where z.id = ? limit 1
                          ', array($GET['zone']));
  $zone = $zone[0];
                       
  if (!$zone['id']) $cardinal->redirect($config['url']);
  
  $zone['next_elections'] = date('d/F/Y', $zone['next_elections']);
  
  $tVars['zone'] = $zone;
  $tVars['display'] = 'zones/zone.tpl';

}