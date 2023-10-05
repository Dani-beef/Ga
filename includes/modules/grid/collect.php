<?php

  $attack["totalSeconds"] = $zoneDistance * 20 * 60 + 3 * 60 * $clusterDistance;
  $attack["energy"] = round(($user["maxEnergy"] / 100) * 50);
  $attack["money"] = 50 + $zoneDistance * 30 + $clusterDistance * 5;

  $attack['cant'] = $uclass->hasEnoughResources($user, $attack) ? false : true; 

  if ($_POST["start"])
    if (!there_are_errors())
    {

      initiateAttack(3, $sender, $receiver, $user['id'], false, $attack);

     
    }
    

  $tVars['display'] = 'grid/collect.tpl';

  
//}