<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\Attorney;
use OneSource\LawOffice;

use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Class AttorneysController
 * @package OneSource\Http\Controllers
 */
class AttorneysController extends Controller {

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
        'name' => 'required|unique:attorneys_doctors,name,NULL,id,is_attorney,1',
        'phone' => 'required',
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
        $attorney = new Attorney();
        $fields = $attorney->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($attorney->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');
        array_push($fields,'requesting_office_id');

        $attorneys = DB::table('attorneys_doctors')->whereNull('deleted_at')->where('is_attorney',1)->orderBy('name','asc')->select($fields)->paginate(Config::get('constants.per_page'));
        $body_response = $this->apiBody->setBody($attorneys,200,Config::get('constants.200'));
        $body_response['data'] = $attorneys->values()->toArray();
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
            $new_record = Attorney::create($request->all());
            $new_record->is_attorney = 1;
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
        $attorney = new Attorney();
        $fields = $attorney->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($attorney->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id','requesting_office_id');

        $attorney = Attorney::find($id,$fields);
        if (isset($attorney)) {
            $attorney->lawoffice = $attorney->requesting_office_id;
            $body_response = $this->apiBody->singleResult($attorney, 200, Config::get('constants.200'));
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
        $update_record = Attorney::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(), [
                'name' => 'sometimes|required|unique:attorneys_doctors,name,'.$id.',id,is_attorney,1',
                'phone' => 'sometimes|required'
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
        $attorney = Attorney::find($id);
        if (isset($attorney)) {
            // validate if a doctor/attorney is on this office.
            if (!$this->hasDependencies($id)) {
                $attorney->delete();
                $body_response = $this->apiBody->singleResult(['message' => 'The record was deleted successfully.'], 200, Config::get('constants.200'));
                $code = 200;
            } else {
                $body_response = $this->apiBody->singleResult(['message' => 'The record could not be deleted because other records depend on it. Please be sure that this Attorney is not a referral to a client before attempting to delete this record again.'], 400, Config::get('constants.400'));
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
            $attorney = Attorney::where('id',$id)->first();;
            if (isset($attorney)) {
                $attorney->delete();
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
        $attorney = new Attorney();
        $fields = $attorney->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($attorney->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        if (strlen($var) > 0) {
            $results = DB::table('attorneys_doctors')->whereNull('deleted_at')->where('is_attorney', '=', 1)->where(function($q){
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
    public function lawoffice(Request $request,$id)
    {
        $attorney = Attorney::find($id);
        if (!isset($attorney)) {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.404')], 404, Config::get('constants.404'));
            return response()->json($body_response, 404);
        }
        $lawoffice = new LawOffice();
        $fields = $lawoffice->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($lawoffice->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        $lawoffice = LawOffice::find($attorney->requesting_office_id,$fields);
        if (isset($lawoffice)) {
            $body_response = $this->apiBody->singleResult($lawoffice, 200, Config::get('constants.200'));
        } else { $body_response = null; }
        return response()->json($body_response, 200);
    }
}