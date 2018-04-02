<?php namespace OneSource\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\User;
use OneSource\Rol;
use OneSource\Session;
use OneSource\Activity;

use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Class UsersController
 * @package OneSource\Http\Controllers
 */
class UsersController extends Controller {

    /**
     * @var ApiBody
     */
    protected $apiBody;
    /**
     * @var OneSourceHelper
     */
    protected $OneSourcehelper;
    /**
     * @var array
     */
    protected $rules = [
        'name' => 'required',
        'email' => 'required|email|unique:users,email',
        'password' => 'required|min:6|max:16|alpha_num'
    ];
    protected $expiration_interval = ['1 day from now'=>1,'1 week from now'=>1,'1 month from now'=>1];
    /**
     * @var string
     */
    protected $select_users = "users.id, users.name, users.email, users.is_admin, case
when (select checkin from sessions where user_id = users.id order by checkin desc limit 1) >= (select updated_at from clients where updated_by = users.id order by updated_at desc limit 1)
then (select to_char(checkin,'Mon DD, YYYY HH12:MI AM') from sessions where user_id = users.id order by checkin desc limit 1)
when (select checkin from sessions where user_id = users.id order by checkin desc limit 1) ISNULL
then (select to_char(updated_at,'Mon DD, YYYY HH12:MI AM') from clients where updated_by = users.id order by updated_at desc limit 1)
when (select updated_at from clients where updated_by = users.id order by updated_at desc limit 1) ISNULL
then (select to_char(checkin,'Mon DD, YYYY HH12:MI AM') from sessions where user_id = users.id order by checkin desc limit 1)
else (select to_char(updated_at,'Mon DD, YYYY HH12:MI AM') from clients where updated_by = users.id order by updated_at desc limit 1)
end as last_seen";

    /**
     * @param ApiBody $apiBody
     */
    public function __construct(ApiBody $apiBody)
    {
        $this->apiBody = $apiBody;
        $this->OneSourcehelper = new OneSourceHelper();
    }
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
    public function index(Request $request)
    {
        $user = new User();
        $fields = $user->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($user->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        $users = DB::table('users')->whereNull('deleted_at')->orderBy('name','asc')->select(DB::raw($this->select_users))->paginate(Config::get('constants.per_page'));
        $body_response = $this->apiBody->setBody($users,200,Config::get('constants.200'));
        $body_response['data'] = $users->values()->toArray();
        return response()->json($body_response,200);
    }

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
    public function store(Request $request)
    {
        $v = \Validator::make($request->all(), $this->rules);

        if ($v->fails()) {
            $messages = $v->messages();
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
            $code = 400;
        } else {
            $user_data = $request->all();
            if (isset($user_data['expiration']) && $user_data['expiration'] == '1 day from now') {
                $user_data['expiration'] = Carbon::now()->addDay()->toDateString();
            } elseif (isset($user_data['expiration']) && $user_data['expiration'] == '1 week from now') {
                $user_data['expiration'] = Carbon::now()->addWeek()->toDateString();
            } elseif (isset($user_data['expiration']) && $user_data['expiration'] == '1 month from now') {
                $user_data['expiration'] = Carbon::now()->addMonth()->toDateString();
            } elseif (isset($user_data['expiration'])) {
                unset($user_data['expiration']);
            }
            $new_record = User::create($user_data);
            $new_record->password = Hash::make($request->input('password'));
            $new_record->save();
            $body_response = $this->apiBody->singleResult($new_record, 200, Config::get('constants.200'));
            $code = 200;
        }
        return response()->json($body_response, $code);
    }

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
    public function show(Request $request, $id)
    {
        $user = new User();
        $fields = $user->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($user->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        $user = User::find($id,$fields);
        if (isset($user)) {
            $rol = new Rol();
            $fields = $rol->fillable;
            array_unshift($fields,'id');
            $user->roles = DB::table('roles')->where('user_id','=',$user->id)->select($fields)->get();
            $body_response = $this->apiBody->singleResult($user, 200, Config::get('constants.200'));
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.404')], 404, Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);
    }

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
    public function update(Request $request, $id)
    {
        $update_record = User::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(), [
                'name' => 'sometimes|required',
                'email' => 'sometimes|required|email|unique:users,name,'.$id,
                'password' => 'sometimes|required|min:6|max:16|alpha_num'
            ]);
            if ($v->fails()) {
                $messages = $v->messages();
                $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
                $code = 400;
            } else {
                $user_data = $request->all();
                if (isset($user_data['expiration']) && $user_data['expiration'] == '1 day from now') {
                    $user_data['expiration'] = Carbon::now()->addDay()->toDateString();
                } elseif (isset($user_data['expiration']) && $user_data['expiration'] == '1 week from now') {
                    $user_data['expiration'] = Carbon::now()->addWeek()->toDateString();
                } elseif (isset($user_data['expiration']) && $user_data['expiration'] == '1 month from now') {
                    $user_data['expiration'] = Carbon::now()->addMonth()->toDateString();
                } elseif (isset($user_data['expiration']) && $user_data['expiration'] == 'revoke access') {
                    $user_data['expiration'] = Carbon::now()->subDay()->toDateString();
                    $session = DB::table('sessions')->where('user_id','=',$id)->select('access_token')->orderBy('id','desc')->first();
                    if (isset($session->access_token)) {
                        $access_token = $session->access_token;
                        $expires_in = strtotime(date('Y-m-d G:i:s')) - 3600;
                        DB::table('sessions')->where('access_token','=',$access_token)->update(['is_closed'=>1,'end_time'=>date('Y-m-d G:i:s')]);
                        DB::table('oauth_access_tokens')->where('id','=',$access_token)->update(['expire_time'=>$expires_in]);
                    }
                } elseif (isset($user_data['expiration']) && $user_data['expiration'] == 'never') {
                    $user_data['expiration'] = null;
                } elseif (isset($user_data['expiration'])) {
                    unset($user_data['expiration']);
                }
                $update_record->update($user_data, $id);
                if ($request->has('password')) {
                    $update_record->password = Hash::make($request->input('password'));
                }
                if ($request->has('remember_token')) {
                    $update_record->remember_token = $request->input('remember_token');
                }
                $update_record->save();
                $body_response = $this->apiBody->singleResult($update_record, 200, Config::get('constants.200'));
                $code = 200;
            }
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.404')], 404, Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);
    }

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
    public function destroy($id)
    {
        $user = User::find($id);
        if (isset($user)) {
            // validate if a doctor/attorney is on this office.
            if (true) {
                // delete sessions
                //Session::where('user_id',$id)->delete();
                // delete logs
                //Activity::where('user_id',$id)->delete();
                // delete roles
                //Rol::where('user_id',$id)->delete();
                $user->delete();
                $body_response = $this->apiBody->singleResult(['message' => 'The record was deleted successfully.'], 200, Config::get('constants.200'));
                $code = 200;
            } else {
                $body_response = $this->apiBody->singleResult(['message' => 'The record could not be deleted because other records depend on it.'], 400, Config::get('constants.400'));
                $code = 400;
            }
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.404')], 404, Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);
    }

    /**
     * @return Response
     */
    public function search(Request $request)
    {
        $var = '%' . $_GET['q'] . '%';
        $GLOBALS['q'] = $var;
        $user = new User();
        $fields = $user->fillable;
        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($user->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        if (strlen($var) > 0) {
            $results = DB::table('users')->whereNull('deleted_at')->where('name', 'ilike', $GLOBALS['q'])->orWhere('email','ilike',$GLOBALS['q'])->select($fields)->paginate(10);
            $body_response = $this->apiBody->setBody($results, 200, Config::get('constants.200'));
            $body_response['data'] = $results->values()->toArray();
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.search.404')], 404, Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);
    }

}
