<?php
class Game {



  function __construct() {

  }


  function generateNumbersPattern($hardness = 1) {
    $rand = array(
      1,
      2,
      3,
      4,
      5,
      6
    );

    if ($hardness == 1)
      unset($rand[2], $rand[3], $rand[4]);
    elseif ($hardness == 2)
      unset($rand[3]);

    shuffle($rand);
    $rand = $rand[0];

    $pattern         = array(
      "numbers" => array(),
      "nth" => rand(1, 6)
    );
    //$rand=7;
    $numberOfNumbers = rand(4, 6);
    $sign            = rand(1, 100) % 2 == 0 ? 1 : -1;

    switch ($rand) {
      // simple increment
      case 1:
        $number      = rand(0, 100);
        $nrIncrement = rand(1, 20);

        for ($nrIndex = $nr; $nrIndex <= $numberOfNumbers; $nrIndex++) {
          $pattern['numbers'][] = $number;
          $number += $nrIncrement * $sign;
        }
        $pattern['nth_number'] = $number;
        for ($nrIndex = 1; $nrIndex < $pattern['nth']; $nrIndex++)
          $pattern['nth_number'] += $nrIncrement * $sign;

        break;
      // variating increment
      case 2:
        $number             = rand(1, 100);
        $currentIncrementBy = rand(1, 10);
        $incrementBy        = rand(1, 10);
        for ($nrIndex = 1; $nrIndex <= $numberOfNumbers; $nrIndex++) {
          $pattern['numbers'][] = $number;
          $number += $currentIncrementBy * $sign;
          $currentIncrementBy += $incrementBy;
        }
        $pattern['nth_number'] = $number;
        for ($nrIndex = 1; $nrIndex < $pattern['nth']; $nrIndex++) {
          $pattern['nth_number'] += $currentIncrementBy * $sign;
          $currentIncrementBy += $incrementBy;
        }
        break;
      // primes
      case 3:
        $number  = rand(3, 70);
        $primes  = $this->getPrimes(200);
        $nrIndex = 1;
        for ($i = 0; $i < count($primes); $i++) {
          if (count($pattern['numbers']) < $numberOfNumbers) {
            if ($primes[$i] >= $number) {
              $pattern['numbers'][] = $primes[$i];

            }
            continue;
          } elseif ($nrIndex == $pattern['nth']) {
            $pattern['nth_number'] = $primes[$i];
            break;
          }
          $nrIndex++;
        }

        break;
      // mirror difference
      case 4:
        $number = rand(10, 99);
        $nrNth  = 0;
        $extras = array();
        while (count($extras) < $pattern['nth']) {

          $number2 = ($number % 10) * 10 + intval($number / 10);
          if (count($pattern['numbers']) < $numberOfNumbers) {
            $pattern['numbers'][] = $number;
            $pattern['numbers'][] = $number2;
          } else {
            $extras[] = $number;
            $extras[] = $number2;
          }

          $number = $number > $number2 ? $number - $number2 : $number2 - $number;
        }
        $number2              = ($pattern['numbers'][$numberOfNumbers - 1] % 10) * 10 + intval($pattern['numbers'][$numberOfNumbers - 1] / 10);
        $pattern['numbers'][] = $number2;

        $pattern['nth_number'] = $extras[$pattern['nth'] - 1];

        $answerMissing = count($pattern['numbers']) - 1;

        break;
      // squares
      case 5:
        $number  = rand(0, 100);
        $squares = array();
        $nrNth   = 0;
        while (true) {
          if (sqrt($number) == intval(sqrt($number)))
            if (count($pattern['numbers']) < $numberOfNumbers)
              $pattern['numbers'][] = $number;
            elseif ($nrNth == $pattern['nth']) {
              $pattern['nth_number'] = $number;
              break;
            } else
              $nrNth++;
          $number++;
        }
        break;
      // product
      case 6:
        $number   = rand(2, 13);
        $progress = rand(2, 6);
        $nrNth    = 1;
        while (true) {
          if (count($pattern['numbers']) < $numberOfNumbers)
            $pattern['numbers'][] = $number;
          elseif ($nrNth == $pattern['nth']) {
            $pattern['nth_number'] = $number;
            break;
          } else
            $nrNth++;
          $number *= $progress;
        }
        break;

      default:
    }

    $pattern['answer_missing'] = $answerMissing ? $answerMissing : rand(0, count($pattern['numbers']) - 1);
    return $pattern;
  }

  function getPrimes($n) {
    if ($n < 5)
      return (($n < 2) ? false : (($n < 3) ? array(
        2
      ) : array(
        2,
        3
      )));
    $primes = range(3, $n, 2);
    for ($i = 0, $sqrtN = sqrt($n), $pTot = count($primes); $j = 0, $k = $primes[$i], $k <= $sqrtN; $i++) {
      if ($k == null)
        continue;
      while (++$j * $k < $pTot)
        $primes[$j * $k + $i] = null;
    }
    array_unshift($primes, 2);
    return array_values(array_filter($primes));
  }

  function generateEncryptedString() {

  }
}
$gclass = new Game;
