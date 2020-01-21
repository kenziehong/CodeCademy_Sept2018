<?php

function linearSearch($arr, $x) {
  foreach ($arr as $key => $value) {
    if ($x == $value) {
      return $key;
    }
  }

  return -1;
}

$arr = [12, 24, 34, 44, 56, 67, 75, 88, 89, 91, 100];

$timeStarted = microtime(true);
$result = linearSearch($arr, 91);
$timeElapsed = microtime(true) - $timeStarted;

if ($result == -1) {
  echo "Element is not present in array";
} else {
  echo "Element is present at index " . $result;
}

echo "\n";
echo "Took time " . $timeElapsed;
