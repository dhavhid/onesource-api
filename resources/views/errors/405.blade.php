<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/21/15
 * Time: 12:25 AM
 */
        header('Content-Type: application/json');
        http_response_code(405);
        $response = [
                "info" => [
                        "code" => 405,
                        "message" => 'Method not allowed.'
                ],
                "data" => [
                    'message' => 'This resource is not available.'
                ]
        ];
        echo json_encode($response);