<?php

  $check = $db->rawQuery('select qu.id, qf.feedback_id, q.title, q.id quest_id
	                        from quests_user qu 
	                        left outer join quests_feedback qf on qf.quest_user_id = qu.id
							left outer join quests q on q.id = qu.quest
							where qu.user_id = ? and qu.id = ? and qf.feedback_id is null', array(
    $user['id'],
    $GET['feedback']
  ));
  $check = $check[0];
  if ($check["id"]) {
    if ($_POST) {
      $data['feedback'] = $_POST['feedback'];
      if (strlen($data['feedback']) > 2000)
        $errors[] = "Feedback must contain under 2000 characters";
      
      if (!count($errors)) {
        $data['time_rating']       = $_POST['time_rating'] >= 0 && $_POST['time_rating'] <= 10 ? $_POST['time_rating'] : 0;
        $data['difficulty_rating'] = $_POST['difficulty_rating'] >= 0 && $_POST['difficulty_rating'] <= 10 ? $_POST['difficulty_rating'] : 0;
        $data['replay_rating']     = $_POST['replay_rating'] >= 0 && $_POST['replay_rating'] <= 10 ? $_POST['replay_rating'] : 0;
        $data['quest_user_id']     = $check['id'];
        $data['created']           = time();
        $data['user_id']		   = $user['id'];
		$data['quest_id']          = $check['quest_id'];
        if ($db->insert('quests_feedback', $data)) {
          $_SESSION['success'] = "We are grateful for your feedback.";
          $cardinal->redirect(URL . "quests");
        } //$db->insert('quests_feedback', $data)
        else
          $errors = "Feedback error. Feedback not sent.";
      } //!count($errors)
    } //$_POST
    $tVars['feedback'] = $check;
    $tVars['display']  = "quests/quest_feedback.tpl";
  } //$check["id"]
  else
    $cardinal->redirect(URL . "quests");