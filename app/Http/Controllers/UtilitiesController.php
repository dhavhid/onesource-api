<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSourceHelper;
use OneSource\Clinic;
use OneSource\LawOffice;
use OneSource\InsuranceCompany;
use OneSource\Doctor;
use OneSource\Attorney;
use OneSource\User;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UtilitiesController extends Controller {

	protected $apiBody;
    protected $oneSourceHelper;
    protected $catalogs = ['bodyparts'=>'bodyparts','regions'=>'regions','attorneys'=>'attorneys','doctors'=>'doctors','lawoffices'=>'lawoffices','clinics'=>'clinics','insurancecompanies'=>'insurancecompanies','confirmations'=>'confirmations','cancelations'=>'cancelations','roles'=>'roles','users'=>'users','cities'=>'cities'];
	public function __construct(ApiBody $apiBody, OneSourceHelper $oneSourceHelper)
	{
		$this->apiBody = $apiBody;
        $this->oneSourceHelper = $oneSourceHelper;
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
	}

    public function invalidResponse()
    {
        $response = $this->apiBody->singleResult(['message'=>Config::get('constants.search.405')],405,Config::get('constants.search.405'));
        return response()->json($response,405);
    }

	public function getCatalogs()
    {
        if (!isset($_GET['q'])) {
            $body_response = $this->apiBody->singleResult(['message' => Config::get('constants.user.400')], 400, Config::get('constants.user.400'));
            $code = 400;
            return response()->json($body_response, $code);
        }
        $q = $_GET['q'];
        $extended = (isset($_GET['extended']) && $_GET['extended'] == 1)? $_GET['extended'] : false;
        $data_catalogs = [];
        // get the catalogs to return.
        $catalogs = explode(',',$q);
        if (!$this->oneSourceHelper->checkModelFields($this->catalogs,$catalogs)) {
            $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
            return response()->json($body_response,400);
        }
        if ($extended !== FALSE) {
            $fields = DB::raw("id, concat(name,' - ',address1,', ',city,', ',county,', ',zipcode) as name");
        } else {
            $fields = ['id','name'];
        }
        foreach ($catalogs as $catalog) {
            if ($catalog == 'bodyparts') {
                $data_catalogs['bodyparts'] = DB::table('bodyparts')->orderBy('id','asc')->select('id','name')->get();
            }
            if ($catalog == 'regions') {
                $data_catalogs['regions'] = DB::table('regions')->whereNull('deleted_at')->orderBy('name','asc')->select('id','name')->get();
            }
            if ($catalog == 'attorneys') {
                if (isset($_GET['withtrashed']) && $_GET['withtrashed'] == 1) {
                    $data_catalogs['attorneys'] = Attorney::withTrashed()->where('is_attorney',1)->orderBy('name','asc')->select(DB::raw('id, concat(name,\', Phone: \',phone) as name'))->get();
                } else {
                    $data_catalogs['attorneys'] = Attorney::where('is_attorney',1)->orderBy('name','asc')->select(DB::raw('id, concat(name,\', Phone: \',phone) as name'))->get();
                }
            }
            if ($catalog == 'doctors') {
                if (isset($_GET['withtrashed']) && $_GET['withtrashed'] == 1) {
                    $data_catalogs['doctors'] = Doctor::withTrashed()->where('is_attorney',0)->orderBy('name','asc')->select('id','name')->get();
                } else {
                    $data_catalogs['doctors'] = Doctor::where('is_attorney',0)->orderBy('name','asc')->select('id','name')->get();
                }
            }
            if ($catalog == 'lawoffices') {
                if (isset($_GET['withtrashed']) && $_GET['withtrashed'] == 1) {
                    $data_catalogs['lawoffices'] = LawOffice::withTrashed()->where('is_lawoffice',1)->orderBy('name','asc')->select(DB::raw("id, concat(name,' - ',address1,', ',city,', ',zipcode,', Phone: ',phone) as name"))->get();
                } else {
                    $data_catalogs['lawoffices'] = LawOffice::where('is_lawoffice',1)->orderBy('name','asc')->select(DB::raw("id, concat(name,' - ',address1,', ',city,', ',zipcode,', Phone: ',phone) as name"))->get();
                }
            }
            if ($catalog == 'clinics') {
                if (isset($_GET['withtrashed']) && $_GET['withtrashed'] == 1) {
                    $data_catalogs['clinics'] = Clinic::withTrashed()->where('is_clinic',1)->orderBy('name','asc')->select(DB::raw('id, concat(name,\' - \',address1,\', \',city,\', \',zipcode,\', Phone: \',phone) as name, \'ALL CLINICS\' AS "OptGroup"'))->get();
                } elseif (isset($_GET['city'])) {
                    if (isset($_GET['extended']) && $_GET['extended'] == 1) {
                        $data_catalogs['clinics'] = DB::select("SELECT id, concat(name,' - ',address1,', ',city,', ',zipcode,', Phone: ',phone) as name,CASE WHEN city = :the_city THEN 'CLINICS IN ".strtoupper($_GET['city'])."' ELSE 'ALL CLINICS' END AS \"OptGroup\" FROM requesting_offices WHERE is_clinic = :is_clinic AND deleted_at ISNULL ORDER BY CASE city WHEN :city THEN 1 ELSE 2 END, name ASC;",['the_city'=>$_GET['city'],'is_clinic'=>1,'city'=>$_GET['city']]);
                    } else {
                        $data_catalogs['clinics'] = DB::select("SELECT id,name,CASE WHEN city = :the_city THEN 'CLINICS IN ".strtoupper($_GET['city'])."' ELSE 'ALL CLINICS' END AS \"OptGroup\" FROM requesting_offices WHERE is_clinic = :is_clinic AND deleted_at ISNULL ORDER BY city = :city, name ASC;",['the_city'=>$_GET['city'],'is_clinic'=>1,'city'=>$_GET['city']]);
                    }
                } else{
                    if (isset($_GET['extended']) && $_GET['extended'] == 1) {
                        $data_catalogs['clinics'] = DB::table('requesting_offices')->whereNull('deleted_at')->where('is_clinic','=',1)->orderBy('name','asc')->select(DB::raw('id, concat(name,\' - \',address1,\', \',city,\', \',zipcode,\', Phone: \',phone) as name, \'ALL CLINICS\' AS "OptGroup"'))->get();
                    } else {
                        $data_catalogs['clinics'] = DB::table('requesting_offices')->whereNull('deleted_at')->where('is_clinic','=',1)->orderBy('name','asc')->select('id','name',DB::raw('\'ALL CLINICS\' AS "OptGroup"'))->get();
                    }
                }
            }
            if ($catalog == 'insurancecompanies') {
                if (isset($_GET['withtrashed']) && $_GET['withtrashed'] == 1) {
                    $data_catalogs['insurancecompanies'] = InsuranceCompany::withTrashed()->where('is_insurance',1)->orderBy('name','asc')->select('id','name')->get();
                } else {
                    $data_catalogs['insurancecompanies'] = InsuranceCompany::where('is_insurance',1)->orderBy('name','asc')->select('id','name')->get();
                }
            }
            if ($catalog == 'confirmations') {
                $data_catalogs['confirmations'] = DB::table('reasons')->whereNull('deleted_at')->where('is_confirmation','=',1)->orderBy('name','asc')->select('id','name')->get();
            }
            if ($catalog == 'cancelations') {
                $data_catalogs['cancelations'] = DB::table('reasons')->whereNull('deleted_at')->where('is_confirmation','=',0)->orderBy('id','asc')->select('id','name')->get();
            }
            if($catalog == 'users') {
                if (isset($_GET['withtrashed']) && $_GET['withtrashed'] == 1) {
                    $data_catalogs['users'] = User::withTrashed()->orderBy('name','asc')->select('id','name')->get();
                } else {
                    $data_catalogs['users'] = User::orderBy('name','asc')->select('id','name')->get();
                }
            }
            if ($catalog == 'cities') {
                if (isset($_GET['city'])) {
                    $data_catalogs['cities'] = DB::table('cities')->where('name','ILIKE',$_GET['city'].'%')->orderBy('name')->select('id','name')->get();
                } else {
                    $data_catalogs['cities'] = DB::table('cities')->orderBy('name')->select('id','name')->get();
                }
            }
            if ($catalog == 'roles') {
                $data_catalogs['roles'] = [
                    ['name' => 'Body Parts', 'id' => 'Body Parts'],
                    ['name' => 'Regions', 'id' => 'Regions'],
                    ['name' => 'Reasons to Confirm', 'id' => 'Confirmations'],
                    ['name' => 'Reasons to Cancel', 'id' => 'Cancelations'],
                    ['name' => 'Law Offices', 'id' => 'Law Offices'],
                    ['name' => 'Clinics', 'id' => 'Clinics'],
                    ['name' => 'Insurance Companies', 'id' => 'Insurance Companies'],
                    ['name' => 'Attorneys', 'id' => 'Attorneys'],
                    ['name' => 'Doctors', 'id' => 'Doctors'],
                    ['name' => 'Clients', 'id' => 'Clients'],
                    ['name' => 'Users', 'id' => 'Users'],
                    ['name' => 'Searches', 'id' => 'Searches'],
                    ['name' => 'Reports', 'id' => 'Reports']
                ];
            }
        }
        $body_response = $this->apiBody->singleResult($data_catalogs,200,Config::get('constants.200'));
        return $body_response;
    }

}
