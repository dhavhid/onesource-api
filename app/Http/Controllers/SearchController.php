<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSourceHelper;
use OneSource\ExcelHelper\ExcelHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use OneSource\Http\Controllers\Controller;
use OneSource\ApiResponse\ApiBody;
use LucaDegasperi\OAuth2Server\Authorizer;
use Carbon\Carbon;

use OneSource\Client;
use OneSource\Rol;
use OneSource\Report;
use OneSource\User;
use OneSource\ViewReport;

/**
 * Class SearchController
 * @package OneSource\Http\Controllers
 */
class SearchController extends Controller {

    /**
     * @var ApiBody
     */
    protected $apiBody;
    /**
     * @var OneSourceHelper
     */
    protected $OneSourcehelper;
    /**
     * @var ExcelHelper
     */
    protected $ExcelHelper;
    /**
     * @var Authorizer
     */
    protected $authorizer;
    /**
     * @var
     */
    public $fields;
    /**
     * @var array
     */
    public $sorting_fields = [
        'id'=>'string',
        'date_of_referral'=>'date',
        'date_received'=>'date',
        'case_type'=>'string',
        'firstname'=>'string',
        'lastname'=>'string',
        'dob'=>'date',
        'ssn'=>'string',
        'phone'=>'string',
        'phone_ext'=>'string',
        'alt_phone'=>'string',
        'address'=>'string',
        'address1'=>'string',
        'address2'=>'string',
        'city'=>'string',
        'zipcode'=>'string',
        'doi'=>'string',
        'body_parts'=>'string',
        'other_ibp'=>'string',
        'is_doctor_mpn'=>'string',
        'employer_name'=>'string',
        'attorney_notes'=>'string',
        'scheduled_with'=>'string',
        'appt_date'=>'date',
        'date_moved'=>'date',
        'clinic_notes'=>'string',
        'patient_treating'=>'string',
        'next_appt'=>'date',
        'verified_with'=>'string',
        'first_seen'=>'date',
        'created_at'=>'date',
        'updated_at'=>'date',
        'appt_reason_cancel_id'=>'select',
        'appt_confirmed_id'=>'select',
        'referral_source_id'=>'select',
        'clinic_id'=>'select',
        'insurance_company_id'=>'select',
        'attorney_id'=>'select',
        'doctor_id'=>'select',
        'clinic_name'=>'select',
        'clinic_address1'=>'string',
        'clinic_address2'=>'string',
        'clinic_city'=>'string',
        'clinic_county'=>'string',
        'doctor_name'=>'select',
        'attorney_name'=>'select',
        'lawoffice_name'=>'select',
        'insurance_name'=>'select',
        'confirmed'=>'select',
        'cancelled'=>'select',
        'created_by'=>'select',
        'updated_by'=>'select'
    ];
    /**
     * @var array
     */
    public $sorting_order = [
        'desc' => 'desc',
        'asc' => 'asc'
    ];
    /**
     * @var array
     */
    public $date_conditions = ['equals'=>'=','on_after'=>'>=','after'=>'>','before_on'=>'<=','before'=>'<','is_months_past'=>'>=','is_days_past'=>'>=','is_yesterday'=>'=','is_today'=>'=','is_tomorrow'=>'=','is_days_future'=>'<=','is_months_future'=>'<=','is_this_month'=>'>='];
    /**
     * @var array
     */
    public $select_conditions = ['in'=>'IN','not_in'=>'NOT IN','not_null'=>'IS NOT NULL','is_null'=>'IS NULL'];
    /**
     * @var array
     */
    public $string_conditions = ['equals'=>'=','not_equals'=>'!=','ilike'=>'ILIKE','starts_with'=>'ILIKE','ends_with'=>'ILIKE'];
    /**
     * @var array
     */
    public $sort_options = ['sort_low_high'=>'asc','sort_high_low'=>'desc','sort_group_low_high'=>'asc','sort_group_high_low'=>'desc'];

    /**
     * @var array
     */
    public $grouping_options = ['day'=>'day','week'=>'week','month'=>'month','quarter'=>'quarter','year'=>'year','decade'=>'decade'];

    /**
     * @var array
     */
    public $field_parser = ['clinic_name'=>'clinic_id','lawoffice_name'=>'referral_source_id','insurance_name'=>'insurance_company_id','doctor_name'=>'doctor_id','attorney_name'=>'attorney_id','cancelled'=>'appt_reason_cancel_id','confirmed'=>'appt_confirmed_id','created_by'=>'created_by','updated_by'=>'updated_by'];
    /**
     * @param ApiBody $apiBody
     * @param Authorizer $authorizer
     */
    public function __construct(ApiBody $apiBody, Authorizer $authorizer)
    {
        $this->apiBody = $apiBody;
        $this->OneSourcehelper = new OneSourceHelper();
        $this->authorizer = $authorizer;
    }

    /**
     * @param Request $request
     */
    public function index(Request $request)
    {
        $owner_id = $this->authorizer->getResourceOwnerId();
        // get the default report.
        $response['default'] = Report::where('default','=',1)->select('id','name')->orderBy('name','asc')->first();
        // get the reports that I am the owner
        $response['my_reports'] = Report::where('owner','=',$owner_id)->where('default','=',0)->select('id','name')->orderBy('name','asc')->get();
        // get the reports that have been shared with me.
        $response['shared_with_me'] = Report::whereRaw("{$owner_id} = ANY(access)")->where('default','=',0)->select('id','name')->orderBy('name','asc')->get();
        $body = $this->apiBody->singleResult($response,200,Config::get('constants.user.200'));
        return response()->json($body,200);
    }

    /**
     * @param Request $request
     */
    public function store(Request $request)
    {
        $name = $request->input('name');
        $access = []; //private report
        $owner_id = (int)$this->authorizer->getResourceOwnerId();

        if($request->input('share_type') == 1) { // report shared with some only
            foreach($request->input('access') as $value){
                array_push($access,(int)$value);
            }
        } elseif($request->input('share_type') == 0) { // public report.
            $users = User::where('id','!=',$owner_id)->lists('id');
            $access = $users;
        }

        //$report = Report::create(['owner'=>$owner_id,'name'=>$name,'options'=>json_encode($request->all()),'access'=>$access]);
        $options = json_encode($request->all());
        $now = date('Y-m-d G:i:s');
        $access = 'ARRAY[' . implode(',',$access) . ']::integer[]';
        DB::statement("INSERT INTO reports(name,options,access,owner,created_at,updated_at) VALUES('{$name}','{$options}',$access,$owner_id,'{$now}','{$now}');");
        $report = Report::where('created_at','=',$now)->where('owner','=',$owner_id)->select('id','name','options','owner')->first();
        if ($request->input('default_report') == 1) {
            Report::where('default','=',1)->update(['default'=>0]);
            $report->default = 1;
            $report->save();
        }
        $report->options = json_decode($report->options);
        /*$report->access = explode(',',str_replace(['{','}'],['',''],$report->access));
        $report->access = array_map(create_function('$value', 'return (int)$value;'), $report->access);*/
        $response = $this->apiBody->singleResult($report,200,Config::get('constants.200'));
        return response()->json($response,200);
    }

    /**
     * @param Request $request
     */
    public function update(Request $request, $id)
    {
        $name = $request->input('name');
        $access = []; //private report
        $owner_id = (int)$this->authorizer->getResourceOwnerId();

        if($request->input('share_type') == 1) { // report shared with some only
            foreach($request->input('access') as $value){
                array_push($access,(int)$value);
            }
        } elseif($request->input('share_type') == 0) { // public report.
            $users = User::where('id','!=',$owner_id)->lists('id');
            $access = $users;
        }

        $options = json_encode($request->all());
        $now = date('Y-m-d G:i:s');
        $access = 'ARRAY[' . implode(',',$access) . ']::integer[]';
        DB::statement("UPDATE reports SET name = '{$name}', options = '{$options}', access = $access, owner = $owner_id, updated_at = '{$now}' WHERE id = $id;");
        $report = Report::where('id','=',$id)->select('id','name','options','owner')->first();
        if ($request->input('default_report') == 1) {
            Report::where('default','=',1)->update(['default'=>0]);
            $report->default = 1;
            $report->save();
        }
        $report->options = json_decode($report->options);
        $response = $this->apiBody->singleResult($report,200,Config::get('constants.200'));
        return response()->json($response,200);
    }

    /**
     * @param Request $request
     * @param $id
     */
    public function show(Request $request, $id)
    {
        $report = Report::where('id','=',$id)->select('id','name','options','owner')->first();
        $report->options = json_decode($report->options);
        $response = $this->apiBody->singleResult($report,200,Config::get('constants.user.200'));
        return response()->json($response,200);
    }

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function search(Request $request)
	{

        $GLOBALS['owner_id'] = $this->authorizer->getResourceOwnerId();

        $client = new ViewReport();
        $this->fields = $client->fillable;
        $parsed_columns = $this->parseColumns($client,new \stdClass(),$request);

        $per_page = Config::get('constants.per_page');
        if ($request->has('perPage')) {
            $per_page = $request->input('perPage');
        }

        $sortBy = 'updated_at';
        if ($request->has('sortBy')) {
            if (isset($this->sorting_fields[strtolower($request->input('sortBy'))])) {
                $sortBy = strtolower($request->input('sortBy'));
            }
        }
        $sortOrder = 'desc';
        if ($request->has('sortOrder')) {
            if (isset($this->sorting_order[strtolower($request->input('sortOrder'))])) {
                $sortOrder = strtolower($request->input('sortOrder'));
            }
        }

        $clients = ViewReport::where(function($query){
            global $request;
            $q = '%';
            if ($request->has('q')) {
                $q = $request->input('q');
                $q = "{$q}%";
                $query->where('firstname','ilike',$q)
                    ->orWhere('lastname','ilike',$q)
                    ->orWhere('attorney_name','ilike',$q)
                    ->orWhere('clinic_name','ilike',$q)
                    ->orWhere('doctor_name','ilike',$q);
            }
        })
        ->where(function($query){
            // period of time for the appointment date
            global $request;
            if ($request->has('appt_mindate') && $request->has('appt_maxdate')) {
                $appt_mindate = date('Y-m-d G:i:s',strtotime($request->input('appt_mindate')));
                $appt_maxdate = date('Y-m-d G:i:s',strtotime($request->input('appt_maxdate')));
                $query->where('appt_date','>=',$appt_mindate)->where('appt_date','<=',$appt_maxdate);
            }
            // period of time for the date of referral
            if ($request->has('dor_mindate') && $request->has('dor_maxdate')) {
                $dor_mindate = date('Y-m-d G:i:s',strtotime($request->input('dor_mindate')));
                $dor_maxdate = date('Y-m-d G:i:s',strtotime($request->input('dor_maxdate')));
                $query->orWhere('date_of_referral','>=',$dor_mindate)->where('date_of_referral','<=',$dor_maxdate);
            }
        })
        ->where(function($query){
            // list of attorneys
            global $request;
            if ($request->has('attorney')) {
                $attorneys = $request->input('attorney');
                if (is_array($attorneys) && count($attorneys) > 0) {
                    $query->whereRaw('attorney_id IN (' . implode(',',$attorneys) . ')');
                }
            }
            // list of law offices
            if ($request->has('lawoffice')) {
                $lawoffices = $request->input('lawoffice');
                if (is_array($lawoffices) && count($lawoffices) > 0) {
                    $query->orWhereRaw('referral_source_id IN (' . implode(',',$lawoffices) . ')');
                }
            }
        })
        ->where(function($query){
            // confirmed appointments.
            global $request;
            $confirmed = (($request->input('status') === 'cancelled' || $request->input('status') === 'confirmed'))? $request->input('status') : 'not set';
            if ($confirmed == 'confirmed') {
                $query->whereNotNull('appt_confirmed_id');
            }
        })
        ->where(function($query){
            // cancelled appointments.
            global $request;
            $cancelled = (($request->input('status') === 'cancelled' || $request->input('status') === 'confirmed'))? $request->input('status') : 'not set';
            if ($cancelled == 'cancelled') {
                $query->whereNotNull('appt_reason_cancel_id');
            }
        })
        ->where(function($query){
            // retrieve just the referrals of the current user.
            $user_id = $GLOBALS['owner_id'];
            // check out if the user is admin or not
            $user = User::where('id','=',$user_id)->where('is_admin','=',1)->first();
            if ($user) {
                // retrieve all, no constraints
            } else {
                $query->where('created_by',$user_id);
                $query->orWhere('updated_by',$user_id);
                //$query->orWhereNull('created_by');
            }
        })
        ->select($this->fields)
        ->orderBy($sortBy,$sortOrder)
        ->paginate($per_page);

        $results = $this->parseResults($clients,$parsed_columns,null,null,null,false);

        $body_response = $this->apiBody->setBody($clients, 200, Config::get('constants.200'));
        $body_response['data'] = $results;
        foreach($parsed_columns as $key) {
            $body_response['columns'][] = ['value'=>$key,'text'=>$client->default_fields_for_search[$key]];
        }
        return response()->json($body_response,200);
	}

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\View\View|void
     */
    public function exportReport(Request $request, $id)
    {
        $GLOBALS['owner_id'] = $this->authorizer->getResourceOwnerId();

        $report = Report::where('id','=',$id)->where(function($query){
            $query->whereRaw("{$GLOBALS['owner_id']} = ANY(access)")
                ->orWhere('owner','=',$GLOBALS['owner_id']);
        })->select('id','name','options','owner')->first();

        // if report does not exists or user is not granted to access it, then return 403.
        if (!$report) {
            return view('errors/403');
        }
        $report->options = json_decode($report->options);
        $result = $this->getDataForReport($request,$id,false,false);
        $result['report'] = $report;
        $report_excel = new ExcelHelper();
        $report_excel = $report_excel->generateReport($result);
        $report_excel->export('xls');
        return;
    }


    /**
     * @param Request $request
     * @return mixed
     */
    public function getDefaultReport(Request $request)
    {
        $GLOBALS['owner_id'] = $this->authorizer->getResourceOwnerId();

        //$default = Report::where('default','=','1')->select('id','name','options','owner')->first();
        $report = Report::where('default','1')->where(function($query){
            $query->whereRaw("{$GLOBALS['owner_id']} = ANY(access)")
                ->orWhere('owner','=',$GLOBALS['owner_id']);
        })->select('id','name','options','owner')->first();
        // if report does not exists or user is not granted to access it, then return 403.
        if (!$report) {
            $result = $this->apiBody->singleResult(['message'=>Config::get('constants.user.403')],403,Config::get('constants.user.403'));
            return response()->json($result,403);
        }
        $report->options = json_decode($report->options);
        $result = $this->getDataForReport($request,$report->id,false,true);
        $result['report'] = $report;
        return response()->json($result,200);
    }

    public function printReport(Request $request,$id)
    {
        $GLOBALS['owner_id'] = $this->authorizer->getResourceOwnerId();

        $report = Report::where('id','=',$id)->where(function($query){
            $query->whereRaw("{$GLOBALS['owner_id']} = ANY(access)")
                ->orWhere('owner','=',$GLOBALS['owner_id']);
        })->select('id','name','options','owner')->first();

        // if report does not exists or user is not granted to access it, then return 403.
        if (!$report) {
            return view('errors/403');
        }
        $report->options = json_decode($report->options);
        $result = $this->getDataForReport($request,$id,false,false);
        $result['report'] = $report;
        $viewReport = new ViewReport();
        if (isset($result['group_fields'])) {
            return view('print',['data'=>$result['data'],'totals'=>$result['totals'],'group_fields'=>$result['group_fields'],'report'=>$report,'field_type'=>$viewReport->field_type]);
        }
        return view('print',['data'=>$result['data'],'report'=>$report,'field_type'=>$viewReport->field_type]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function showReport(Request $request, $id)
    {
        $GLOBALS['owner_id'] = $this->authorizer->getResourceOwnerId();

        $report = Report::where('id','=',$id)->where(function($query){
            $query->whereRaw("{$GLOBALS['owner_id']} = ANY(access)")
                ->orWhere('owner','=',$GLOBALS['owner_id']);
        })->select('id','name','options','owner')->first();

        // if report does not exists or user is not granted to access it, then return 403.
        if (!$report) {
            $result = $this->apiBody->singleResult(['message'=>Config::get('constants.user.403')],403,Config::get('constants.user.403'));
            return response()->json($result,403);
        }
        $report->options = json_decode($report->options);
        $result = $this->getDataForReport($request,$id,false,true);
        $result['report'] = $report;
        return response()->json($result,200);
    }


    /**
     * @param $request
     * @param $id
     * @param bool|true $json
     * @param bool|true $paginate
     * @return array
     */
    public function getDataForReport($request, $id, $json = true, $paginate = true)
    {
        $GLOBALS['id'] = $id;
        $GLOBALS['owner_id'] = $this->authorizer->getResourceOwnerId();

        $report = Report::where('id','=',$id)->select('name','options')->first();

        // if report does not exists or user is not granted to access it, then return 403.
        if (!$report) {
            $result = $this->apiBody->singleResult(['message'=>Config::get('constants.user.403')],403,Config::get('constants.user.403'));
            return response()->json($result,403);
        }

        $client = new ViewReport();
        $GLOBALS['report'] = $report;
        $GLOBALS['client'] = $client;
        $GLOBALS['report']->options = json_decode($GLOBALS['report']->options);
        $this->fields = $this->parseColumns($client,$GLOBALS['report']->options,$request);
        if (!in_array('id',$this->fields)) {
            array_push($this->fields,'id');
        }

        $per_page = Config::get('constants.per_page');
        if ($request->has('perPage')) {
            $per_page = $request->input('perPage');
        }

        $sortBy = 'updated_at';
        if ($request->has('sortBy')) {
            if (isset($this->sorting_fields[strtolower($request->input('sortBy'))])) {
                $sortBy = strtolower($request->input('sortBy'));
            }
        }
        $sortOrder = 'desc';
        if ($request->has('sortOrder')) {
            if (isset($this->sorting_order[strtolower($request->input('sortOrder'))])) {
                $sortOrder = strtolower($request->input('sortOrder'));
            }
        }

        //$clients = DB::table('clients')
        $clients = ViewReport::where(function($query){
            global $request;
            if ($request->has('q')) {
                $q = $request->input('q');
                if ($request->has('search_field') && strlen($request->input('search_field')) > 0) {
                    $search_field = $request->input('search_field');
                    if ($search_field == 'dob' && preg_match("/(\d{4}-\d{2}-\d{2})/",$q)) {
                        $query->where($search_field,$q);
                    } elseif ($search_field == 'id' && preg_match("/^(\d+)$/",$q)) {
                        $query->where($search_field,'=',"{$q}");
                    } elseif ($search_field != 'dob' && $search_field != 'id') {
                        $query->where($search_field,'ilike',"{$q}%");
                    }
                } else {
                    if (preg_match("/^(\d+)$/",$q)) {
                        $query->orWhere('id','=',$q);
                    }
                    $q = chop($q);
                    $q = str_replace(' ','%',$q);
                    $q = "{$q}%";
                    $query->orWhere('firstname','ilike',$q)
                        ->orWhere('lastname','ilike',$q)
                        ->orWhere('attorney_name','ilike',$q)
                        ->orWhere('doctor_name','ilike',$q)
                        ->orWhere('clinic_name','ilike',$q)
                        ->orWhere('lawoffice_name','ilike',$q)
                        ->orWhere('insurance_name','ilike',$q)
                        ->orWhere('phone','ilike',$q)
                        ->orWhere('ssn','ilike',$q);
                }
            }
        })
        ->where(function($query){
            // filters.
            $options = $GLOBALS['report']->options;
            $filters = $options->filters;
            if (isset($filters[0])) {
                $conditions = [];
                foreach ($filters as $filter) {
                    $filtered = $this->parseFilters($GLOBALS['client']->field_type,$filter);
                    if ($filtered !== FALSE) {
                        $conditions[] = $filtered;
                    }
                }
                $conditions = implode(' ' . $options->filter_match . ' ',$conditions);
                $query->whereRaw($conditions);
            }
        });
        // sorting.
        $sorting = $GLOBALS['report']->options->sort;
        // -------------------------------------------------
        $clients_group = clone $clients;
        // -------------------------------------------------
        $group = false;
        $group_fields = [];
        $group_fields_select = [];
        $group_parse = [];
        $group_and_sort = 1;
        if (isset($sorting[0])) {
            foreach ($sorting as $sort) {
                $clients->orderBy($sort->field,$this->sort_options[$sort->order]);
                if (preg_match('/^(sort_group)/',$sort->order) === 1) {
                    $group = true;
                    $clients_group->groupBy(DB::raw($group_and_sort));
                    //$clients_group->orderBy($group_and_sort,$this->sort_options[$sort->order]);
                    $clients_group->orderBy(DB::raw($group_and_sort),$this->sort_options[$sort->order]);
                    $group_and_sort++;
                    if (isset($this->grouping_options[$sort->value]) && !empty($sort->value)) {
                        $group_fields_select[] = "cast(date_trunc('" . $sort->value . "'," . $sort->field . ") AS date) AS " . $sort->field;
                        $group_parse[] = $sort->value;
                    } else {
                        $group_parse[] = 0;
                        $group_fields_select[] = $sort->field;
                    }
                    $group_fields[] = $sort->field;
                }
            }
        }// end of sorting
        $clients->orderBy($sortBy,$sortOrder);
        // now add the secondary sorting field.
        if ($group == true) {
            $clients_group->select(DB::raw('DISTINCT ' . implode(',',$group_fields_select) . ', count(id) AS total'));
            $clients_group = $clients_group->get()->toArray();
            $totals = $clients_group;
        }
        if ($paginate){
            $clients = $clients->select($client->fillable)->paginate($per_page);
        } else {
            $clients = $clients->select($client->fillable)->get();
        }

        if ($group) {
            $result = $this->parseResults($clients->values()->toArray(),$this->fields,$clients_group,$group_fields,$group_parse,$group);
        } else {
            $result = $this->parseResults($clients->values()->toArray(),$this->fields,null,$group_fields,null,$group);
        }

        if ($paginate) {
            $body_response = $this->apiBody->setBody($clients, 200, Config::get('constants.200'));
        }
        $body_response['data'] = $result;
        if ($group) {
            $body_response['totals'] = $this->setTotals($totals,$group_fields,$group_parse);
            $body_response['group_fields'] = $group_fields;
        }
        if ($json === true) {
            return response()->json($body_response,200);
        } else {
            return $body_response;
        }
    }

    /**
     * @return mixed
     */
    public function getFields()
    {
        $client = new Client();
        $fields = $client->fields_for_search;
        $default = $client->default_fields_for_search;
        $fields_for_search = [];
        foreach ($fields as $key => $value) {
            $fields_for_search['all'][] = array('value'=>$key,'text'=>$value);
        }
        foreach ($default as $key => $value) {
            $fields_for_search['default'][] = array('value'=>$key,'text'=>$value);
        }
        $response = $this->apiBody->singleResult($fields_for_search,200,Config::get('constants.user.200'));
        return response()->json($response,200);
    }

    /**
     * @param $client
     * @param $options
     * @param $request
     * @return array
     */
    protected function parseColumns($client,$options,$request)
    {
        $columns = [];
        if ($request->has('columns')) {
            $user_columns = $request->input('columns');
            if (count($user_columns) > 0) {
                foreach ($user_columns as $column) {
                    $columns[] = $column['value'];
                }
                return $columns;
            }
        }
        if (isset($options->columns[0])) {
            foreach ($options->columns as $column) {
                $columns[] = $column->value;
            }
        } else {
            // use the default fields for search.
            foreach ($client->default_fields_for_search as $key => $value) {
                $columns[] = $key;
            }
        }
        return $columns;
    }

    /**
     * @param $fields
     * @param $filter
     * @return bool|string
     */
    protected function parseFilters($fields,$filter)
    {
        $days_filter = '/^(is_)/';
        if (isset($fields[$filter->field])) {
            $field = $fields[$filter->field];
            if ($field == 'date') {
                if (preg_match($days_filter,$filter->condition) == 1) {
                    // check if filter is today, yesterday, tomorrow.
                    if ($filter->condition == 'is_days_past') {
                        $days = abs($filter->value) * (-1);
                        $months = 0;
                    } elseif ($filter->condition == 'is_yesterday') {
                        $days = -1;
                        $months = 0;
                    } elseif ($filter->condition == 'is_days_future') {
                        $days = abs($filter->value);
                        $months = 0;
                    } elseif ($filter->condition == 'is_tomorrow') {
                        $days = 1;
                        $months = 0;
                    } elseif ($filter->condition == 'is_today') {
                        $days = 0;
                        $months = 0;
                    } elseif ($filter->condition == 'is_months_past') {
                        $days = 0;
                        $months = abs($filter->value) * (-1);
                    } elseif ($filter->condition == 'is_months_future') {
                        $days = 0;
                        $months = abs($filter->value);
                    } elseif ($filter->condition == 'is_this_month' ) {
                        $days = abs(date('j') - 1) * (-1);
                        $months = 0;
                    } else {
                        $days = 0;
                        $months = 0;
                    }
                    return $filter->field . '::timestamp::date' . $this->date_conditions[$filter->condition] . "'" . date('Y-m-d',mktime(0,0,0,date('m')+$months,date('d')+$days,date('y'))) . "'";
                }
                return $filter->field . '::timestamp::date' . $this->date_conditions[$filter->condition] . "'" . date('Y-m-d',strtotime($filter->value)) . "'";
            } else if ($field == 'select') {
                if ($filter->condition == 'not_null' || $filter->condition == 'is_null') {
                    return $filter->field . ' ' . $this->select_conditions[$filter->condition];
                }
                return $this->field_parser[$filter->field] . ' ' . $this->select_conditions[$filter->condition] . ' (' . implode(',',$filter->value) . ')';
            } else if ($field == 'string') {
                return $filter->field . ' ' . $this->string_conditions[$filter->condition] . ' ' . "'" . $filter->value . "'";
            }
        } // end of validating the existance of the field.
        return false;
    }


    /**
     * @param $dataset
     * @param $columns
     * @param $group_results
     * @param $keys
     * @param $group_parse
     * @param $is_group
     * @return array
     */
    public function parseResults($dataset = array(),$columns,$group_results,$keys,$group_parse,$is_group)
    {
        $results = $group_results;
        $total_groups = count($group_results);
        if ($is_group === FALSE) {
            $results = [['key'=>'All results']];
            for ($i=0;$i<count($dataset);$i++) {
                $results[0]['data'][] = $this->setColumnResults($dataset[$i],$columns);
            }
        } else {
            $n_keys = count($keys);
            foreach ($dataset as $data) {
                for ($i=0;$i<$total_groups;$i++) {
                    $match = true;
                    for ($k=0;$k<$n_keys;$k++) {
                        if ($group_parse[$k] !== 0) { // this means that it is a date with a custom format.
                            $match = $this->compareDate($group_results[$i][$keys[$k]],$group_parse[$k],$data[$keys[$k]]);
                        } else { // it is a normal grouping field
                            if ($data[$keys[$k]] != $group_results[$i][$keys[$k]]) {
                                $match = false;
                            }
                        }
                    }

                    if ($match == true){
                        $results[$i]['data'][] = $this->setColumnResults($data,$columns);
                    }
                }
            } // end of foreach dataset.
        } // end of parsing data
        if($is_group) {
            $results = $this->cleanResults($results,$keys,$group_parse,$is_group);
        }
        return $results;
    }

    /**
     * @param $record
     * @param $columns
     * @return array
     */
    public function setColumnResults($record,$columns)
    {
        $color_filtering_columns = ['created_at','updated_at','confirmed','cancelled'];
        $new_record = [];
        foreach ($columns as $column) {
            $new_record[$column] = $record[$column];
        }
        // add the colour filtering columns.
        foreach ($color_filtering_columns as $column) {
            $new_record[$column] = $record[$column];
        }
        return $new_record;
    }

    /**
     * @param $group_value
     * @param $group_type
     * @param $data
     * @return bool
     */
    public function compareDate($group_value,$group_type,$data)
    {
        $group_value = explode('T',$group_value);
        $data = explode('T',$data);
        $groupk = Carbon::createFromFormat('Y-m-d',$group_value[0]);
        $present = Carbon::createFromFormat('Y-m-d',$group_value[0]);
        $datak = Carbon::createFromFormat('Y-m-d',$data[0]);
        if($group_type == 'day') {
            return $groupk->eq($datak);
        }
        if($group_type == 'week') {
            $groupk->addWeek();
            return $datak->lt($groupk) && $datak->gte($present);
        }
        if($group_type == 'month') {
            return $groupk->format('Y-m') == $datak->format('Y-m');
        }
        if($group_type == 'quarter') {
            $groupk->addMonths(3);
            return $datak->lt($groupk) && $datak->gte($present);
        }
        if($group_type == 'year') {
            return $groupk->format('Y') == $datak->format('Y');
        }
        if($group_type == 'decade') {
            $groupk->addYears(10);
            return $datak->lt($groupk) && $datak->gte($present);
        }
        return false;
    }


    /**
     * @param $results
     * @param $keys
     * @param $group_parse
     * @param $is_group
     * @return array
     */
    public function cleanResults($results,$keys,$group_parse,$is_group)
    {
        $new_result = [];
        // parse the grouped dates.
        if ($is_group) {
            $n_total_keys = count($keys);
            foreach($results as $result) {
                for($i=0;$i<$n_total_keys;$i++) {
                    if (isset($this->grouping_options[$group_parse[$i]])) {
                        $result[$keys[$i]] = explode ('T',$result[$keys[$i]]);
                        $result[$keys[$i]] = Carbon::createFromFormat('Y-m-d',$result[$keys[$i]][0])->format('m-d-Y');
                    }
                    if (isset($result['data'])) {
                        $new_result[] = $result;
                    }
                }
            }
        } else {
            foreach($results as $result) {
                if(isset($result['data'])) {
                    $new_result[] = $result;
                }
            }
        }
        return $new_result;
    }

    /**
     * @param $totals
     * @param $keys
     * @param $group_parse
     * @return mixed
     */
    public function setTotals($totals,$keys,$group_parse)
    {
        $n_totals = count($totals);
        $n_keys = count($keys);
        $n_group_parse = count($group_parse);
        for ($i=0;$i<$n_totals;$i++) {
            for ($k=0;$k<$n_keys;$k++) {
                if ($group_parse[$k] !== 0) {
                    $totals[$i][$keys[$k]] = explode('T',$totals[$i][$keys[$k]]);
                    $totals[$i][$keys[$k]] = Carbon::createFromFormat('Y-m-d',$totals[$i][$keys[$k]][0])->format('m-d-Y');
                }
            }
        }
        return $totals;
    }

    /**
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function destroy(Request $request, $id)
    {
        $report = Report::find($id);
        if (!$report) {
            $result = $this->apiBody->singleResult(['message'=>Config::get('constants.404')],404,Config::get('constants.404'));
            return response()->json($result,404);
        }

        // if report found, then delete it.
        $report->delete();
        $result = $this->apiBody->singleResult(['message'=>'The report was deleted successfuly.'],200,Config::get('constants.200'));
        return response()->json($result,200);
    }

}
