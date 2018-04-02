<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\Doctor;
use OneSource\Clinic;

use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Class DoctorsController
 * @package OneSource\Http\Controllers
 */
class DoctorsController extends Controller {

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
        'name' => 'required|unique:attorneys_doctors,name,NULL,id,is_attorney,0',
        'phone' => 'required',
        'email' => 'sometimes|email',
        'requesting_office_id' => 'required'
    ];

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
        $doctor = new Doctor();
        $fields = $doctor->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($doctor->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');
        array_push($fields,'requesting_office_id');

        $doctors = DB::table('attorneys_doctors')->whereNull('deleted_at')->where('is_attorney',0)->orderBy('name','asc')->select($fields)->paginate(Config::get('constants.per_page'));
        $body_response = $this->apiBody->setBody($doctors,200,Config::get('constants.200'));
        $body_response['data'] = $doctors->values()->toArray();
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
            $new_record = Doctor::create($request->all());
            $new_record->is_attorney = 0;
            $new_record->requesting_office_id = $request->input('requesting_office_id');
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
        $doctor = new Doctor();
        $fields = $doctor->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($doctor->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id','requesting_office_id');

        $doctor = Doctor::find($id,$fields);
        if (isset($doctor)) {
            $doctor->clinic = $doctor->requesting_office_id;
            $body_response = $this->apiBody->singleResult($doctor, 200, Config::get('constants.200'));
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
        $update_record = Doctor::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(), [
                'name' => 'sometimes|required|unique:attorneys_doctors,name,'.$id.',id,is_attorney,0',
                'phone' => 'sometimes|required',
                'requesting_office_id' => 'sometimes|required'
            ]);
            if ($v->fails()) {
                $messages = $v->messages();
                $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
                $code = 400;
            } else {
                $update_record->update($request->all(), $id);
                $update_record->requesting_office_id = $request->input('requesting_office_id');
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
        $doctor = Doctor::find($id);
        if (isset($doctor)) {
            // validate if a doctor/attorney is on this office.
            if (!$this->hasDependencies($id)) {
                $doctor->delete();
                $body_response = $this->apiBody->singleResult(['message' => 'The record was deleted successfully.'], 200, Config::get('constants.200'));
                $code = 200;
            } else {
                $body_response = $this->apiBody->singleResult(['message' => 'The record could not be deleted because other records depend on it. Please be sure that this Doctor is not a referral to a client before attempting to delete this record again.'], 400, Config::get('constants.400'));
                $code = 400;
            }
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.404')], 404, Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function massiveDestroy(Request $request)
    {
        $data = $request->input('data');
        $data = explode(',',$data);
        $code = 200;
        foreach ($data as $id) {
            $doctor = Doctor::where('id',$id)->first();;
            if (isset($doctor)) {
                $doctor->delete();
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
     * @param Request $request
     * @return mixed
     */
    public function search(Request $request)
    {
        $var = '%' . $_GET['q'] . '%';
        $GLOBALS['q'] = $var;

        $doctor = new Doctor();
        $fields = $doctor->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($doctor->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        if (strlen($var) > 0) {
            $results = DB::table('attorneys_doctors')->whereNull('deleted_at')->where('is_attorney', '=', 0)->where(function($q){
                $q->where('name', 'ilike', $GLOBALS['q']);
                $q->orWhere('phone','ilike', $GLOBALS['q']);
            })->select($fields)->paginate(10);
            $body_response = $this->apiBody->setBody($results, 200, Config::get('constants.200'));
            $body_response['data'] = $results->values()->toArray();
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.search.404')], 404, Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);
    }

    /**
     * @param $id
     * @return bool
     */
    protected function hasDependencies($id)
    {
        return false;
        $referral = DB::table('clients')->where('attorney_id','=',$id)->orWhere('doctor_id','=',$id)->get();
        if (count($referral) > 0)
            return true;
        else return false;
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function clinic(Request $request,$id)
    {
        $doctor = Doctor::find($id);
        if (!isset($doctor)) {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.404')], 404, Config::get('constants.404'));
            return response()->json($body_response, 404);
        }
        $clinic = new Clinic();
        $fields = $clinic->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($clinic->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        $clinic = Clinic::find($doctor->requesting_office_id,$fields);
        if (isset($clinic)) {
            $body_response = $this->apiBody->singleResult($clinic, 200, Config::get('constants.200'));
        } else { $lawoffice = null; }
        return response()->json($body_response, 200);
    }

}
