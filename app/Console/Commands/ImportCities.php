<?php namespace OneSource\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use Illuminate\Support\Facades\DB;
use OneSource\City;
use OneSource\Region;

class ImportCities extends Command {

	/**
	 * The console command name.
	 *
	 * @var string
	 */
	protected $name = 'import:cities';

    protected $counties;

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'This task imports all cities in california from the file cities.csv in the import folder.';

	/**
	 * Create a new command instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();
        $this->counties = Region::select('id','name')->get()->values()->toArray();
	}

	/**
	 * Execute the console command.
	 *
	 * @return mixed
	 */
	public function fire()
	{
        $filepath = dirname(dirname(dirname(dirname(__FILE__)))) . '/import/';
        $filename = $filepath . 'ciudades.csv';
        $this->info('Reading file');
        $i = 0;
        if (file_exists($filename)) {
            DB::table('cities')->delete();
            if (($handle = fopen($filename, 'r')) !== FALSE) {
                while (($data = fgetcsv($handle, 5000, ",")) !== FALSE) {
                    $county = $this->getCountyId(chop($data[0]));
                    if ($county !== false) {
                        $new_city = [
                            'name' => chop($data[1]),
                            'county_id' => $county
                        ];
                        City::create($new_city);
                        $i++;
                    }
                }
            }
        }
        $this->info("Number of cities added: {$i}");
	}

    protected function getCountyId($countyname)
    {
        foreach ($this->counties as $county) {
            if ($county['name'] == $countyname) {
                return $county['id'];
            }
        }
        return false;
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
			//['example', null, InputOption::VALUE_OPTIONAL, 'An example option.', null],
		];
	}

}
