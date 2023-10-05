<?php

class RewardsManager {
  private static  $stackableLoginBonusDays = 7;
  public static function login_count_reward($login_count) {
    $reward = array();
    switch ($login_count) {
      case 10:
        $reward['money'] = 111;
        $reward['achievements'] = array(7);
        $reward['title'] = 'Cheers for 10 logins!';
        break;
      case 49:
        $reward['money'] = 333;
        $reward['achievements'] = array(7);
        $reward['title'] = 'Happy 50th login!';
        break;
      case 99:
        $reward['money'] = 666;
        $reward['achievements'] = array(7);
        $reward['title'] = '100 logins and counting';
        break;
      case 499:
        $reward['money'] = 1111;
        $reward['achievements'] = array(7);
        $reward['title'] = 'Getting older? 500 logins';
        break;
      case 999:
        $reward['money'] = 2222;
        $reward['achievements'] = array(7);
        $reward['title'] = '1000th login';
        break;
      case 9999:
        $reward['money'] = 3333;
        $reward['achievements'] = array(7);
        $reward['title'] = 'Wow.. 10.000 logins';
        break;
      default:
        $reward = false;
    }

    return $reward;
  }

  public static function stackable_login_bonus($login_days_in_a_row) {
    $reward = array(
      'money' => 50,
      'skillPoints' => 2,
      'exp' => 50
    );
    $stackedDays = $login_days_in_a_row > self::$stackableLoginBonusDays ? self::$stackableLoginBonusDays : $login_days_in_a_row;

    $percentIncrease = 25 * $stackedDays;

    foreach ($reward as $stat => &$value)
      $value += floor(($value / 100) * $percentIncrease);


    if ($login_days_in_row % 30 == 0)
    {
      $reward['achievements'] = array(10);
    }

    $reward['title'] = sprintf('Connect reward: %s day(s) in a row', $login_days_in_row);

    return $reward;
  }

  public static function zone_bonus($zone) {
    $zones = array(
      1 => array(
        1 => 3
      ),
      2 => array(
        2 => 2,
        4 => 2,
      ),
      3 => array(
        5 => 2,
        6 => 2,
      ),
      4 => array(
        8 => 2,
        9 => 2,
      ),
      5 => array(
        5 => 2,
        1 => 2,
      ),
      6 => array(
        3 => 4
      ),
    );

    $skills = array();
    foreach ($zones[$zone] as $skill => $upgradeToLevel)
    {
      $level = 1;
      while ($level < $upgradeToLevel)
      {
        $level++;
        $skills[$skill] += UserClass::computeSkillExperience($skill, $level);
      }
    }
    $reward = array("achievements" => array());
    $reward['skills'] = $skills;

    $reward['title'] = "Zone " . $zone . " skills influence";

      return $reward;
  }
}
?>
