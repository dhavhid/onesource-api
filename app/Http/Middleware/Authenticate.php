<?php namespace OneSource\Http\Middleware;

use Closure;
use OneSource\User;
use OneSource\Rol;
use OneSource\ApiResponse\ApiBody;
use OneSource\OneSourceHelper\OneSourceHelper;
use Illuminate\Support\Facades\DB;
use OneSource\Session;
use Carbon\Carbon;

use Illuminate\Support\Facades\Config;
use LucaDegasperi\OAuth2Server\Authorizer;
use Illuminate\Contracts\Auth\Guard;

class Authenticate {

	/**
	 * The Guard implementation.
	 *
	 * @var Guard
	 */
	protected $auth;
    protected $apiBody;
    protected $authorizer;

	/**
	 * Create a new filter instance.
	 *
	 * @param  Guard  $auth
	 * @return void
	 */
	public function __construct(Guard $auth, Authorizer $authorizer, ApiBody $apiBody)
	{
		$this->auth = $auth;
        $this->authorizer = $authorizer;
        $this->apiBody = $apiBody;
	}

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
        $helper = new OneSourceHelper();
        $owner_type = $this->authorizer->getResourceOwnerType();
		$owner_id = $this->authorizer->getResourceOwnerId();
        // checkin
        $access_token = $helper->getAccessToken($request);
        $session = Session::where('access_token','=',$access_token)->first();
        if ($session) {
            $session->checkin = Carbon::now()->toDateTimeString();
            $session->save();
        } else {
            $expires_in = strtotime(date('Y-m-d G:i:s')) - 3600;
            DB::table('oauth_access_tokens')->where('id','=',$access_token)->update(['expire_time'=>$expires_in]);
            $error = $this->apiBody->singleResult(['message' => Config::get('constants.user.401')], 401, Config::get('constants.user.401'));
            return response()->json($error, 401);
        }
        $actions = $request->route()->getAction();
        if (isset($actions['resource'])) {
            $user = User::where('id','=',$owner_id)->first();
            if ($user->is_admin != 1) {
                // find out if the user has rights to perform this action.
                if (isset($actions['write']) && $actions['write'] == 1) {
                    $rol = Rol::where('name', $actions['resource'])->where('write', 1)->where('user_id', $owner_id)->count();
                } else {
                    $rol = Rol::where('name', $actions['resource'])->where('user_id', $owner_id)->count();
                }
                if ($rol < 1) {
                    $error = $this->apiBody->singleResult(['message' => Config::get('constants.user.403')], 403, Config::get('constants.user.403'));
                    return response()->json($error, 403);
                }
            }
        }
        return $next($request);
	}

}
