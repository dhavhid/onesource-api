<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/21/15
 * Time: 12:25 AM
 */
header('Content-Type: application/json');
http_response_code(404);
$response = [
        "info" => [
                "code" => 404,
                "message" => 'Not found.'
        ],
        "data" => [
                'message' => 'Not Found.'
        ]
];
echo json_encode($response);