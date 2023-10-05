<?php


$tVars["theskills"]=$theskills;
if (ctype_alnum( $_POST["level_id"]))
{
  if ($_POST["addLevel"])
  {
    $db->insert("level_rewards", array("level_id"=> $_POST["level_id"]));
    $success [] = "New level reward created";
  }
  if($_POST["deleteLevel"])
  {
    $db->where("level_id", $_POST["level_id"])->delete("level_rewards");
    $success[] = "Deleted";
  }
  if ($_POST["updateLevel"])
  {
    $updateData = array(
      "achievement_id" => $_POST["achievement_id"],
      "money" => $_POST["money"],
      "skillPoints" => $_POST["skillPoints"],
    );


      $db->where("level_id", $_POST["level_id"])->update("level_rewards", $updateData);
      $success [] = "Updated";

  }

} // templateid


$levelRewards = $db->join("achievements ach", "ach.achievement_id = lr.achievement_id", "LEFT OUTER")->orderBy("level_id", "asc")->get("level_rewards lr", null,"lr.level_id, lr.money,lr.achievement_id, lr.skillPoints,ach.name achievement");



$tVars["achievements"] = $db->get("achievements");
$tVars["levelRewards"] = $levelRewards;
$tVars["display"] = "admin/levelRewards.tpl";
