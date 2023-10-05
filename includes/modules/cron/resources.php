<?php

$insertLogs = false;

$report = 'Rankings Cron '.date('d/F/Y H:i:s', $runTime);



$db->join("user_premium up", "up.user_id = users.id", "left outer");
  
if ($GET['all'])
	$users = $db->where(" ? >=lastActive", array(time() - 5 * 60))->where("server is not null")->get("users", null, "users.id, lastResUpdate, dataPoints, lifelongDataPoints, dataPointsPerHour, up.extraDataPoints15");
else
	$users = $db->where(" ? < lastActive", array(time() - 5 * 60))->where("server is not null")->get("users", null, "users.id, lastResUpdate, dataPoints, lifelongDataPoints, dataPointsPerHour, up.extraDataPoints15");

foreach ($users as $user)
{
	$dataPointsPerHour = $user['dataPointsPerHour'];
	if ($user['extraDataPoints15'] > time())
    {
		$bonusPercent = 15;
		$bonus = round(($dataPointsPerHour / 100) * $bonusPercent, 2);
		$$dataPointsPerHour += $bonus;
	}
	
	$dataPointsPerMinute = ($dataPointsPerHour / 60) * ((time() - $user['lastResUpdate']) / 60);
	
	
	$dataPointsGive = round($dataPointsPerMinute, 2);
	
	if ($dataPointsGive)
	{
		$string .= " when " . $user['id'] . " then ". $dataPointsGive;
		
		
	}
}

if ($string)
$db->rawQuery("update users set dataPoints = dataPoints + (case id " . $string . " else 0 end), 
               lifelongDataPoints = lifelongDataPoints + (case id " . $string . " else 0 end), lastResUpdate = ?", array(time()));

$report .= "Updates accounts";
$finish = array_sum(explode(' ', microtime()));
$report .= '\nGeneration time: '.  round(($finish - $cardinal->page_start), 6);

echo nl2br($report);
