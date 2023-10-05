<?php


$item = new Item();

if(GET('storage'))
{
  $item->loadFromStorage(GET('storage'), $user['id']);
}
elseif(GET('server_app'))
{
  $item->loadFromServerApps(GET('server_app'), $user['id']);
}

if (!$item->isDamaged() || $item->isRunning()) $cardinal->redirect(URL);

$repair['money'] = 10;
$repair['energy'] = 1;
$repair['dataPoints'] = 30;
$repair['totalSeconds'] = 15 * 60;

foreach($repair as $f => $v)
  $repair[$f] += $repair[$f] * $item->data['repair_coefficient'] * $item->data['damage'];

$repair["cant"] = $uclass->hasEnoughResources($user, $repair) ? false : true;
if (!$uclass->canDoTask()) $repair["cant"] = true;


// compute if item is going to be repaired

$skillForRepair = $item->isApp() ? 14 : 13;
$skill = $uclass->getUserSkill($user['id'], $skillForRepair);

$requiredLevelForTotalSuccessForBaseCoefficient = 4;
$requiredLevelForTotalSuccess = ceil($requiredLevelForTotalSuccessForBaseCoefficient * $item->data['repair_coefficient'] );

$repair['successRate'] = round($skill['level'] / ($requiredLevelForTotalSuccess / 100), 2);
$repair['successRate'] = $repair['successRate'] >= 100 ? 100 : $repair['successRate'];

if (!$repair['cant'] && submitted_form('repair'))
{
  $repaired = rand(1,100) <= $repair['successRate'] ? true : false;
  if ($repaired)
  {
    $item->data['damage'] = 0;
  }

  $task = $item->getItemBasicData();

  $task['repaired'] = $repaired;

  $taskclass->add_task_session($user["id"], 3, $repair['totalSeconds'], $task, false, "Repairing " . $item->data['name']);
  
  $item->removeFromStorage();
  $item->removeFromServer();

  add_alert("Attempting to repair item", "success");
  $uclass->substractResources($repair, $user['id']);
  $cardinal->redirect(URL);
}

$tVars['repair'] = $repair;
$tVars['item'] = $item->data;
$tVars['display'] = 'repair/repair.tpl';

