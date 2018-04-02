<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/21/15
 * Time: 12:25 AM
 */
header('Content-Type: application/json');
http_response_code(401);
$response = [
        "info" => [
                "code" => 401,
                "message" => 'You are not authorized to access this resource.'
        ],
        "data" => [
                'message' => 'You are not authorized to access this resource.'
        ]
];
echo json_encode($response);