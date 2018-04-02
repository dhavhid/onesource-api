<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\User;
use OneSource\Rol;

use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class RolesController extends Controller {

	protected $apiBody;
    protected $OneSourcehelper;
	protected $rules = [
		'name' => 'required|unique:roles,name,NULL',
        'write' => 'sometimes|boolean'
	];

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
    public function index(Request $request,$id)
    {
        $rol = new Rol();
        $fields = $rol->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($rol->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        if (isset($id)) {
            $user_id = $id;
            $roles = DB::table('roles')->where('user_id',$user_id)->orderBy('name', 'asc')->select($fields)->paginate(Config::get('constants.per_page'));
        } else {
            $roles = DB::table('roles')->orderBy('name', 'asc')->select($fields)->paginate(Config::get('constants.per_page'));
        }

        $body_response = $this->apiBody->setBody($roles, 200, Config::get('constants.200'));
        $body_response['data'] = $roles->values()->toArray();
        return response()->json($body_response, 200);
    }

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
    public function store(Request $request,$id)
    {
        $rol_objects = $request->all();
        if (isset($rol_objects[0])) {
            foreach ($rol_objects as $rol) :
                if (isset($rol['name'])) {
                    $v = \Validator::make($rol, [
                        'name' => 'required|unique:roles,name,NULL,id,user_id,' . $id,
                        'write' => 'sometimes|boolean'
                    ]);
                    if ($v->fails()) {
                        $messages = $v->messages();
                        $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
                        $code = 400;
                        return response()->json($body_response, $code);
                    } else {
                        $new_record = Rol::create($rol);
                        $new_record->user_id = $id;
                        $new_record->save();
                    }
                }
            endforeach;
        } else {
            if (isset($rol_objects['name'])) {
                $v = \Validator::make($rol_objects, [
                    'name' => 'required|unique:roles,name,NULL,id,user_id,' . $id,
                    'write' => 'sometimes|boolean'
                ]);
                if ($v->fails()) {
                    $messages = $v->messages();
                    $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
                    $code = 400;
                    return response()->json($body_response, $code);
                } else {
                    $new_record = Rol::create($rol_objects);
                    $new_record->user_id = $id;
                    $new_record->save();
                }
            }
        }
        $body_response = $this->apiBody->singleResult($new_record, 200, Config::get('constants.200'));
        $code = 200;

        return response()->json($body_response, $code);
    }

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
    public function show(Request $request, $user_id,$id)
    {
        $rol = new Rol();
        $fields = $rol->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($rol->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        $rol = Rol::find($id,$fields);
        if (isset($rol)) {
            $rol->user = User::find($user_id);
            $body_response = $this->apiBody->singleResult($rol, 200, Config::get('constants.200'));
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
    public function update(Request $request, $user_id, $id)
    {
        $update_record = Rol::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(), [
                'name' => 'sometimes|required|unique:roles,name,'.$id.',id,roles,user_id,'.$user_id
            ]);
            if ($v->fails()) {
                $messages = $v->messages();
                $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
                $code = 400;
            } else {
                $update_record->update($request->all(), $id);
                $update_record->user = User::find($user_id);
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
    public function destroy($user_id,$id = null)
    {
        $rol = Rol::find($id);
        if (isset($rol)) {
            $rol->delete();
        }
        $body_response = $this->apiBody->singleResult(['message' => 'The record was deleted successfully.'], 200, Config::get('constants.200'));
        $code = 200;
        return response()->json($body_response, $code);
    }

    public function deleteMany($user_id)
    {
        if (isset($user_id)) {
            DB::table('roles')->where('user_id','=',$user_id)->delete();
            $body_response = $this->apiBody->singleResult(['message' => 'The records were deleted successfully.'], 200, Config::get('constants.200'));
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.users.404')], 404, Config::get('constants.users.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);

    }

    public function search(Request $request, $user_id)
    {
        $var = '%' . $_GET['q'] . '%';

        $rol = new Rol();
        $fields = $rol->fillable;
        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($rol->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        if (strlen($var) > 0) {
            if (isset($user_id)) {
                $results = DB::table('roles')->where('name','ilike',$var)->where('user_id',$user_id)->select($fields)->paginate(10);
            } else {
                $results = DB::table('roles')->where('name','ilike',$var)->select($fields)->paginate(10);
            }
            $body_response = $this->apiBody->setBody($results,200,Config::get('constants.200'));
            $body_response['data'] = $results->values()->toArray();
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.search.404')],404,Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response,$code);
    }

}
