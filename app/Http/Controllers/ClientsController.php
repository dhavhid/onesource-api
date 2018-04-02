<?php namespace OneSource\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\View;
use LucaDegasperi\OAuth2Server\Authorizer;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\Client;
use OneSource\Passenger;
use OneSource\Region;
use OneSource\LawOffice;
use OneSource\Attorney;
use OneSource\Reason;
use OneSource\Activity;
use OneSource\ViewReport;

use OneSource\User;
use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Class ClientsController
 * @package OneSource\Http\Controllers
 */
class ClientsController extends Controller {

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
        'date_of_referral' => 'required|date',
        'date_received' => 'required|date',
        'case_type' => 'required',
        'firstname' => 'required',
        'lastname' => 'required',
        'dob' => 'required|date',
        'phone' => 'required',
        'address' => 'required',
        'city' => 'required',
        'zipcode' => 'required|max:5',
        'doi' => 'required'
        //'body_parts' => 'required'
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
        $client = new Client();
        $fields = $client->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($client->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        foreach($fields as $field) {
            $f[] = 'clients.' . $field;
        }
        $fields = $f;
        $extra_fields = ['clinics.name as clinic_name','clinics.address1 as clinic_address1','clinics.address2 as clinic_address2','clinics.city as clinic_city','doctors.name as doctor_name','attorneys.name as attorney_name'];
        $fields = array_merge($fields,$extra_fields);
        $clients = DB::table('clients')
            ->join('requesting_offices AS clinics','clinics.id','=','clients.clinic_id')
            ->join('attorneys_doctors AS doctors','doctors.id','=','clients.doctor_id')
            ->join('attorneys_doctors AS attorneys','attorneys.id','=','clients.attorney_id')
            ->select($fields)
            ->paginate(Config::get('constants.per_page'));
        $body_response = $this->apiBody->setBody($clients, 200, Config::get('constants.200'));
        $body_response['data'] = $clients->values()->toArray();
        return response()->json($body_response, 200);
    }

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
    public function store(Request $request, Authorizer $authorizer)
    {
        $v = \Validator::make($request->all(), $this->rules);

        if ($v->fails()) {
            $messages = $v->messages();
            //$messages = $this->parseErrors($messages);
            // parse validation errors
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
            $code = 400;
        } else {
            $user_id = $authorizer->getResourceOwnerId();
            $user = User::where('id',$user_id)->first();
            $new = $request->all();
            if (isset($new['tmp_attorney_notes']) && strlen($new['tmp_attorney_notes']) > 10) {
                $new['attorney_notes'] = "<p>-----[" . Carbon::now()->format('M-d-y h:i A') . " " . $user->name . "]-----</p><p>{$new['tmp_attorney_notes']}</p>";
                unset($new['tmp_attorney_notes']);
            }
            if (isset($new['tmp_clinic_notes']) && strlen($new['tmp_clinic_notes']) > 10) {
                $new['clinic_notes'] = "<p>-----[" . Carbon::now()->format('M-d-y h:i A') . " " . $user->name . "]-----</p><p>{$new['tmp_clinic_notes']}</p>";
                unset($new['tmp_clinic_notes']);
            }
            $new_record = Client::create($new);
            $new_record->region_id = $request->input('region_id');
            $new_record->referral_source_id = $request->input('referral_source_id');
            $new_record->attorney_id = $request->input('attorney_id');
            if ($request->has('clinic_id')) {
                $new_record->clinic_id = $request->input('clinic_id');
            }
            if ($request->has('doctor_id')) {
                $new_record->doctor_id = $request->input('doctor_id');
            }
            if ($request->has('appt_confirmed_id')) {
                $new_record->appt_confirmed_id = $request->input('appt_confirmed_id');
            }
            if ($request->has('appt_reason_cancel_id')) {
                $new_record->appt_reason_cancel_id = $request->input('appt_reason_cancel_id');
            }
            if ($request->has('insurance_company_id')) {
                $new_record->insurance_company_id = $request->input('insurance_company_id');
            }
            $new_record->save();
            // now save the passengers if exists.
            if ($request->has('passengers')) {
                $passengers = $request->input('passengers');
                if (is_array($passengers)) {
                    foreach($passengers as $passenger) {
                        $pass = Passenger::create($passenger);
                        $pass->client_id = $new_record->id;
                    } // end of passengers
                }
            }

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

        $client = new Client();
        $fields = $client->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($client->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');
        array_unshift($fields,'created_by');
        array_unshift($fields,'updated_by');
        array_push($fields,'region_id','insurance_company_id','referral_source_id','clinic_id','attorney_id','doctor_id','appt_confirmed_id','appt_reason_cancel_id');

        $client = Client::find($id,$fields);
        if (isset($client)) {
            $client->region = Region::find($client->region_id);
            $client->insurance_company = $this->getRequestingOffice($client->insurance_company_id);
            $client->law_office = $this->getRequestingOffice($client->referral_source_id);
            $client->clinic = $this->getRequestingOffice($client->clinic_id);
            $client->attorney = $this->getAttorneyDoctor($client->attorney_id);
            $client->doctor = $this->getAttorneyDoctor($client->doctor_id);
            $client->confirmation = $this->getConfirmationCancelation($client->appt_confirmed_id);
            $client->reason_for_cancel = $this->getConfirmationCancelation($client->appt_reason_cancel_id);
            $client->passengers = $this->getPassengers($client->id);
            $client->createdby = User::where('id',$client->created_by)->select('id','name')->first();
            $client->updatedby = User::where('id',$client->updated_by)->select('id','name')->first();
            $body_response = $this->apiBody->singleResult($client, 200, Config::get('constants.200'));
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
    public function update(Request $request, Authorizer $authorizer, $id)
    {
        $update_record = Client::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(), [
                'date_of_referral' => 'sometimes|required|date',
                'date_received' => 'sometimes|required|date',
                'case_type' => 'sometimes|required',
                'firstname' => 'sometimes|required',
                'lastname' => 'sometimes|required',
                'dob' => 'sometimes|required|date',
                'phone' => 'sometimes|required',
                'address' => 'sometimes|required',
                'city' => 'sometimes|required',
                'zipcode' => 'sometimes|required|max:5',
                'doi' => 'sometimes|required'
                //'body_parts' => 'sometimes|required',
            ]);
            if ($v->fails()) {
                $messages = $v->messages();
                $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400'), 'validation_errors' => $messages], 400, Config::get('constants.400'));
                $code = 400;
            } else {
                $data = $request->all();
                unset($data['created_at']);
                unset($data['updated_at']);
                $user_id = $authorizer->getResourceOwnerId();
                $user = User::where('id',$user_id)->first();
                if (isset($data['tmp_attorney_notes']) && strlen($data['tmp_attorney_notes']) > 10) {
                    $data['attorney_notes'] = "<p>-----[" . Carbon::now()->format('M-d-y h:i A') . " " . $user->name . "]-----</p><p>{$data['tmp_attorney_notes']}</p>" . $data['attorney_notes'];
                    unset($data['tmp_attorney_notes']);
                }
                if (isset($data['tmp_clinic_notes']) && strlen($data['tmp_clinic_notes']) > 10) {
                    $data['clinic_notes'] = "<p>-----[" . Carbon::now()->format('M-d-y h:i A') . " " . $user->name . "]-----</p><p>{$data['tmp_clinic_notes']}</p>" . $data['clinic_notes'];
                    unset($data['tmp_clinic_notes']);
                }
                // send notification.
                if (
                    (strlen(chop($update_record->appt_date)) == 0 || empty($update_record->appt_date)) &&
                    strlen($request->input('appt_date')) > 0
                    && ($update_record->notification_sent == 0 || empty($update_record->notification_sent))
                ) {
                    $update_record->notification_sent = 1;
                    $update_record->notification_date = date('Y-m-d H:i:s');
                    $this->emailLawyer($id);
                }
                $update_record->update($data, $id);
                if ($request->has('region_id'))$update_record->region_id = $request->input('region_id');
                if ($request->has('referral_source_id'))$update_record->referral_source_id = $request->input('referral_source_id');
                if ($request->has('attorney_id'))$update_record->attorney_id = $request->input('attorney_id');
                if ($request->has('clinic_id')) {
                    $update_record->clinic_id = $request->input('clinic_id');
                } else {
                    $update_record->clinic_id = null;
                }
                if ($request->has('doctor_id')) {
                    $update_record->doctor_id = $request->input('doctor_id');
                } else {
                    $update_record->doctor_id = null;
                }
                if ($request->has('appt_confirmed_id')) {
                    $update_record->appt_confirmed_id = $request->input('appt_confirmed_id');
                } else {
                    $update_record->appt_confirmed_id = null;
                }
                if ($request->has('appt_reason_cancel_id')) {
                    $update_record->appt_reason_cancel_id = $request->input('appt_reason_cancel_id');
                } else {
                    $update_record->appt_reason_cancel_id = null;
                }
                if ($request->has('insurance_company_id')) {
                    $update_record->insurance_company_id = $request->input('insurance_company_id');
                } else {
                    $update_record->insurance_company_id = null;
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
        $client = Client::find($id);
        if (isset($client)) {
            if (true) {
                // delete first passengers if exists
                Passenger::where('client_id',$id)->delete();
                $client->delete();
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
     * @param Request $request
     * @return mixed
     */
    public function search(Request $request)
    {
        // validate the presence of the q param.
        if (!isset($_GET['q'])){
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400')], 400, Config::get('constants.user.400'));
            $code = 400;
            return response()->json($body_response, $code);
        }
        $var = $_GET['q'] . '%';
        $GLOBALS['q'] = $var;
        $client = new Client();
        $fields = $client->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($client->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        foreach($fields as $field) {
            $f[] = 'clients.' . $field;
        }
        $fields = $f;
        $extra_fields = ['clinics.name as clinic_name','clinics.address1 as clinic_address1','clinics.address2 as clinic_address2','clinics.city as clinic_city','doctors.name as doctor_name','attorneys.name as attorney_name'];
        $fields = array_merge($fields,$extra_fields);

        if (strlen($var) > 0) {
            $clients = DB::table('clients')
                ->join('requesting_offices AS clinics','clinics.id','=','clients.clinic_id')
                ->join('attorneys_doctors AS doctors','doctors.id','=','clients.doctor_id')
                ->join('attorneys_doctors AS attorneys','attorneys.id','=','clients.attorney_id')
                ->where('clients.firstname','ilike',$GLOBALS['q'])
                ->orWhere('clients.lastname','ilike',$GLOBALS['q'])
                ->orWhere('attorneys.name','ilike',$GLOBALS['q'])
                ->orWhere('ssn','ilike',$GLOBALS['q'])
                ->select($fields)
                ->paginate(Config::get('constants.per_page'));
            $body_response = $this->apiBody->setBody($clients, 200, Config::get('constants.200'));
            $body_response['data'] = $clients->values()->toArray();
            $code = 200;
        } else {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.search.404')], 404, Config::get('constants.404'));
            $code = 404;
        }
        return response()->json($body_response, $code);
    }

    /**
     * @param $id
     * @return null
     */
    protected function getRequestingOffice($id)
    {
        if (!isset($id))return null;
        $requesting = new LawOffice();
        array_push($requesting->fillable,'id');
        $ro = DB::table('requesting_offices')->where('id','=',$id)->select($requesting->fillable)->get();
        return (isset($ro[0]))? $ro[0] : null;
    }

    /**
     * @param $id
     * @return null
     */
    protected function getAttorneyDoctor($id)
    {
        if (!isset($id))return null;
        $doctorattorney = new Attorney();
        array_push($doctorattorney->fillable,'id');
        $da = DB::table('attorneys_doctors')->where('id','=',$id)->select($doctorattorney->fillable)->get();
        return (isset($da[0]))? $da[0] : null;
    }

    /**
     * @param $id
     * @return null
     */
    protected function getConfirmationCancelation($id)
    {
        if (!isset($id))return null;
        $cc = new Reason();
        array_push($cc->fillable,'id');
        $cc = DB::table('reasons')->where('id','=',$id)->select($cc->fillable)->get();
        return (isset($cc[0]))? $cc[0] : null;
    }

    /**
     * @param $id
     * @return null
     */
    protected function getPassengers($id)
    {
        if (!isset($id))return null;
        $passenger = new Passenger();
        array_push($passenger->fillable,'id');
        $passengers = Passenger::where('client_id','=',$id)->select($passenger->fillable)->orderBy('name','asc')->get();
        return $passengers;
    }

    /**
     * @param $messages
     * @return array
     */
    protected function parseErrors($messages)
    {
        $errors = [];
        foreach($messages as $field => $message) {
            array_push($errors,$message[0]);
        }
        return $errors;
    }

    protected function emailLawyer($id)
    {
        $case = ViewReport::find($id);
        if ($case && is_numeric($case->id)) {
            $attorney = Attorney::find($case->attorney_id);
            $appt_date = new Carbon(str_replace('.000000','',$case->appt_date));
            $dob = new Carbon($case->dob);
            if (strlen($attorney->email) > 0) {
                Mail::queue('emails.lawyer',[
                    'firstname'=>$case->firstname,
                    'lastname'=>$case->lastname,
                    'appt_date'=>$appt_date->toDayDateTimeString(),
                    'clinic_name'=>$case->clinic_name,
                    'attorney_name'=>$case->attorney_name,
                    'dob'=>$dob->toFormattedDateString(),
                    'app_url'=>env('APP_URL','http://providence.rmpublicidad.com.sv'),
                    'id'=>$case->id],function($message) use($case,$attorney) {
                    $message->to($attorney->email,$attorney->name)
                        ->from(env('MAIL_EMAIL','noreply@onesourcescheduling.com'),env('MAIL_NAME','OneSource Scheduling'))
                        ->subject("{$case->firstname} {$case->lastname} has gotten an appointment.");
                });
            }
        }
    }

}
