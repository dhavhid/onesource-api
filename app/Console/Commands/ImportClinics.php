<?php namespace OneSource\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\ClinicShell;

/**
 * Class ImportClinics
 * @package OneSource\Console\Commands
 */
class ImportClinics extends Command {

	/**
	 * The console command name.
	 *
	 * @var string
	 */
	protected $name = 'import:clinics';

    /**
     * @var string
     */
    protected $filename = 'clinics.csv';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'This task takes the file clinics.csv from the import folder and import clinics to the table requesting_offices';

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
        $filepath = dirname(dirname(dirname(dirname(__FILE__)))) . '/import/';
        $filename = $filepath . 'clinics.csv';
        $cities = $filepath . 'ciudades.csv';
		$this->info('Reading file');
        $i = 0;
        if (file_exists($filename) && file_exists($cities)) {
            DB::table('requesting_offices')->where('is_clinic','=',1)->delete();
            $cities = $this->getCities($cities);
            if (($handle = fopen($filename, 'r')) !== FALSE) {
                while (($data = fgetcsv($handle, 5000, ",")) !== FALSE) {
                    if (isset($cities[chop($data[3])])) {
                        $new_clinic = [
                            'name' => chop($data[0]),
                            'address1' => chop($data[1]),
                            'address2' => chop($data[2]),
                            'city' => chop($data[3]),
                            'county' => $cities[chop($data[3])],
                            'zipcode' => chop($data[5]),
                            'phone' => chop($data[6]),
                            'fax' => chop($data[7]),
                            'contact' => 'N/A',
                            'is_lawoffice' => 0,
                            'is_insurance' => 0,
                            'is_clinic' => 1
                        ];
                        ClinicShell::create($new_clinic);
                        //$this->info(print_r($new_clinic, true));
                        $i++;
                    } else {
                        $this->error('This clinic could not be added because no city is set. ' . print_r($data,true));
                    }
                } // end of while
            }
        } else {
            $this->error('The file "clinics.csv" does not exists.' . $filename);
            return false;
        }
        $this->info("Number of clinics added: {$i}");
	}

    /**
     * @param $citiesfile
     * @return array
     */
    public function getCities($citiesfile)
    {
        $cities = [];
        if (($handle = fopen($citiesfile, 'r')) !== FALSE) {
            while (($data = fgetcsv($handle, 5000, ",")) !== FALSE) {
                $cities[chop($data[1])] = chop($data[0]);
            }
        }
        return $cities;
    }

	/**
	 * Get the console command arguments.
	 *
	 * @return array
	 */
	protected function getArguments()
	{
		return [
			//['filename', InputArgument::REQUIRED, 'The path of the file with the clinics to import.'],
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
			//['example', null, InputOption::VALUE_OPTIONAL, 'An example option.', null],
		];
	}

}
