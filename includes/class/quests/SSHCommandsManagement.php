<?php
  /*
   *
   * SSH COMMANDS
   *
   */
trait SSHCommandsManagement
{

  function connectPortCommand($console, $type = 'ssh')
  {
    if ($this->connected['ip'] == $this->questData['main']) {
      if ($console[1] != $this->questData['main'] && ($host = $this->findHost($console[1]))) {
        if (ctype_digit($console[2]) && ($service = $host['services'][$console[2]])) {
          if ($service['type'] == $type)
          {
            if (!$service['encryption']) {

                $takes = 20;

			  	$influence = $this->uclass->computeUserSkillsCommandsInfluence();
				$reduction = ceil(($takes / 100) * $influence['port_connect']);
				$takes    -= $reduction;

				$this->consoleOutput = sprintf("Connect to %s:%s (%s [%s%%] time reduction by skills)",
													  $console[1], $console[2], sec2hms($reduction), $influence['port_connect']);

			  $takes = $takes >= 3 ? $takes : 3;

              $taskData = array('ip' => $console[1], 'port' => $console[2]);
              $this->addMinitask('port_connect', $this->consoleOutput, $takes, $taskData);

				$doDamage = rand(1,100);
				if ($doDamage >= 55)
				{
					$this->damageSoftwareThroughUsage('port_connect', rand(1,3));

				}

              $this->voice = 'connection_initiated';

            } //!$service['encryption']
            else
            {
              $this->consoleOutput = 'Access denied. Protection active';
              $this->voice = 'accessdenied';
            }
          }
          else
            $this->consoleOutput = strtoupper($type).' server not found';
        } //ctype_digit($console[2]) && ($service = $host['services'][$console[2]])
        else
          $this->consoleOutput = 'Could not connect';
      } //$console[1] != $this->questData['main'] && ($host = $this->findHost($console[1]))
      else
        $this->consoleOutput = 'Host unavailable';
    } //$this->connected['ip'] == $this->questData['main']
    else
      $this->consoleOutput = 'Logout from current host first';
  }

  function transferCommand($console, $removeFromHost = true)
  {
      if (!($file = $this->fileExists($console[1], $this->service['files'])))
		$this->consoleOutput = 'File not found';
      elseif (!($console[2] != $this->connected['ip'] && ($host = $this->findHost($console[2]))))
		$this->consoleOutput = 'Host '.$this->connected['ip'].' unavailable';
      elseif ($host['services'][$console[3]]['type'] != 'ssh')
		$this->consoleOutput = 'SSH service not found on port';
      elseif ($host['services'][$console[3]]['encryption'])
		$this->consoleOutput = 'SSH service protected';
	  elseif ($file['encryption'])
        $this->consoleOutput = 'File is encrypted';
      elseif ($file['running'])
		$this->consoleOutput = 'File is running';
	  elseif ($fileOnTarget = $this->fileExists($console[1], $host['services'][$console[3]]['files']))
	  	$this->consoleOutput = "A file with the same name already exists on target";
      else {
              if (!$removeFromHost)
                $this->consoleOutput = 'Copying ' . $file['title'] . ' to ' . $console[2] . ':' . $console[3];
              else
                $this->consoleOutput = 'Transferring ' . $file['title'] . ' to ' . $console[2] . ':' . $console[3];
              $takes               = 3;
              $taskData = array('ip' => $console[2], 'port' => $console[3], 'fileKey' => $file['key'], 'removeFromHost' => $removeFromHost);
              $this->addMinitask('transfer', $this->consoleOutput, $takes, $taskData);
            } // not encrypted



  } // transferCommand

  function catCommand($console)
  {

    if (!$console[1])
      $this->consoleOutput = 'No input file specified';
    elseif ($file = $this->fileExists($console[1], $this->service['files'])) {
      if (!$file['encryption']) {
    	  if ($file['file_id'])
		  {
          	$content = $this->db->where('file_id', $file['file_id'])->getOne('quest_files', 'content');
          	$this->parseQSyntaxRecursively($content['content']);
		  }
          if ($content['content'])
	      {

          $parser = new \JBBCode\Parser();
          $parser->addCodeDefinitionSet(new \JBBCode\DefaultCodeDefinitionSet());
          $parser->parse($content['content']);

            $this->consoleOutput = '<div style=\'color:white;margin-left:10px;\'>' . ($parser->getAsHtml()) . '</div>';
		  }
		  else $this->consoleOutput = 'Not readable or no data contained';
          $this->completedObjective('cat', $file['title']);


      } //!$file['encryption']
      else
        $this->consoleOutput = 'Could not read encrypted file.<br/>' . ($str = base64_encode(base64_encode(md5($file['title']))));
    } //$file = $this->fileExists($console[1], $this->service['files'])


  } // catCommand

  /*
   *
   */
  function nmapCommand($console)
  {
    if ($this->connected['ip'] == $this->questData['main']) {
      if ($this->findHost($console[1])) {

        $takes               = 100;
        $taskData = array('ip' => $console[1]);

		$influence = $this->uclass->computeUserSkillsCommandsInfluence();
		$reduction = ceil(($takes / 100) * $influence['ports_scan']);
		$takes    -= $reduction;

        $this->consoleOutput = sprintf("Scanning %s (%s [%s%%] time reduction by skills)",
											  $console[1], sec2hms($reduction), $influence['ports_scan']);

        $this->addMinitask('nmap', $this->consoleOutput, $takes, $taskData);

		  $doDamage = rand(1,100);
				if ($doDamage >= 55)
				{
					$this->damageSoftwareThroughUsage('ports_scan', rand(1,3));

				}

      } //$this->findHost($console[1])
    } //$this->connected['ip'] == $this->questData['main']
    else
      $this->consoleOutput = 'Logout from current host first';
  }

  function crackCommand($console)
  {
    if ($this->connected['ip'] != $this->questData['main'])
		{$this->consoleOutput = 'Logout from current host first'; return;}

    if (!($console[1] != $this->questData['main'] && ($host = $this->findHost($console[1]))))
	{$this->consoleOutput = 'Host unavailable'; return;}

    if (!(ctype_digit($console[2]) && $host['services'][$port = $console[2]]))
		{ $this->consoleOutput = 'No service running on specified host and port'; return; }

    if (!$host['services'][$port]['encryption'])
		{$this->consoleOutput = 'Port is not protected. You can connect freely.'; return; }

            $takes               = $host['services'][$port]['encryption'];

			$influence = $this->uclass->computeUserSkillsCommandsInfluence();
			$reduction = ceil(($takes / 100) * $influence['crack']);
			$takes -= $reduction;

			  $this->consoleOutput = sprintf("Cracking password for %s:%s (%s [%s%%] time reduction by skills)",
											  $console[1], $port, sec2hms($reduction), $influence['crack']);

            $taskData = array('ip' => $console[1], 'port' => $port);
            $this->addMinitask('port_crack', 'Cracking security of ' . $console[1] . ':' . $port, $takes, $taskData);
            $this->voice = 'cracking_initiated';

	  			$doDamage = rand(1,100);
				if ($doDamage >= 65)
				{
					$this->damageSoftwareThroughUsage('crack', rand(1,3));

				}

  }

  function pingCommand($console)
  {
    if ($this->connected['ip'] == $this->questData['main']) {
      if (filter_var($console[1], FILTER_VALIDATE_IP)) {

        $this->consoleOutput = 'Pinging ' . $console[1];
        $takes               = 3;
        $taskData = array('ip' => $console[1]);
        $this->addMinitask('host_ping', $this->consoleOutput, $takes, $taskData);
        $this->voice = 'ping_in_progress';

      } //filter_var($console[1], FILTER_VALIDATE_IP)
      else
        $this->consoleOutput = 'Invalid IP format';
    } //$this->connected['ip'] == $this->questData['main']
    else
      $this->consoleOutput = 'Logout from current host first';
  } // pingCommand

  function ifconfigCommand()
  {
    $this->consoleOutput = 'IP: ' . $this->connected['ip'] . '<br/>';
    $this->consoleOutput .= 'Port: ' . $this->connected['port'] . '<br/>';
    $this->consoleOutput .= 'Hostname: ' . $this->questData['hosts'][$this->connected['ip']]['hostname'] . '<br/>';
    $this->consoleOutput .= 'MAC Address: ' . $this->questData['hosts'][$this->connected['ip']]['mac'] . '<br/>';
    $this->consoleOutput .= 'Operating System: ' . $this->cardinalOS;
  }

  /*
   * Find files that are running on current service
   */
  function psCommand()
  {
    $nr = 0;
    if (is_array($this->service['files']))
      foreach ($this->service['files'] as $key => $file)
        if ($file['running']) {
          $this->consoleOutput .= 'ID: ' . ($this->service['process_id_start'] + $key) . ' Process: ' . $file['title'] . '<br/>';
          $nr++;
        } //$file['running']

    $this->consoleOutput = $nr ? $this->consoleOutput . $nr . ' running' : 'No process running';
  } // psCommand

  function lsCommand($console, $field = 'files')
  {



    $nrFiles = 0;
    if (is_array($this->service[$field]))
      foreach ($this->service[$field] as $file)
		if ($file['requiredObjective']) continue;
        elseif ($file['title'][0] != '.' || $console[1] == '-a') {
          $this->consoleOutput .= $file['title'] . ($file['encryption'] ? ' [encrypted]' : '') . ($file['canRun'] ? ' [executable]' : '')  . '<br/>';
          $nrFiles++;
        } //$file['title'][0] != '.' || $console[1] == '-a'

    $this->consoleOutput .= '<em>' . $nrFiles . ' returned</em>';
  }

  function decryptCommand($console)
  {

    if ($file = $this->fileExists($console[1], $this->service['files'])) {
      if ($file['encryption']) {

        $doDamage = rand(1,100);
		if ($doDamage >= 70)
		{
			 $this->damageSoftwareThroughUsage('decrypt', rand(1,3));
		}
        $takes               = $file['encryption'];
		$influence = $this->uclass->computeUserSkillsCommandsInfluence();
		$reduction = ceil(($takes / 100) * $influence['decrypt']);
		$takes    -= $reduction;

		$this->consoleOutput = sprintf("Finding encryption properties of %s (%s [%s%%] time reduction by skills)",
											  $file['title'], sec2hms($reduction), $influence['decrypt']);

		$taskData = array('fileKey' => $file['key'], 'timeReduction' => $reduction);
        $this->addMinitask('encryption_key', "Identifying encryption properties", $takes, $taskData);

      } //$file['encryption']
      else
        $this->consoleOutput = 'No encryption found';
    } //$file = $this->fileExists($console[1], $this->service['files'])
  }

  function logoutCommand()
  {
    if ($this->connected['ip'] != $this->questData['main']) {
      $this->consoleOutput = 'Disconnected from '.$this->connected['ip'];
      unset($this->questData['connected']);
      $this->update_quest();
    } //$this->connected['ip'] != $this->questData['main']
    else
      $this->consoleOutput = 'You are not connected to any host';
  }
  function rmCommand($console)
  {

    if ($console[1] == 'logs') {
      if ($this->connected['ip'] != $this->questData['main']) {
        //if (!$this->questData['hosts'][$connectedHost]['logs_deleted']) {

          $this->consoleOutput = 'Deleting logs of ' . $this->connected['ip'];

          $takes = 3;
          $this->addMinitask('host_delete_logs', $this->consoleOutput, $takes, array());

        //} //!$this->questData['hosts'][$connectedHost]['logs_deleted']
        //else
        //   $this->consoleOutput = 'You can delete logs only once per host';
      } //$connectedHost != 'main'
      else
        $this->consoleOutput = 'You aren\'t connected to any host.';
    } //$console[1] == 'logs'
    else {

      if (!$console[1])
        $this->consoleOutput = 'No file specified';
      elseif ($file = $this->fileExists($console[1], $this->service['files']))
		if ($file['cantDelete'])
		  $this->consoleOutput = 'File cannot be deleted. Access declined by the Cardinal Operating System.';
        elseif ($file['running'])
          $this->consoleOutput = 'File is running';
        elseif ($file['encryption'])
          $this->consoleOutput = 'File is encrypted';
        else {
          $this->consoleOutput = 'File deleted';
          $this->completedObjective('delete_file', $file['title']);
          unset($this->service['files'][$file['key']]);
          $this->update_quest();
        } //if
    }
  } // rmCommand

  function invalidFileName($filename){
	  if (!isset($filename[2]) || isset($filename[15]) || !preg_match('/^[a-z0-9-.]+$/',$filename))
	  {
		  return "Filename must contain only a-z, 0-9, .'s and -'s and have between 3 and 15 chars.";
	  }
  }
  function touchCommand($console)
  {

      if (!$console[1])
        $this->consoleOutput = 'No filename specified';
      elseif ($file = $this->fileExists($console[1], $this->service['files']))
	  	$this->consoleOutput = 'File already exists';
	  elseif(count($this->service['files']) >= 20)
		  $this->consoleOutput = "Server storage limit exceeded";
	  elseif (!($this->consoleOutput = $this->invalidFileName($console[1])))
	  {
		  $file = array(
		  	'canRun' => true,
			'title' => $console[1],

		  );
		  $this->service['files'][] = $file;

          $this->consoleOutput = 'File created';

		  $this->update_quest();

      } // if file exists

  } // rmCommand

  function areThereEncryptedServices($host)
  {
    foreach ($host['services'] as $service)
      if ($service['encryption'])
        return true;

    return false;
  }
  function bounceCommand($console)
  {
    switch ($console[1]) {
      case 'add':
        if ($this->findHost($ip = $console[2]))
          if ($ip == $this->questData['main'])
            $this->consoleOutput = 'Cannot add main server';
          elseif (in_array($ip, $this->questData['bounces']))
            $this->consoleOutput = 'Already on bounce list';
          elseif ($this->areThereEncryptedServices($this->questData['hosts'][$ip]))
            $this->consoleOutput = 'Host still has protected ports/services';
          else {
            $this->questData['bounces'][] = $ip;
            $this->consoleOutput          = 'Added ' . $ip . ' to bounce list';
            $this->update_quest();
          } //$this->findHost($ip = $console[2])

        break;
      case 'remove':
          if (($bounceKey = array_search($ip, $this->questData['bounces'])) === false)
            $this->consoleOutput = 'Host not on bounce list';
          else {
            unset($this->questData['bounces'][$bounceKey]);
            $this->consoleOutput = 'Removed from bounce list';
            $this->update_quest();

          } //$this->findHost($ip = $console[2])
        break;
      case 'status':
        if (count($this->questData['bounces']))
        {
          $validBounces = 0;
          foreach ($this->questData['bounces'] as $bounce)
          {
            $this->consoleOutput .= $bounce . ' - Remaining bounces: ' . $this->questData['hosts'][$bounce]['bounces'] . '/'. $this->questData['hosts'][$bounce]['maxBounces'] .'<br/>';
            if ($this->questData['hosts'][$bounce]['bounces'] < $this->questData['hosts'][$bounce]['maxBounces'])
              $validBounces++;
          }
          $this->consoleOutput .= 'Bouncing through '.$validBounces.' servers';
        }
        else
          $this->consoleOutput = 'Bounce list is empty';

        break;
      default:
        $this->consoleOutput = 'Invalid command syntax';
    } //$console[1]
  } // bounceCommand

  function ddosCommand($console)
  {
    switch ($console[1]) {
      case 'add':
        if ($this->findHost($ip = $console[2]))
          if ($ip == $this->questData['main'])
            $this->consoleOutput = 'Cannot add main server';
          elseif (in_array($ip, $this->questData['ddos']))
            $this->consoleOutput = 'Already on DDOS bot list';
          elseif ($this->areThereEncryptedServices($this->questData['hosts'][$ip]))
            $this->consoleOutput = 'Host still has protected ports/services';
          else {
            $this->questData['ddos'][] = $ip;
            $this->consoleOutput       = 'Added ' . $ip . ' to ddos list';
            $this->update_quest();
          } //$this->findHost($ip = $console[2])

        break;
      case 'remove':
          if (($ddosKey = array_search($ip, $this->questData['ddos'])) === false)
            $this->consoleOutput = 'Host not on DDOS list';
          else {
            unset($this->questData['ddos'][$ddosKey]);
            $this->consoleOutput = 'Removed from DDOS bot list';
            $this->update_quest();

          } //$this->findHost($ip = $console[2])
        break;
      case 'status':
        if (count($this->questData['ddos']))
        {
        foreach ($this->questData['ddos'] as $ddos)
          $this->consoleOutput .= $ddos . ' - Remaining DDOS\'s: ' . ($this->ddosPerHost - $this->questData['hosts'][$ddos]['ddos']) . '<br/>';
        $this->consoleOutput .= ''.count($this->questData['ddos']).' bot servers';

        }
        else
          $this->consoleOutput = 'DDOS bot list is empty';

        break;
      case 'initiate':
        $this->initiateDdosCommand($console);
        break;
      default:
        $this->consoleOutput = 'Invalid command syntax';
    } //$console[1]
  } // ddosCommand

  function initiateDdosCommand($console)
  {
    if ($this->connected['ip'] == $this->questData['main']) {
      if ($console[2] != $this->questData['main']) {
        if ($host = $this->findHost($ip = $console[2])) {
          //if ($this->areThereEncryptedServices($host)) {
            if (ctype_digit($port = $console[3]) && ($service = $host['services'][$port])) {
              $this->consoleOutput = 'DDOS attack on ' . $ip . ':' . $port;

              $takes = 3;
              $taskData = array('ip' => $ip, 'port' => $port);
              $this->addMinitask('ddos', $this->consoleOutput, $takes, $taskData);

				$doDamage = rand(1,100);
				if ($doDamage >= 20)
				{
					$this->damageSoftwareThroughUsage('crack', rand(5,10));
					$this->damageSoftwareThroughUsage('port_connect', rand(3,6));

				}

            } //ctype_digit($port = $console[2]) && ($service = $host['services'][$port])
            else
              $this->consoleOutput = 'Could not connect';
      /*    } //$this->areThereEncryptedServices($host)
          else
            $this->consoleOutput = 'There\'s nothing to hack';*/
        } //$host = $this->findHost($ip = $console[1])
      } //$console[1] != $this->questData['main']
      else
        $this->consoleOutput = 'Trying to hack ourselves, aren\'t we?';
    } //$this->connected['ip'] == $this->questData['main']
    else
      $this->consoleOutput = 'Logout from current host first';
  }

  function areFilesRunning($files, $serviceFiles)
  {
	  //isset($file['requiredToRun']) && (!($f = $this->fileExists($file['requiredToRun'], $this->service['files'])) || !$f['running']))
      if (count($files))
	  foreach ($files as $file)
		  if (!($file = $this->fileExists($file, $serviceFiles)) || !$file['running'])
		  	return false;
	  return true;
  }

  function checkparameters($parameters, $console)
  {
	  if (count($parameters))
	  foreach ($parameters as $key => $parameter)
		  if ($console[$key + 2] != $parameter)
		  	return false;
	  return true;
  }
  function runCommand($console)
  {
    if (!$console[1])
      $this->consoleOutput = 'No file specified';
    else if ($file = $this->fileExists($console[1], $this->service['files']))
      if (!$file['canRun'])
        $this->consoleOutput = 'Cannot be executed';
      elseif ($file['running'])
        $this->consoleOutput = 'Already running';
      elseif ($file['encryption'])
        $this->consoleOutput = 'File is encrypted';
      elseif (!$this->areFilesRunning($file['requiredToRun'], $this->service['files']))
        $this->consoleOutput = "Files [" . implode(", ", $file['requiredToRun']) . '] have to be running on this server';
	  elseif (!$this->areFilesRunning($file['requiredOnMainToRun'], $this->questData['hosts'][$this->questData['main']]['services'][22]['files']))
        $this->consoleOutput = "Files [" . implode(", ", $file['requiredOnMainToRun']) . '] have to be running on your main server';
      elseif (!$this->checkParameters($file['parameters'], $console))
		$this->consoleOutput = "Incorrect parameters provided";
	  else {

		if ($file['executionTime'])
		{
			$takes = $file['executionTime'];
			$taskData = array('fileKey' => $file['key']);
			$this->consoleOutput = "Executing..";
            $this->addMinitask('file_run', $this->consoleOutput, $takes, $taskData);
		}
		else
		{
			$this->executeFile($file);
		}

      }
  }
  function executeFile($file)
  {

        $this->consoleOutput = 'Process ' . $file['title'] . ' started.';
        $this->completedObjective('run_file', $file['title'] . '|' . $this->connected['ip'] . ':' . $this->connected['port']);

		if ($file['burst'])
			$console->consoleOutput .= '<br/>Process finished executing.';
		else
        	$this->service['files'][$file['key']]['running'] = true;
        $this->update_quest();
        $this->voice = 'app_execute';
  }

  function killCommand($console)
  {

    if (!$console[1])
      $this->consoleOutput = 'No file specified';
    elseif (!(($file = &$this->service['files'][$console[1] - $this->service['process_id_start']]) && $file['running']))
		$this->consoleOutput = 'Process not found';
	elseif ($file['cantKill'])
		$this->consoleOutput = 'Process cannot be killed. Access declined by Cardinal Operating System.';
	else
	{
        $this->consoleOutput = 'Process ' . $console[1] . ':' . $file['title'] . ' killed';

        $this->completedObjective('kill_file', $file['title'] . '|' . $this->connected['ip'] . ':' . $this->connected['port']);

        unset($file['running']);

        foreach ($this->questData['hosts'] as $ip => &$host)
          if(is_array($host['services']))
          foreach($host['services'] as $port => &$service)
            if ($service['type'] == 'ssh')
              foreach ($this->service['files'] as &$fl)
                if ($fl['running'] &&( in_array($file['title'], $fl['requiredToRun'])  || ($this->connected['ip'] == $this->questData['main'] && in_array($file['title'], $fl['requiredOnMainToRun']) )))
                {
                  $this->consoleOutput .= '<br/>'.$fl['title'].' has also been killed as it required '.$file['title'].' to be running on '.($fl['requiredOnMainToRun'] == $file['title'] ? 'main' : 'current').' host';
                  unset($fl['running']);
                  $this->completedObjective('kill_file', $fl['title'] . '|' . $ip . ':' . $port);
                  $this->voice = 'app_killed';

                }

        $this->update_quest();

    } //$file = $this->fileExists($console[1], $this->service['files'])


  }
}
