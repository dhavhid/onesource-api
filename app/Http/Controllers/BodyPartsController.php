<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\BodyPart;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

class BodyPartsController extends Controller {

    protected $apiBody;
    protected $rules = [
        'name' => 'required|unique:bodyparts'
    ];

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
		$bodyparts = DB::table('bodyparts')->orderBy('name','asc')->select('id','name')->paginate(Config::get('constants.per_page'));
        $body_response = $this->apiBody->setBody($bodyparts,200,Config::get('constants.200'));
        $body_response['data'] = $bodyparts->values()->toArray();
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
            $new_record = new BodyPart();
            $new_record->name = $request->input('name');
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
		$bodypart = BodyPart::find($id);
        if (isset($bodypart)) {
            $body_response = $this->apiBody->singleResult($bodypart,200,Config::get('constants.200'));
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
        $update_record = BodyPart::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(),[
                'name' => 'required|unique:bodyparts,name,'.$id
            ]);
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
		$bodypart = BodyPart::find($id);
        if (isset($bodypart)) {
            $bodypart->delete();
            $body_response = $this->apiBody->singleResult(['message'=>'The record was deleted successfully.'],200,Config::get('constants.200'));
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.404')],404,Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response,$code);
	}

    public function massiveDestroy(Request $request)
    {
        $data = $request->input('data');
        $data = explode(',',$data);
        $code = 200;
        foreach ($data as $id) {
            $bodypart = BodyPart::where('id',$id)->first();;
            if (isset($bodypart)) {
                $bodypart->delete();
            } else {
                $code = 404;
            }
        }
        if ($code == 200) {
            $body_response = $this->apiBody->singleResult(['message'=>'The records were deleted successfully.'],200,Config::get('constants.200'));
        } else {
            $body_response = $this->apiBody->singleResult(['message'=>'Some of the records could not be deleted at this time. Please try later.'],400,Config::get('constants.400'));
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
            $bodypart = new BodyPart();
            $fields = $bodypart->fillable;
            array_push($fields,'id');
        }
        if (strlen($var) > 0) {
            $results = DB::table('bodyparts')->where('name','ilike',$GLOBALS['q'])->select($fields)->paginate(10);
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
