<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\Region;
use OneSource\City;

use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Class RegionsController
 * @package OneSource\Http\Controllers
 */
class RegionsController extends Controller
{

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
        'name' => 'required|unique:regions',
        'abbr' => 'required|unique:regions'
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
        $region = new Region();
        $fields = $region->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($region->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        $regions = DB::table('regions')->whereNull('deleted_at')->orderBy('name', 'asc')->select($fields)->paginate(Config::get('constants.per_page'));
        $body_response = $this->apiBody->setBody($regions, 200, Config::get('constants.200'));
        $body_response['data'] = $regions->values()->toArray();
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
            $new_record = new Region();
            $new_record->name = $request->input('name');
            $new_record->abbr = $request->input('abbr');
            $new_record->save();
            $body_response = $this->apiBody->singleResult($new_record, 200, Config::get('constants.200'));
            $code = 200;
        }
        return response()->json($body_response, $code);
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return Response
     */
    public function show(Request $request, $id)
    {
        $region = new Region();
        $fields = $region->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($region->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        $region = Region::find($id,$fields);
        if (isset($region)) {
            $body_response = $this->apiBody->singleResult($region, 200, Config::get('constants.200'));
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
     * @param  int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $update_record = Region::find($id);
        if (isset($update_record)) {
            $v = \Validator::make($request->all(), [
                'name' => 'required|unique:regions,name,'.$id,
                'abbr' => 'sometimes|required|unique:regions,abbr,'.$id
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
     * @param  int $id
     * @return Response
     */
    public function destroy($id)
    {
        $region = Region::find($id);
        if (isset($region)) {
            $region->delete();
            $body_response = $this->apiBody->singleResult(['message' => 'The record was deleted successfully.'], 200, Config::get('constants.200'));
            $code = 200;
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
        $data = (array)explode(',',$data);
        $code = 200;
        foreach ($data as $id) {
            $region = Region::where('id',$id)->first();
            if (isset($region)) {
                $region->delete();
            } else {
                $code = 404;
            }
        }
        if ($code == 200) {
            $body_response = $this->apiBody->singleResult(['message'=>'The records were deleted successfully.'],200,Config::get('constants.200'));
        } else {
            $code = 400;
            $body_response = $this->apiBody->singleResult(['message'=>'Some of the records could not be deleted at this time. Please try later.'],400,Config::get('constants.400'));
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
        $region = new Region();
        $fields = $region->fillable;

        if ($request->has('fields')) {
            $r_fields = $request->input('fields');
            $r_fields = explode(',',$r_fields);
            if (!$this->OneSourcehelper->checkModelFields($region->fields,$r_fields)){
                $body_response = $this->apiBody->singleResult(['message'=>Config::get('constants.user.400')],400,Config::get('constants.user.400'));
                return response()->json($body_response,400);
            }
            $fields = $r_fields;
        }
        array_unshift($fields,'id');

        if (strlen($var) > 0) {
            $results = Region::where('name','ilike',$var)->orWhere('abbr','ilike',$var)->select($fields)->paginate(10);
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
     * @return mixed
     */
    public function getRegionsByCounty($id)
    {
        if (isset($_GET['countyname'])) {
            $cities = DB::table('cities')->join('regions','regions.id','=','cities.county_id')->where('regions.name','ilike',$_GET['countyname'])->select('cities.id','cities.name')->orderBy('cities.name','asc')->get();
        } else {
            $cities = City::where('county_id','=',$id)->select('id','name')->get()->values()->toArray();
        }
        if (!$cities) {
            return response()->json($this->apiBody(['message'=>'No cities were found within that county.'],404,Config::get('constants.404')),404);
        }

        return response()->json($this->apiBody->singleResult($cities,200,Config::get('constants.200')),200);
    }

    /**
     * @return mixed
     */
    public function getCities()
    {
        $cities = City::select('id','name')->orderBy('name','asc')->get()->values()->toArray();
        if (!$cities) {
            return response()->json($this->apiBody(['message'=>'No cities were found.'],404,Config::get('constants.404')),404);
        }

        return response()->json($this->apiBody->singleResult($cities,200,Config::get('constants.200')),200);
    }
}
