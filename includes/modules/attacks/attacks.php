<?php



  $cardinal->mustLogin();

  if ($attack = $GET["inprogress"])
  {
	if (!$user['cardinal'])
		$db->where('(receiver_user_id = ? or sender_user_id = ?)', array($user["id"], $user["id"]));

	$db->where('(type = 2 or type = 1 or type = 4)');
	$db->where('attack_id', $attack);
	$attack = $db->getOne('attacks_inprogress');


    if (isset($attack["attack_id"]))
      $attack["remainingSeconds"] = $attack["totalSeconds"] + $attack["created"] - time();
  }
  elseif ($attack = $GET["attack"])
  {
	if (!$user['cardinal'])
		$db->where('(receiver_user_id = ? or sender_user_id = ?)', array($user["id"], $user["id"]));
	  $db->where('(type = 2 or type = 1 or type = 4)');

	//$db->join('users sender', 'sender.id = a.sender_id', 'left outer');
	//$db->join('users receiver', 'receiver.id = a.sender_id', 'left outer');
	$db->where('attack_log_id', $attack);
	$attack = $db->getOne('attack_logs a', 'a.*');


  }

  if ($attack)
  {

    if ($attack['sender_user_id'] == $user['id'])
	{
		$attack['servers'] = $attack['servers'] ? explode(",", $attack['servers']) : false;


	}

    if ($attack["report"])
    {

      $attack["report"] = unserialize($attack["report"]);


    }


    $tVars["attack"]   = $attack;
	if ($attack['type'] == 1)
	{
		$tVars['theskills'] = $theskills;
    	$tVars["display"]  = "attacks/spy.tpl";
	}
    else
		$tVars["display"]  = "attacks/attack.tpl";
  }
  else
  {
	  $db->where('(type = 2 or type = 1 or type = 4)');

    $attacks = $db->where('(receiver_user_id = ? or sender_user_id = ?)' , array($user['id'], $user['id']))->getOne('attack_logs', 'count(*) nra');

	  $pages                 = new Paginator;
      $pages->items_total    = $attacks['nra'];
      $pages->paginate();
	  $tVars['nrAttacks'] = $attacks['nra'];
    $attacks = $db->rawQuery("select attack_logs.*
                              from attack_logs
                              where (receiver_user_id=? or sender_user_id=?) and (type = 2 or type = 1 or type = 4)
                              order by created desc " . $pages->limit,
                              array($user["id"], $user["id"]));

    $tVars["attacks"] = $attacks;
    $tVars["display"]  = "attacks/attacks.tpl";
  }

?>
