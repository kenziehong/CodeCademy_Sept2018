<?php
// $data = array(55,41,59,26,53,58,97,93);
$data = array(32, 11, 36, 35, 8, 22, 54, 65);
quicksort(0, sizeof($data)-1, 'quickSort_0');


/**
 * tạo m = lower, duyệt từ i = lower + 1 đến upper
 * trong vòng lặp, nếu giá trị tại i nhỏ hơn lower => tăng m, đổi giá trị m và i
 * hết vòng lặp, đổi giá trị m và lower
 * gọi hàm từ lower tới m-1 và từ m+1 đến upper
 */
function quicksort($lower, $upper, $message) {
	global $data;

	if ($lower >= $upper) {
		echo "Break | Lower: {$lower} | Upper: {$upper} | {$message}" . PHP_EOL;
		return;
	}

	$m = $lower;
	// echo str_repeat("=", 80), PHP_EOL;
	// partition the array on $data[$lower]
	for ($i=$lower+1; $i<=$upper; $i++) {
		if ($data[$i] < $data[$lower]) { 
			$m ++;

			$tmp = $data[$m];
			$data[$m] = $data[$i];
			$data[$i] = $tmp;
			//print_array($data);
		}
	}
	// swap the sential node with $data[$m]
	$tmp = $data[$m];
	$data[$m] = $data[$lower];
	$data[$lower] = $tmp;
	// print_array($data);
	// quick sort the tow parts recursively

	echo "Start | Lower: {$lower} | Upper: {$upper} | m: {$m} | {$message}" . PHP_EOL;
	quicksort($lower, $m-1, 'quickSort_1 ');

	echo str_repeat("=", 60) . "Betwwen | Lower: {$lower} | Upper: {$upper} | m: {$m} | {$message}" .  PHP_EOL;

	quicksort($m+1, $upper, 'quickSort_2');
	echo "End | Lower: {$lower} | Upper: {$upper} | m: {$m} | {$message}" . PHP_EOL;
}

function print_array($data, $newlineCount = 1) {
	echo implode("->", $data), str_repeat(PHP_EOL, $newlineCount);
}



