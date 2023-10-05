<?php

if ($_POST["time"])
{
  date_default_timezone_set("Europe/London");

  echo json_encode(array("time" => date("H:i", time())));
} elseif ($_GET['mobile_server_check']) 
	echo "true";
else header("Location: index.php");