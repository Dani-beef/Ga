<?php
$page_title = 'Home';

/* HACKDOWN */
if (date('w') == 6)
{
$lastSaturday = strtotime("this Saturday");

$hackDownId = $lastSaturday;
$lastSaturdayEnd = $lastSaturday + 24*60*60;

$tVars['hackdownRemaining'] = $lastSaturdayEnd - time();
}
else
{
	$hackDownId = strtotime("last Saturday");
	$tVars['nextSaturdayRemaining'] = strtotime("Saturday") - time();
}




if (!$cardinal->loginSystem->logged) {
  require('visitor.php');
} //!$cardinal->loginSystem->logged



if ($cardinal->loginSystem->logged) {
	require("player.php");
} //$cardinal->loginSystem->logged
