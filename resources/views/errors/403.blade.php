<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/21/15
 * Time: 12:25 AM
 */
header('Content-Type: application/json');
http_response_code(403);
$response = [
        "info" => [
                "code" => 403,
                "message" => 'You are not authorized to access this resource. Please contact the administrator if you think this is an error.'
        ],
        "data" => [
                'message' => 'You are not authorized to access this resource. Please contact the administrator if you think this is an error.'
        ]
];
echo json_encode($response);