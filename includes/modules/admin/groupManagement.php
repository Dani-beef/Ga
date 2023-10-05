<?php

	
  
  
  $groups = $db->get("groups");
  
  
  $nonPermissionColumns = array("group_id", "name", "expiration_date", "leader","maxBlogs","dailyRep");
  $ignoreColumns = array("nrMembers");
  $tVars["nonPermissionColumns"] = $nonPermissionColumns;
  $tVars["ignoreColumns"] = $ignoreColumns;
  
  if($_POST)
  {
    if ($_POST["updateID"])
    {
      foreach($groups as &$group)
        if ($group["group_id"] == $_POST["updateID"])
        {
        
          foreach ($group as $column => $value)
            if(!in_array($column, $ignoreColumns))
              if ($_POST[$column])
                $dataUpdate[$column] = in_array($column, $nonPermissionColumns) ? $_POST[$column] : 1;
              else $dataUpdate[$column] = 0;
       
            $success="Updated";
          $db->where("group_id", $group["group_id"])->update("groups", $dataUpdate);
          $group = array_merge($group, $dataUpdate);
     
          break;
        } // find group
    }
    elseif (ctype_digit($_POST["del"]))
    {
      foreach($groups as $k=>$group)
        if($group["group_id"] == $_POST["del"])
        {
          $db->where("group_id", $_POST["del"])->delete("groups");
          $db->where("group_id", $group["group_id"])->update("user_credentials", array("group_id" => $cardinal->config["defaultGroup"]));
          unset ($groups[$k]);
          
        }
    }
    elseif (isset($_POST["newGroup"]))
    {
      $db->insert("groups", array("name" => $_POST["newGroup"]));
      $groups = $db->get("groups");
    }
    
  } // update group
  
  foreach ($groups as &$group)
    $group = array_merge($group, $db->where("group_id", $group["group_id"])
                                    ->getOne("user_credentials", "count(uid) as nrMembers"));
    
  $tVars["groups"] = $groups;
  $tVars["display"] = 'admin/groups/groups.tpl';
  
