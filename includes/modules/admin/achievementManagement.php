<?php

  $tVars["load"] = "achievements";
  
  if (($name = $_POST["newAchievement"]))
  {
    if (ctype_alnum(str_replace(" ","", $name)) && strlen($name) > 3 && strlen($name) <= 30)
    {
      $achievement = array("name" => $name);;
     
      $db->insert("achievements", $achievement);
      $success = "Achievement added";
    } else $errors [] = "Between 4 and 30 chars, only alph-numeric's and spaces";
  }
  elseif ($_POST["update"] && ctype_digit($aid = $_POST["achievement_id"]))
  {
    $achievement = $db->where("achievement_id", $aid)->get("achievements");
    $achievement = $achievement[0];
    
    if ($achievement["achievement_id"])
    {
      foreach ($achievement as $column => $value)
        if ($_POST[$column])
          $dataUpdate[$column] = $_POST[$column];
        
      $db->where("achievement_id", $achievement["achievement_id"])->update("achievements", $dataUpdate);
      $success = "Achievement updated";
    } else $errors[] = "Achievement not found";
  }
  
  elseif ($_POST["del"] && ctype_digit($aid = $_POST["achievement_id"]))
  {
    $db->where("achievement_id", $aid)->delete("achievements");
    $db->where("achievement_id", $aid)->delete("user_achievements");
    $success = "Achiavement deleted. Recordings of hackers earning achievement cleared.";
  }
  
  $achievements = $db->get("achievements");
  
  $tVars["achievements"] = $achievements;



$tVars["display"] = 'admin/achievements.tpl';