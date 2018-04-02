<?php namespace OneSource\Console\Commands;

use Illuminate\Console\Command;
use OneSource\ClientShell;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\BodyPart;
use OneSource\ClinicShell;
use OneSource\PassengerShell;


class ImportCases extends Command {

	/**
	 * The console command name.
	 *
	 * @var string
	 */
	protected $name = 'import:cases';

    protected $cities;

    protected $reasons_cancel;

    protected $reasons_confirm;

    protected $doctors;

    protected $attorneys;

    protected $lawoffices;

    protected $clinics;

    protected $insurances;

    protected $alpha = ['A'=>0,'B'=>1,'C'=>2,'D'=>3,'E'=>4,'F'=>5,'G'=>6,
        'H'=>7,'I'=>8,'J'=>9,'K'=>10,'L'=>11,'M'=>12,'N'=>13,'O'=>14,'P'=>15,
        'Q'=>16,'R'=>17,'S'=>18,'T'=>19,'U'=>20,'V'=>21,'W'=>22,'X'=>23,'Y'=>24,
        'Z'=>25];

    protected $bodyparts = ['AX'=>'coccyx','AY'=>'psych','AZ'=>'stress','BA'=>'sleep disorder','BB'=>'depression',
        'BC'=>'sexual dysfuntion','BD'=>'hernia','BE'=>'groin','BF'=>'R /thigh','BG'=>'L /thigh','BH'=>'L /hand',
        'BJ'=>'L /shoulder','BK'=>'L /arm','BL'=>'L /elbow','BM'=>'L /foream','BN'=>'L /wrist',
        'BO'=>'L /ribs','BP'=>'L /leg','BQ'=>'L /knee','BR'=>'L /foot','BS'=>'L /ankle','BT'=>'L /upper ext',
        'BU'=>'R /Lower ext','BV'=>'L /hip','CF'=>'head','CG'=>'neck','CH'=>'back','CI'=>'R /shoulder','CJ'=>'chest',
        'CK'=>'R /arm','CL'=>'R /forearm','CM'=>'R /wrist','CN'=>'R /hand','CO'=>'finfers','CP'=>'waist','CQ'=>'R /ribs',
        'CR'=>'R /leg','CS'=>'R /knee','CT'=>'R /foot','CU'=>'R /ankle','CV'=>'toes','CW'=>'R /upper ext','CX'=>'R /lower ext',
        'CY'=>'R /hip','CZ'=>'upper back','DA'=>'mid back','DB'=>'lower back','DC'=>'R /elbow'];

    protected $oip = ['BI'=>'Other IBP:'];

    protected $catalogs = ['cities'=>'C','reasons_cancel'=>'U','reasons_confirm'=>'T','doctors'=>'P','attorneys'=>'X','insurances'=>'Z','lawoffices'=>'W','clinics'=>'O'];

    protected $users = ['alejandra@providencescheduling.com'=>617,'benjamin1@providencescheduling.com'=>618,'carlos@providencescheduling.com'=>611,'daisy@providencescheduling.com'=>614,'isabel@providencescheduling.com'=>616,'rene@providencescheduling.com'=>621,'wilbert@providencescheduling.com'=>620,'xiomara@providencescheduling.com'=>622,'lily@providencescheduling.com'=>611];

    /**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'This command helps to import cases from 1st July 2015 to 8th October 2015.';

	/**
	 * Create a new command instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * Execute the console command.
	 *
	 * @return mixed
	 */
	public function fire()
	{
        //$this->addMissingBodyParts();
        $headers = $this->option('with-headers');
		$filepath = dirname(dirname(dirname(dirname(__FILE__)))) . '/import/';
		$filename = $filepath . 'CasesProvidences.csv';
		$i = 0;
        $missing = 0;
        $this->getCatalogs();
        $Errors = fopen($filepath . 'Errors ' . date('Y-m-d Gis') . '.csv','w');
		if (file_exists($filename)) {
			if (($handle = fopen($filename, 'r')) !== FALSE) {
				while (($data = fgetcsv($handle, 5000, ",")) !== FALSE) {

					if (!empty($headers) && $headers == 1 && $i == 0) {}
                    else {
                        $new_case = [
                            'date_of_referral' => (strlen($data[$this->getColumnNumber('BW')]))?$data[$this->getColumnNumber('BW')]:$data[$this->getColumnNumber('J')],
                            'date_received' => (strlen($data[$this->getColumnNumber('J')]) > 0)?$data[$this->getColumnNumber('J')]:$data[$this->getColumnNumber('BW')],
                            'case_type' => $data[$this->getColumnNumber('CD')],
                            'firstname' => $data[$this->getColumnNumber('BY')],
                            'lastname' => $data[$this->getColumnNumber('BX')],
                            'dob' => (strlen($data[$this->getColumnNumber('BZ')]) > 0)?$data[$this->getColumnNumber('BZ')]: '1980-01-01',
                            'ssn' => $data[$this->getColumnNumber('I')],
                            'phone' => $data[$this->getColumnNumber('CA')],
                            'address' => $data[$this->getColumnNumber('CC')],
                            'address1' => $data[$this->getColumnNumber('A')],
                            'city' => $data[$this->getColumnNumber('C')],
                            'zipcode' => $data[$this->getColumnNumber('E')],
                            'doi' => $data[$this->getColumnNumber('CE')],
                            'body_parts' => $this->getBodyParts($data),
                            'other_ibp' => $data[$this->getColumnNumber('BI')],
                            'insurance_company_id' => $this->getId($data,'insurances'),
                            'insurance_notes' => ($this->getId($data,'insurances') == null)?utf8_encode($this->getId($data,'insurances')):null,
                            'is_doctor_mpn' => ($data[$this->getColumnNumber('AA')] == 'FALSE')? 0:1,
                            'employer_name' =>$data[$this->getColumnNumber('AB')],
                            'referral_source_id' => $this->getId($data,'lawoffices'),
                            'attorney_id' => $this->getId($data,'attorneys'),
                            'attorney_notes' => (strlen($data[$this->getColumnNumber('Y')]) > 0)?utf8_encode($data[$this->getColumnNumber('Y')]):null,
                            'clinic_id' => $this->getId($data,'clinics'),
                            'doctor_id' => $this->getId($data,'doctors'),
                            'scheduled_with' => $data[$this->getColumnNumber('Q')],
                            'appt_date' => (strlen($data[$this->getColumnNumber('R')]) > 0)? $data[$this->getColumnNumber('R')] . ' 00:00:01':null,
                            'appt_confirmed_id' => ($data[$this->getColumnNumber('O')] == 'Cancelled')? null: $this->getId($data,'reasons_confirm'),
                            'appt_reason_cancel_id' => ($data[$this->getColumnNumber('O')] == 'Cancelled')? $this->getId($data,'reasons_cancel'):null,
                            'date_moved' => (strlen($data[$this->getColumnNumber('V')]) > 0)?$data[$this->getColumnNumber('V')] : null,
                            'clinic_notes' => (strlen($data[$this->getColumnNumber('K')]) > 0)?utf8_encode($data[$this->getColumnNumber('K')]):null,
                            'patient_treating' => ($data[$this->getColumnNumber('L')] == 'YES')? 1:0,
                            'next_appt' => (strlen($data[$this->getColumnNumber('N')]) > 0)? $data[$this->getColumnNumber('N')]: null,
                            'verified_with' => $data[$this->getColumnNumber('M')],
                            'first_seen' => (strlen($data[$this->getColumnNumber('G')]) > 0)?$data[$this->getColumnNumber('G')]:null,
                            'created_at' => $data[$this->getColumnNumber('DD')] . ' 00:00:01',
                            'updated_at' => $data[$this->getColumnNumber('DE')] . ' 00:00:01',
                            'created_by' => $this->users[$data[$this->getColumnNumber('DG')]],
                            'updated_by' => $this->users[$data[$this->getColumnNumber('DH')]]
                        ];

                        if ($this->checkRecord($new_case)) {
                            $client = ClientShell::create($new_case);
                            // pasengers if exists.
                            if ($data[$this->getColumnNumber('CD')] == 'Personal Injury') {
                                // add passenger 1.
                                if (strlen($data[$this->getColumnNumber('AN')]) > 0) {
                                    $passenger1 = [
                                        'client_id' => $client->id,
                                        'name' => $data[$this->getColumnNumber('AN')],
                                        'dob' => (strlen($data[$this->getColumnNumber('AO')]) > 0)? $data[$this->getColumnNumber('AO')]:null,
                                        'phone' => $data[$this->getColumnNumber('AP')],
                                        'appt_date' => (strlen($data[$this->getColumnNumber('AH')]))?$data[$this->getColumnNumber('AH')]:null,
                                        'address' => $data[$this->getColumnNumber('AQ')]
                                    ];
                                    //$this->info(print_r($passenger1,true));
                                    PassengerShell::create($passenger1);
                                }

                                // add passenger 2.
                                if (strlen($data[$this->getColumnNumber('AS')]) > 0) {
                                    $passenger2 = [
                                        'client_id' => $client->id,
                                        'name' => $data[$this->getColumnNumber('AS')],
                                        'dob' => (strlen($data[$this->getColumnNumber('AT')]) > 0)? $data[$this->getColumnNumber('AT')]:null,
                                        'phone' => $data[$this->getColumnNumber('AU')],
                                        'appt_date' => (strlen($data[$this->getColumnNumber('AD')]) > 0)?$data[$this->getColumnNumber('AD')]:null,
                                        'address' => $data[$this->getColumnNumber('AV')]
                                    ];
                                    //$this->info(print_r($passenger2,true));
                                    PassengerShell::create($passenger2);
                                }

                                // add passenger 3.
                                if (strlen($data[$this->getColumnNumber('AI')]) > 0) {
                                    $passenger3 = [
                                        'client_id' => $client->id,
                                        'name' => $data[$this->getColumnNumber('AI')],
                                        'dob' => (strlen($data[$this->getColumnNumber('AJ')]) > 0)?$data[$this->getColumnNumber('AJ')]:null,
                                        'phone' => $data[$this->getColumnNumber('AK')],
                                        'appt_date' => (strlen($data[$this->getColumnNumber('AF')]) > 0)?$data[$this->getColumnNumber('AF')]:null,
                                        'address' => $data[$this->getColumnNumber('AL')]
                                    ];
                                    //$this->info(print_r($passenger3,true));
                                    PassengerShell::create($passenger3);
                                }
                            }
                        } else {
                            fputcsv($Errors,[$data[$this->getColumnNumber('CC')]]);
                            $missing++;
                        }
                    }
                    $i++;
				}
			}
		}
        fclose($Errors);
		$this->info("Number of added cases: {$i}");
        $this->info("Number of missed cases: {$missing}");
	}

	/**
	 * Get the console command arguments.
	 *
	 * @return array
	 */
	protected function getArguments()
	{
		return [
			//['example', InputArgument::REQUIRED, 'An example argument.'],
		];
	}

	/**
	 * Get the console command options.
	 *
	 * @return array
	 */
	protected function getOptions()
	{
		return [
			['with-headers', null, InputOption::VALUE_OPTIONAL, 'Use this option to indicate that the file include headers', null],
		];
	}

    protected function getCatalogs()
    {
        $this->cities = DB::table('cities')->join('regions','regions.id','=','cities.county_id')->select('cities.id','cities.name','cities.county_id')->get();
        $this->reasons_cancel = DB::table('reasons')->where('is_confirmation',0)->select('id','name')->get();
        $this->reasons_confirm = DB::table('reasons')->where('is_confirmation',1)->select('id','name')->get();
        $this->doctors = DB::table('attorneys_doctors')->where('is_attorney',0)->select('id','name')->get();
        $this->attorneys = DB::table('attorneys_doctors')->where('is_attorney',1)->select('id','name')->get();
        $this->clinics = DB::table('requesting_offices')->where('is_clinic',1)->select('id','name','zipcode')->get();
        $this->insurances = DB::table('requesting_offices')->where('is_insurance',1)->select('id','name')->get();
        $this->lawoffices = DB::table('requesting_offices')->where('is_lawoffice',1)->select('id','name')->get();
    }

    protected function getBodyParts($data)
    {
        $to_add = [];
        foreach($this->bodyparts as $key => $value) {
            if ($data[$this->getColumnNumber($key)] == 'TRUE') {
                $to_add[] = $value;
            }
        }
        return implode(',',$to_add);
    }

    protected function getId($data,$catalog)
    {
        foreach ($this->$catalog as $cat) {
            if ($catalog == 'cities') {
                if ($data[$this->getColumnNumber($this->catalogs[$catalog])] == $cat->name) {
                    return ['name'=>$cat->name,'county_id'=>$cat->county_id];
                }
            } elseif ($catalog == 'clinics') {
                if (preg_match("/^({$cat->name})/",$data[$this->getColumnNumber($this->catalogs[$catalog])]) && preg_match("/({$cat->zipcode})/",$data[$this->getColumnNumber($this->catalogs[$catalog])])) {
                    return $cat->id;
                }
            } elseif ($catalog == 'doctors') {
                $name = str_replace(',','',$data[$this->getColumnNumber($this->catalogs[$catalog])]);
                if ($name == $cat->name) {
                    return $cat->id;
                }
            } else {
                if ($data[$this->getColumnNumber($this->catalogs[$catalog])] == $cat->name) {
                    return $cat->id;
                }
            }
        }
        return null;
    }

    protected function getColumnNumber($column)
    {
        if (isset($this->alpha[$column])) {
            return $this->alpha[$column];
        }

        $column = str_split($column);
        $n_alpha = count($this->alpha);
        $number = $n_alpha * ($this->alpha[$column[0]] + 1); // first character
        $number += $this->alpha[$column[1]];
        return $number;
    }

    public function addMissingBodyParts()
    {
        $to_insert = [];
        $bodyparts = DB::table('bodyparts')->lists('name');
        foreach ($this->bodyparts as $key => $value) {
            // now find out if exists.
            $found = false;
            foreach ($bodyparts as $bp) {
                if ($bp == $value) {
                    $found = true;
                }
            }
            if (!$found) {
                $this->info($value);
                $to_insert[] = $value;
            }
        }

        if (count($to_insert) > 0) {
            foreach ($to_insert as $bodypart) {
                BodyPart::create(['name'=>chop($bodypart)]);
            }
        }
        $this->info("Added bodyparts: " . count($to_insert));
    }

    protected function checkRecord($case)
    {
        if (!isset($case['date_of_referral']) && strlen(chop($case['date_of_referral'])) == 0) {
            return false;
        }
        if (!isset($case['date_received']) && strlen(chop($case['date_received'])) == 0) {
            return false;
        }
        if (!isset($case['case_type']) && strlen(chop($case['case_type'])) == 0) {
            return false;
        }
        if (!isset($case['firstname']) && strlen(chop($case['firstname'])) == 0) {
            return false;
        }
        if (!isset($case['lastname']) && strlen(chop($case['lastname'])) == 0) {
            return false;
        }
        if (!isset($case['dob']) && strlen(chop($case['lastname'])) == 0) {
            return false;
        }
        if (!isset($case['phone']) && strlen(chop($case['phone'])) == 0) {
            return false;
        }
        if (!isset($case['address']) && strlen(chop($case['address'])) == 0) {
            return false;
        }
        if (!isset($case['city']) && strlen(chop($case['city'])) == 0) {
            return false;
        }
        if (!isset($case['zipcode']) && strlen(chop($case['zipcode'])) == 0) {
            return false;
        }
        if (!isset($case['doi']) && strlen(chop($case['doi'])) == 0) {
            return false;
        }
        if (!isset($case['body_parts']) && strlen(chop($case['body_parts'])) == 0) {
            return false;
        }

        return true;
    }

}
