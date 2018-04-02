<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use LucaDegasperi\OAuth2Server\Authorizer;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use OneSource\OneSourceHelper\OneSourceHelper;
use OneSource\User;
use Carbon\Carbon;

class SessionsController extends Controller {

	protected $apiBody;
    protected $authorizer;

    public function __construct(Authorizer $authorizer, ApiBody $apiBody)
    {
        $this->authorizer = $authorizer;
        $this->apiBody = $apiBody;
    }

    public function login(Request $request)
    {
        $result = $this->authorizer->issueAccessToken();
        $rightnow = Carbon::now()->toDateTimeString();
        if (isset($result['access_token'])) {
            $user = DB::table('oauth_sessions')
                ->join('oauth_access_tokens','oauth_access_tokens.session_id','=','oauth_sessions.id')
                ->where('oauth_access_tokens.id','=',$result['access_token'])
                ->select('oauth_sessions.owner_id')
                ->first();
            DB::table('sessions')->insert([
                'start_time' => date('Y-m-d G:i:s'),
                'end_time' => date('Y-m-d G:i:s'),
                'ip' => $request->getClientIp(),
                'is_closed' => 0,
                'access_token' => $result['access_token'],
                'user_id' => $user->owner_id,
                'checkin' => $rightnow,
                'created_at' => $rightnow,
                'updated_at' => $rightnow
            ]);
        }
        return response()->json($result);
    }

    public function logout(Request $request, OneSourceHelper $oneSourceHelper)
    {
        $access_token = $oneSourceHelper->getAccessToken($request);
        if ($access_token === false) {
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.401')],401,Config::get('constants.user.401'));
            return response()->json($body_response,401);
        }

        $expires_in = strtotime(date('Y-m-d G:i:s')) - 3600;
        DB::table('sessions')->where('access_token','=',$access_token)->update(['is_closed'=>1,'end_time'=>date('Y-m-d G:i:s')]);
        DB::table('oauth_access_tokens')->where('id','=',$access_token)->update(['expire_time'=>$expires_in]);
        $body_response = $this->apiBody->singleResult(['message'=>'You have been logged out.'],200,Config::get('constants.200'));
        return response()->json($body_response,200);
    }

    public function access(Request $request, OneSourceHelper $oneSourceHelper)
    {
        $access_token = $oneSourceHelper->getAccessToken($request);
        if ($access_token === false) {
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.401')],401,Config::get('constants.user.401'));
            return response()->json($body_response,401);
        }

        // check first if user is admin
        $user = DB::table('users')->join('sessions','sessions.user_id','=','users.id')->where('sessions.access_token','=',$access_token)->select('users.id','name','email','is_admin')->first();
        if ($user->is_admin == 1) {
            $roles = [['name' => 'Body Parts', 'write' => 1],
                    ['name' => 'Regions', 'write' => 1],
                    ['name' => 'Reasons to Confirm', 'write' => 1],
                    ['name' => 'Reasons to Cancel', 'write' => 1],
                    ['name' => 'Law Offices', 'write' => 1],
                    ['name' => 'Clinics', 'write' => 1],
                    ['name' => 'Insurance Companies', 'write' => 1],
                    ['name' => 'Attorneys', 'write' => 1],
                    ['name' => 'Doctors', 'write' => 1],
                    ['name' => 'Clients', 'write' => 1],
                    ['name' => 'Users', 'write' => 1],
                    ['name' => 'Searches', 'write' => 1],
                    ['name' => 'Reports', 'write' => 1]];
            $body_response = $this->apiBody->singleResult($roles,200,Config::get('constants.200'));
            $body_response['user'] = $user;
            return response()->json($body_response,200);
        }

        // get the user roles.
        $roles = DB::table('roles')
            ->join('sessions','roles.user_id','=','sessions.user_id')
            ->where('sessions.access_token','=',$access_token)
            ->select('roles.name','roles.write')
            ->get();

        $body_response = $this->apiBody->singleResult($roles,200,Config::get('constants.200'));
        $body_response['user'] = $user;
        return response()->json($body_response,200);
    }

}
