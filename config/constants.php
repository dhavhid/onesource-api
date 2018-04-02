<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/20/15
 * Time: 6:52 PM
 */
return [
    'per_page' => 100,
    '200' => 'Success!',
    '400' => 'Bad Request!',
    '500' => 'Internal Server Error!',
    '404' => 'Resource Not Found.',
    '401' => 'Unauthorized.',
    '405' => 'This resource is not available.',
    '403' => 'You are not authorized to access this resource. Please contact the administrator if you think this is an error.',
    'user' => [
        '400' => 'There are some errors in your request.',
        '401' => 'You are not authorized to access this resource.',
        '403' => 'You are not authorized to access this resource. Please contact the administrator if you think this is an error.',
        '503' => 'You are not authorized to access this resource. Please contact the administrator if you think this is an error.',
        '404' => 'Record not found. Please verify that the record exists.'
    ],
    'search' => [
        '404' => 'Your search thrown no results.',
        '405' => 'This resource is not available. Try a GET request instead.'
    ],
    'modules' => [
        'Body Parts',
        'Regions',
        'Confirmations',
        'Cancelations',
        'LawOffices',
        'Clinics',
        'Insurance Companies',
        'Attorneys',
        'Doctors',
        'Clients',
        'Users',
        'Reports',
        'Search',
        'Activity',
        'Profile'
    ],
    'domain' => 'api.callcenter.local',
    'appname' => 'OneSource Scheduling'
];