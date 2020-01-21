<?php

function binarySearch($arrSorted, $left, $right, $x) {
  if ($right >= $left) {
    $mid = floor($left + ($right - $left) / 2);

    if ($arrSorted[$mid] === $x) {
      return $mid;
    }

    if ($arrSorted[$mid] > $x) {
      $right = $mid - 1;

      return binarySearch($arrSorted, $left, $right, $x);
    }

    if ($arrSorted[$mid] < $x) {
      $left = $mid + 1;

      return binarySearch($arrSorted, $left, $right, $x);
    }
  }

  return -1;
}

$arr = [12, 24, 34, 44, 56, 67, 75, 88, 89, 91, 100];
$n = count($arr) - 1;

$timeStarted = microtime(true);
$result = binarySearch($arr, 0, $n, 91);
$timeElapsed = microtime(true) - $timeStarted;

if ($result == -1) {
  echo "Element is not present in array";
} else {
  echo "Element is present at index " . $result;
}

echo "\n";
echo "Took time " . $timeElapsed;
