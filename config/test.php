<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 9/22/15
 * Time: 11:30 AM
 */
// every point in the form of x,y
$points = [
    [4,5],[7,3],[6,8]
];

/**
 * @param $points
 * @return float
 */
function getAverageDistance($points)
{
    // point 1 and point 2
    $dist_p1_p2 = sqrt(pow(($points[1][0]-$points[0][0]),2) + pow(($points[1][1]-$points[0][1]),2));
    // point 1 and point 3
    $dist_p1_p3 = sqrt(pow(($points[2][0]-$points[0][0]),2) + pow(($points[2][1]-$points[0][1]),2));
    // point 2 and point 3
    $dist_p2_p3 = sqrt(pow(($points[1][0]-$points[2][0]),2) + pow(($points[1][1]-$points[2][1]),2));

    return ($dist_p1_p2 + $dist_p1_p3 + $dist_p2_p3) / 3;
}


/**
 * @param $word
 * @return bool
 */
function IsCasiPalindromo($word)
{
    $word = srt_split($word);
    $n = count($word);
    $misses = 0;
    for ($i=0;$i<$n;$i++) {
        $last_character = $n - ($i + 1);
        if ($word[$i] != $word[$last_character]) {
            $misses++;
        }
    }
    $misses--; // because if 1 error found it will repeat itself.
    if ($misses > 1) {
        return false;
    }
    return true;
}


/**
 * @param $numbers
 * @return int|string
 */
$numbers = [4,5,7,8,1,3,45,0,2,9,8,8,6,0,2,34,896,64,9,9];
// should return 8.

function getNMax($numbers)
{
    $results = [];
    foreach ($numbers as $number) {
        if (isset($results[$number])) {
            $results[$number]++;
        } else {
            $results[$number] = 1;
        }
    }
    $max = -1;
    $num = -1;
    foreach ($results as $number => $q) {
        if (($q > $max) || ($q == $max && $number < $num)){
            $max = $q;$num = $number;
        }
    }
    return $num;
}