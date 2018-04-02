<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\Reason;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Class ConfirmationsController
 * @package OneSource\Http\Controllers
 */
class ConfirmationsController extends Controller {

    /**
     * @var ApiBody
     */
    protected $apiBody;
    /**
     * @var array
     */
    protected $rules = [
		'name' => 'required'
	];

    /**
     * @param ApiBody $apiBody
     */
    public function __construct(ApiBody $apiBody)
    {
        $this->apiBody = $apiBody;
    }

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
    public function index()
    {
        $reasons = DB::table('reasons')->where('is_confirmation',1)->whereNull('deleted_at')->orderBy('name','asc')->select('id','name')->paginate(Config::get('constants.per_page'));
        $body_response = $this->apiBody->setBody($reasons,200,Config::get('constants.200'));
        $body_response['data'] = $reasons->values()->toArray();
        return response()->json($body_response,200);
    }

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
    public function store(Request $request)
    {
        $v = \Validator::make($request->all(),$this->rules);

        if ($v->fails()) {
            $messages = $v->messages();
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400'),'validation_errors'=>$messages],400,Config::get('constants.400'));
            $code = 400;
        } else {
            $new_record = new Reason();
            $new_record->name = $request->input('name');
            $new_record->is_confirmation = 1;
            $new_record->save();
            $body_response = $this->apiBody->singleResult($new_record,200,Config::get('constants.200'));
            $code = 200;
        }
        return response()->json($body_response,$code);
    }

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
    public function show($id)
    {
        $reason = Reason::find($id);
        if (isset($reason)) {
            $body_response = $this->apiBody->singleResult($reason,200,Config::get('constants.200'));
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.404')],404,Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response,$code);
    }

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
    public function update(Request $request, $id)
    {
        $update_record = Reason::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(),$this->rules);
            if ($v->fails()) {
                $messages = $v->messages();
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400'),'validation_errors'=>$messages],400,Config::get('constants.400'));
                $code = 400;
            } else {
                $update_record->name = $request->input('name');
                $update_record->save();
                $body_response = $this->apiBody->singleResult($update_record,200,Config::get('constants.200'));
                $code = 200;
            }
        } else {
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.404')],404,Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response,$code);
    }

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
    public function destroy($id)
    {
        $reason = Reason::find($id);
        if (isset($reason)) {
            $reason->delete();
            $body_response = $this->apiBody->singleResult(['message'=>'The record was deleted successfully.'],200,Config::get('constants.200'));
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.404')],404,Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response,$code);
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function massiveDestroy(Request $request)
    {
        $data = $request->input('data');
        $data = (array)explode(',',$data);
        $code = 200;
        foreach ($data as $id) {
            $reason = Reason::where('id',$id)->first();;
            if (isset($reason)) {
                $reason->delete();
            } else {
                $code = 404;
            }
        }
        if ($code == 200) {
            $body_response = $this->apiBody->singleResult(['message'=>'The records were deleted successfully.'],200,Config::get('constants.200'));
        } else {
            $body_response = $this->apiBody->singleResult(['message'=>'Some of the records could not be deleted at this time. Please try later.'],240,Config::get('constants.400'));
            $code = 400;
        }
        return response()->json($body_response,$code);
    }

    /**
     * @return Response
     */
    public function search(Request $request)
    {
        $var = '%' . $_GET['q'] . '%';
        $GLOBALS['q'] = $var;
        if ($request->has('fields')) {
            $fields = $request->input('fields');
            $fields = explode(',',$fields);
        } else {
            $reason = new Reason();
            $fields = $reason->fillable;
            array_push($fields,'id');
        }
        if (strlen($var) > 0) {
            $results = DB::table('reasons')->where('name','ilike',$GLOBALS['q'])->whereNull('deleted_at')->where('is_confirmation','=',1)->select($fields)->paginate(10);
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
