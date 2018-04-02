<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\Clinic;
use OneSource\Doctor;

use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use PhpParser\Comment\Doc;

/**
 * Class ClinicsController
 * @package OneSource\Http\Controllers
 */
class ClinicsController extends Controller {

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
        //'address1' => 'required',
        'city' => 'required',
        'zipcode' => 'required|max:5',
        //'phone' => 'required',
        'contact' => 'required',
        'email' => 'sometimes|email'
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

        $reasons = DB::table('requesting_offices')->whereNull('deleted_at')->where('is_clinic','=',1)->orderBy('name', 'asc')->select($fields)->paginate(Config::get('constants.per_page'));
        $body_response = $this->apiBody->setBody($reasons, 200, Config::get('constants.200'));
        $body_response['data'] = $reasons->values()->toArray();
        return response()->json($body_response, 200);
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
            $new_record = Clinic::create($request->all());
            $new_record->is_lawoffice = 0;
            $new_record->is_clinic = 1;
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

        $clinic = Clinic::find($id,$fields);
        if (isset($clinic)) {
            $body_response = $this->apiBody->singleResult($clinic, 200, Config::get('constants.200'));
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
        $update_record = Clinic::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(), [
                'name' => 'sometimes|required',
                //'address1' => 'sometimes|required',
                'city' => 'sometimes|required',
                'zipcode' => 'sometimes|required|max:5',
                //'phone' => 'sometimes|required',
                'contact' => 'sometimes|required',
                'email' => 'sometimes|email'
            ]);
            if ($v->fails()) {
                $messages = $v->messages();
                $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
                $code = 400;
            } else {
                $update_record->update($request->all(), $id);
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
        $clinic = Clinic::find($id);
        if (isset($clinic)) {
            // validate if a doctor/attorney is on this office.
            if (!$this->hasDependencies($id)) {
                $clinic->delete();
                $body_response = $this->apiBody->singleResult(['message' => 'The record was deleted successfully.'], 200, Config::get('constants.200'));
                $code = 200;
            } else {
                $body_response = $this->apiBody->singleResult(['message' => 'The record could not be deleted because other records depend on it. Please be sure that this Clinic is not a referral to a client or has doctors attached to it before attempting to delete this record again.'], 400, Config::get('constants.400'));
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
            $clinic = Clinic::where('id',$id)->first();
            if (isset($clinic)) {
                $clinic->delete();
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

        if (strlen($var) > 0) {
            $results = DB::table('requesting_offices')->where('is_clinic', '=', 1)->whereNull('deleted_at')->where(function($q){
                $q->where('name', 'ilike', $GLOBALS['q']);
                $q->orWhere('contact','ilike', $GLOBALS['q']);
                $q->orWhere('city','ilike', $GLOBALS['q']);
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
        $attorney = DB::table('attorneys_doctors')->where('requesting_office_id','=',$id)->select('id')->get();
        $referral = DB::table('clients')->where('referral_source_id','=',$id)->orWhere('insurance_company_id','=',$id)->orWhere('clinic_id','=',$id)->get();
        if (count($attorney) > 0 || count($referral) > 0)
            return true;
        else return false;
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function doctors(Request $request, $id)
    {
        $clinic = Clinic::find($id);
        if (!isset($clinic)) {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.404')], 404, Config::get('constants.404'));
            return response()->json($body_response, 404);
        }
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

        $doctors = DB::table('attorneys_doctors')->whereNull('deleted_at')->where('requesting_office_id',$id)->select($fields)->get();
        if (isset($doctors)) {
            $body_response = $this->apiBody->singleResult($doctors, 200, Config::get('constants.200'));
        } else {
            $body_response = $this->apiBody->singleResult([], 200, Config::get('constants.200'));
        }
        return response()->json($body_response, 200);
    }
}
