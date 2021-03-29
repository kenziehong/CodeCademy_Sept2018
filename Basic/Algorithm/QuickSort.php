<?php

function simpleQuickSort($arr) {
  if (count($arr) <= 1) {
    return $arr;
  }

  $pivot = $arr[0];
  $arrLeft = $arrRight = [];

  foreach ($arr as $key => $value) {
    if ($pivot > $value) {
      $arrLeft[] = $value;
    }

    if ($pivot < $value) {
      $arrRight[] = $value;
    }
  }

  return array_merge(simpleQuickSort($arrLeft), array($pivot), simpleQuickSort($arrRight));
}

$unsorted = array(5, 3, 8, 6, 2, 7);
echo implode(",", $unsorted) . " @unsorted<br>";
$sorted = simpleQuickSort($unsorted);
echo implode(",", $sorted) . " @sorted<br>";






// In-place quicksort sorts the array by swap array elements within the input array, thus it doesn’t require more storage allocation which in turn improves the efficiency.
function partition(&$arr, $left, $right) {
  $mid = floor(($left + $right) / 2);
  $pivot = $arr[$mid];

  while ($left < $right) { // while 1
    while ($arr[$left] < $pivot) { // while 2: move $left close to $mid
      $valueLeft = $arr[$left];
      $left++;
    }

    while ($arr[$right] > $pivot) { // while 3: move $right close to $mid
      $valueRight = $arr[$right];
      $right--;
    }

    if ($left <= $right) {
      // arrange to put $pivot into a right place
      $tmp = $arr[$left];
      $arr[$left] = $arr[$right];
      $arr[$right] = $tmp;

      // conditons to stop while 1
      $left++;
      $right--;
    }
  }
  echo implode(",", $arr) . " @pivot $pivot<br>";

  return $left; // new index of the $pivot
  
}

function quickSort(&$arr, $left, $right) {
  $index = partition($arr, $left, $right);

  if ($left < $index - 1) {
    quickSort($arr, $left, $index - 1);
  }

  if ($index < $right) {
    quickSort($arr, $index, $right);
  }
  
  if ($left < $right) {
    $index = partition($arr, $left, $right);

    quickSort($arr, $left, $index - 1);
    quickSort($arr, $index, $right);

  }
}

$nums = array(8, 11, 22, 9, 35, 32);
echo implode(",", $nums) . " @unsorted<br>";
quickSort($nums, 0, count($nums) - 1);
echo implode(",", $nums) . " @sorted<br>";

