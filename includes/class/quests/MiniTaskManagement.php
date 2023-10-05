<?php
/****************************************************
 *
 *  MINI TASK MANAGEMENT
 *
 ***************************************************/

trait MiniTaskManagement
{
  // Adds a new minitask with predefined parameters
  function addMinitask($type, $title, $takes, $taskData)
  {
    $this->questData['task']['type']  = $type;
    $this->questData['task']['title'] = $title;
    if ($this->questData['task']['totalSeconds']) {
      $this->questData['task']['start'] =
        $this->questData['task']['start'] + $this->questData['task']['totalSeconds'];

      $doMinitask = true;
    } //$this->questData['task']['totalSeconds']
    else
      $this->questData['task']['start'] = time();

    $this->questData['task']['totalSeconds'] = $takes;
    $this->questData['task']                 = array_merge($taskData, $this->questData['task']);

    if ($doMinitask){
      $this->taskclass->process_task_general($this->questData['task']);
      $this->minitask();
    }

    $this->update_quest();
  } // add addMinitask

  function minitask()
  {
    if ($this->questData['task']['remainingSeconds'] <= 0) {

      $this->jsonOutput['taskCompleted'] = true;
      switch ($this->questData['task']['type']) {
        case 'port_crack':
          $this->portCrackTask();
          break;
        case 'host_ping':
          $this->pingTask();
          break;
        case 'nmap':
          $ip                  = $this->questData['task']['ip'];
          $this->consoleOutput = 'Scan report for ' . $ip . ' (' . $this->questData['hosts'][$ip]['hostname'] . ')<br/>';
          foreach ($this->questData['hosts'][$ip]['services'] as $port => $service)
            $this->consoleOutput .= strtoupper($service['type']) . ' running on port ' . $port . ' ' . ($service['encrypted'] ? '[protection]' : '') . '<br/>';


          $this->consoleOutput .= count($this->questData['hosts'][$ip]['services']) . ' discovered';
          $this->voice = 'command_done';
          $this->completedObjective('nmap', $ip);

          $this->increaseTraceBy(5, true, $ip);

          break;
        case 'port_connect':
          $ip              = $this->questData['task']['ip'];
          $port            = $this->questData['task']['port'];
          $this->connected = array(
            'ip' => $ip,
            'port' => $port
          );
          $welcome         = $this->db->where('service_id', $this->questData['hosts'][$ip]['services'][$port]['service_id'])->getOne('quest_services', 'welcome');

          $this->increaseTraceBy(5, true, $ip);
          $this->voice = 'accessgranted';
          $this->consoleOutput = '<strong>' . $this->questData['hosts'][$ip]['hostname'] . ' RESPONSE: Access granted ' . $this->user['username'] . '@' . $ip . ':' . $port . '</strong><br/>';
          $this->parseQSyntaxRecursively($welcome['welcome']);

          $parser = new \JBBCode\Parser();
       		$parser->addCodeDefinitionSet(new \JBBCode\DefaultCodeDefinitionSet());
       		$parser->parse($welcome['welcome']);

          $this->consoleOutput .= $parser->getAsHtml();
          $this->completedObjective('connect', $ip . ':' . $port);
          break;
        case 'encryption_key':
          $reduction           = $this->questData['task']['timeReduction'];
          $file                = $this->service['files'][$this->questData['task']['fileKey']];
          $this->consoleOutput = 'Encryption properties identified. Decrypting... ' . ' (' . sec2hms($reduction) . ' time reduction by skills)';;

          $takes    = ($file['encryption'] * 3);
		  $takes   -= $reduction;
          $keepTask = true;

          $taskData = array(
            'fileKey' => $this->questData['task']['fileKey']
          );
          $this->addMinitask('decrypt_file', 'Decrypting ' . $file['title'], $takes, $taskData);

          break;
        case 'decrypt_file':

          $file =& $this->service['files'][$this->questData['task']['fileKey']];
          $this->consoleOutput = 'Decrypted file ' . $file['title'];
          $this->completedObjective('decrypt_file', $file['title']);
          unset($file['encryption']);
          $this->voice = 'command_done';
          break;
		case 'run_file':

          $file = $this->service['files'][$this->questData['task']['fileKey']];
          $this->executeFile($file);
          break;
        case 'host_delete_logs':
          $connectedHost = $this->connected['ip'];

          $this->completedObjective('delete_logs', $connectedHost.":".$this->connected['port']);

          $reduceTraceBy = intval(($this->questData['hosts'][$connectedHost]['trace'] / 100) * 80);

          $this->jsonOutput['traceReduce'] = $reduceTraceBy;

          $this->questData['trace'] = $this->questData['trace'] - $reduceTraceBy;
          $this->questData['trace'] = $this->questData['trace'] < 0 ? 0 : $this->questData['trace'];

          $this->questData['hosts'][$connectedHost]['trace'] = 0;

          //$this->questData['hosts'][$connectedHost]['logs_deleted'] = true;
          $this->consoleOutput                                      = 'Trace reduced by ' . $reduceTraceBy . '%';
          $this->voice = 'command_done';
          $this->jsonOutput['trace'] = $this->questData['trace'];

          break;
        case 'transfer':
          $this->transferTask();

          break;
        case 'read_email':
          $email = $this->service['emails'][$this->questData['task']['emailKey']];

          $content = $this->db->where('file_id', $email['file_id'])->getOne('quest_files', 'content');
          $this->parseQSyntaxRecursively($content['content']);

          $parser = new \JBBCode\Parser();
          $parser->addCodeDefinitionSet(new \JBBCode\DefaultCodeDefinitionSet());
          $parser->parse($content['content']);

          $this->consoleOutput = $email['title'] . '<br/>--------------<br/>' . $parser->getAsHtml();

          $this->completedObjective('read_email', $this->questData['task']['emailKey'] . '|' . $this->connected['ip'] . ':' . $this->connected['port']);
          break;
        case 'delete_email':
          unset($this->service['emails'][$this->questData['task']['emailKey']]);

          $this->consoleOutput = 'Email erased';
          $this->voice = 'command_done';
          $this->completedObjective('delete_email', $this->questData['task']['emailKey'] . '|' . $this->connected['ip'] . ':' . $this->connected['port']);
          break;
        case 'forward_email':

          $userEmail = $this->user['username'] . $this->userGameEmail;

          $this->consoleOutput = 'Email forwarded to ' . ($toEmail = $this->questData['task']['toEmail']);

          $email =& $this->service['emails'][$this->questData['task']['emailKey']];



          if ($toEmail == strtolower($userEmail)) {
            $toEmail = $userEmail;
            if (!$email['fowardedToUser']) {
              $content                  = $this->db->where('file_id', $email['file_id'])->getOne('quest_files', 'content');
              $email['forwardedToUser'] = true;
              $content['content']       = 'EMAIL FORWARD: ' . $content['content'];
              $this->uclass->send_msg(-1, $this->user['id'], $content['content']);
            } //!$email['fowardedToUser']

          } //$toEmail == $this->user['username'] . $this->userGameEmail

          $this->completedObjective('forward_email', $this->questData['task']['emailKey'] . '|' . $toEmail . '|' . $this->connected['ip'] . ':' . $this->connected['port']);
          break;

        case 'ddos':
          // compute success rate?
          $failed = false;
          //

          $ip = $this->questData['task']['ip'];
          $port = $this->questData['task']['port'];
          $this->increaseTraceBy(15, true, $ip);
          if (!$failed)
          {
            unset($this->questData['hosts'][$ip]['services'][$port]);

            $this->consoleOutput = 'Service ' . $ip . ':' . $port . ' crashed';

            $this->completedObjective('crash_service', $ip . ':' . $port);
          }
          break;
        case 'sql_delete':
          $tableKey     = $this->questData['task']['tableKey'];
          $column       = $this->questData['task']['column'];
          $value        = $this->questData['task']['value'];
          $rowsToDelete = $this->questData['task']['rowsToDelete'];

          $objective = $this->service['tables'][$tableKey]['title'] . '|' . implode(',', $rowsToDelete);
          $objective .= '|' . $this->connected['ip'] . ':' . $this->connected['port'];
          $this->completedObjective('sql_delete', $objective);
          if(count($rowsToDelete))
          {
          foreach ($rowsToDelete as $row)
            unset($this->service['tables'][$tableKey]['content'][$row]);


          $this->increaseTraceBy(4, true, $this->connected['ip']);
          }
          $this->voice = 'command_done';
          $this->consoleOutput = count($rowsToDelete) . ' rows deleted from table ' . $this->service['tables'][$tableKey]['title'];

          break;
		case 'sql_drop':
          $tableKey     = $this->questData['task']['tableKey'];

          $objective = $this->service['tables'][$tableKey]['title']."|".$this->connected['ip'] . ':' . $this->connected['port'];;
          $this->completedObjective('sql_drop', $objective);


          $this->increaseTraceBy(15, true, $this->connected['ip']);

          $this->voice = 'command_done';
          $this->consoleOutput = $this->service['tables'][$tableKey]['title'] . " dropped";
          unset($this->service['tables'][$tableKey]);

          break;
        default:
          $this->consoleOutput = 'Some weird thing happened with a task. Please report to Cardinal Administrators.';
      } //$this->questData['task']['type']

      if (!$keepTask)
        unset($this->questData['task']);
      $this->update_quest();
    } //$this->questData['task']['remainingSeconds'] <= 0

  }

  /*
   * Process port cracking task
   */
  function portCrackTask()
  {
    $port = $this->questData['task']['port'];
    $ip   = $this->questData['task']['ip'];

    $this->increaseTraceBy(6, true, $ip);

    $this->consoleOutput = 'Cracked ' . $ip . ':' . $port;
    $this->voice = 'crack_done';
    $this->completedObjective('crack', $ip . ':' . $port);

    // Remove encryption
    unset($this->questData['hosts'][$ip]['services'][$port]['encryption']);
  } // portCrackTask

  /*
   * Process ping
   */
  function pingTask()
  {
    //Show result host found or not found respectively
    if ($host =& $this->questData['hosts'][$ip = $this->questData['task']['ip']]) {
      $this->consoleOutput = 'PING ' . $ip . ' (' . $host['hostname'] . '): ' . rand(1, 10) . 'ms average response time.';
      $this->consoleOutput .= '<br/>0% packet loss.';

      $this->completedObjective('ping', $ip);

      //IP Found check if not visible already
      if (!in_array($ip, $this->questData['discovered'])) {

        $this->questData['discovered'][$ip] = $host['hostname'];
        $data['ip']                 = $ip;
        $data['hostname']           = $host['hostname'];
        $this->jsonOutput['new_ip'] = $data;
      } //!$host['discovered']
    } //$host =& $this->questData['hosts'][$ip = $this->questData['task']['ip']]
    else
      $this->consoleOutput = 'Cannot resolve ' . $ip . ': Unknown host';


  } // pingTask

  function transferTask()
  {
    $ip   = $this->questData['task']['ip'];
    $port = $this->questData['task']['port'];
    $file = $this->service['files'][$fileKey = $this->questData['task']['fileKey']];
    $this->completedObjective('transfer', $file['title'] . '|' . $ip . ':' . $port);

    $this->increaseTraceBy(4, true, $ip);
    $this->voice = 'command_done';
    if ($this->questData['task']['removeFromHost'])
    {
      unset($this->service['files'][$fileKey]);
      $this->consoleOutput = 'File transfer to target host completed';
    }
    else
      $this->consoleOutput = 'File copy created on target host';

    $this->questData['hosts'][$ip]['services'][$port]['files'][] = $file;

  }
}
