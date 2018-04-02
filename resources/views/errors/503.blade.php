<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/21/15
 * Time: 12:25 AM
 */
header('Content-Type: application/json');
http_response_code(503);
$response = [
		"info" => [
				"code" => 503,
				"message" => 'Service temporary unavailable.'
		],
		"data" => [
				'message' => 'This resource is not available at this time.'
		]
];
echo json_encode($response);