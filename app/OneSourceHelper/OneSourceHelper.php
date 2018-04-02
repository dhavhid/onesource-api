<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/25/15
 * Time: 3:02 PM
 */

namespace OneSource\OneSourceHelper;
use Illuminate\Support\Facades\Facade;

class OneSourceHelper extends Facade{

    protected static function getFacadeAccessor() { return 'OneSourceHelper'; }

    public function checkModelFields($model_fields,$requested_fields)
    {
        foreach($requested_fields as $field) {
            if (!isset($model_fields["{$field}"])) {
                return false;
            }
        }
        return true;
    }

    public function getAccessToken($request)
    {
        $authorization_header = $request->header('Authorization');
        // or in the request.
        if (!isset($authorization_header)) {
            // look for it in the request.
            if ($request->has('access_token')) {
                $authorization_header = 'Bearer ' . $request->input('access_token');
            } else {
                return null;
            }
        }

        if (strlen($authorization_header) > 0) {
            $bearer_at = explode(' ',$authorization_header);
            $access_token = $bearer_at[1];
        } else {
            return null;
        }
        return $access_token;
    }
}