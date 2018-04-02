<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 6/2/15
 * Time: 10:25 PM
 */

namespace OneSource\ApiResponse;
use Illuminate\Support\Facades\Facade;

class ApiBody extends Facade{
    protected static function getFacadeAccessor() { return 'apiBody'; }
    protected $valid_params = ['q'=>'q','fields'=>'fields'];

    public function setBody($collection,$code,$message)
    {
        if (!$collection) {
            return [
                "info" => [
                    "code" => $code,
                    "message" => $message
                ],
                "pagination" => null
            ];
        }
        // set params if exist.
        $next_page_url = $this->setParams($collection->nextPageUrl());
        $prev_page_url = $this->setParams($collection->previousPageUrl());
        $current_page_url = $this->setCurrentPage($collection);

        return [
            "info" => [
                "code" => $code,
                "message" => $message
            ],
            "pagination" => [
                "per_page" => $collection->perPage(),
                "from" => $collection->firstItem(),
                "to" => $collection->lastItem(),
                "next_page_url" => $next_page_url,
                "prev_page_url" => $prev_page_url,
                "current_request_url" => $current_page_url,
                "total" => $collection->total(),
                "current_page" => $collection->currentPage(),
                "last_page" => $collection->lastPage(),
                "has_more_pages" => $collection->hasMorePages()
            ]
        ];
    }

    public function singleResult($record,$code,$message)
    {
        return [
            "info" => [
                "code" => $code,
                "message" => $message
            ],
            "data" => $record
        ];
    }

    protected function setParams($url)
    {
        if (count($_GET) == 0 || !isset($url))
            return $url;
        $params = $_GET;

        $parsed_params = [];
        foreach($params as $index => $value) {
            if ($index != 'page' && isset($this->valid_params[$index])) {
                array_push($parsed_params, "{$index}={$value}");
            }
        }
        $params = implode('&',$parsed_params);
        if (strpos($url, '?') !== FALSE) {
            $url .= '&' . $params;
        } else {
            $url .= '?' . $params;
        }

        return $url;
    }

    protected function setCurrentPage($collection)
    {
        $next = $collection->nextPageUrl();
        $prev = $collection->previousPageUrl();
        if(!isset($next) && !isset($prev)) {
            return null;
        }
        $current_page = (isset($next))? $next:$prev;
        $current_page = explode('?',$current_page);
        $current_page = $this->setParams($current_page[0] . '?');
        return $current_page;
    }
}