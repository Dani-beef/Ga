<?php
	

$cardinal->mustLogin();




if ($_SESSION["duality"])
{
  unset($_SESSION["duality"]);
  $hackerCredentials = $db->where("uid", $_SESSION['userId'])->getOne("user_credentials", "group_id");
  $_SESSION["group"]   = $cardinal->loginSystem->getUserPermissions($hackerCredentials["group_id"]);
  $cardinal->redirect(URL);
}
else


$cardinal->loginSystem->logout();
		
		
