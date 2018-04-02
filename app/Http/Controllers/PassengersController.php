<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\Passenger;
use OneSource\Client;

use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class PassengersController extends Controller {

    protected $apiBody;
    protected $OneSourcehelper;
    protected $rules = [
        'name' => 'required',
        'dob' => 'sometimes|date',
        'appt_date' => 'sometimes|date'
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
        $passenger = new Passenger();
        $fields = $passenger->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($passenger->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        if (isset($id)) {
            $client_id = $id;
            $passengers = DB::table('passengers')->where('client_id','=',$client_id)->orderBy('name', 'asc')->select($fields)->paginate(Config::get('constants.per_page'));
        } else {
            $passengers = DB::table('passengers')->orderBy('name', 'asc')->select($fields)->paginate(Config::get('constants.per_page'));
        }

        $body_response = $this->apiBody->setBody($passengers, 200, Config::get('constants.200'));
        $body_response['data'] = $passengers->values()->toArray();
        return response()->json($body_response, 200);
    }

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
    public function store(Request $request,$id)
    {
        $v = \Validator::make($request->all(), $this->rules);

        if ($v->fails()) {
            $messages = $v->messages();
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
            $code = 400;
        } else {
            $new_record = Passenger::create($request->all());
            $new_record->client_id = $id;
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
    public function show(Request $request, $client_id,$id)
    {
        $passenger = new Passenger();
        $fields = $passenger->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($passenger->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        $passenger = Passenger::find($id,$fields);
        if (isset($passenger)) {
            $passenger->client = Client::find($client_id);
            $body_response = $this->apiBody->singleResult($passenger, 200, Config::get('constants.200'));
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
    public function update(Request $request, $client_id, $id)
    {
        $update_record = Passenger::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(), [
                'name' => 'sometimes|required|unique:passengers,name,'.$id,
                'dob' => 'sometimes|date',
                'appt_date' => 'sometimes|date'
            ]);
            if ($v->fails()) {
                $messages = $v->messages();
                $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
                $code = 400;
            } else {
                $update_record->update($request->all(), $id);
                $update_record->client = Client::find($client_id);
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
    public function destroy($client_id,$id)
    {
        $passenger = Passenger::find($id);
        if (isset($passenger)) {
            $passenger->delete();
            $body_response = $this->apiBody->singleResult(['message' => 'The record was deleted successfully.'], 200, Config::get('constants.200'));
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.404')], 404, Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);
    }

    public function search(Request $request, $client_id)
    {
        $var = '%' . $_GET['q'] . '%';
        $passenger = new Passenger();
        $fields = $passenger->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($passenger->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        if (strlen($var) > 0) {
            if (isset($client_id)) {
                $results = DB::table('passengers')->where('name','ilike',$var)->where('client_id',$client_id)->select($fields)->paginate(10);
            } else {
                $results = DB::table('passengers')->where('name','ilike',$var)->select($fields)->paginate(10);
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
