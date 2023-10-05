<?php
$tVars['load'] = 'apply';
            
      $canApply = true;
      
      if ($oclass->organization['nrm'] >= $oclass->organization['max_nrm'])
      {
        $errors[] = 'Organization cannot accept more members at this moment.';
        $canApply = false;
      }else
      if ($oclass->organization['applications']) {
        $app = $db->where('org_id', $oclass->organization['id'])->where('user_id', $user['id'])->getOne('org_applications', 'id, content,created');
        if ($app['id'])
        {
          $canApply = false;
          $app['created'] = date_fashion($app['created']);
          $info[] = 'You are waiting for a response to your application to join.';
          $tVars['myApplication'] = $app;
        }
      } //$oclass->organization['applications']
    
      if ($canApply && $_POST) {
          if ($oclass->validate_send_app($_POST['content'], true, $user['id']))
          {
            $success[] = 'Application has been sent';
            $cardinal->redirect(URL_C);
          }
        } //$_POST && $oclass->validate_send_app($_POST)
        
   
      
      
      $tVars['can_apply'] = $canApply;