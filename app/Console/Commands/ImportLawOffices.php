<?php namespace OneSource\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\LawOfficeShell;

class ImportLawOffices extends Command {

	/**
	 * The console command name.
	 *
	 * @var string
	 */
	protected $name = 'import:lawoffices';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Import Law Offices from CSV backup file located at imports folder and named after "LawOffices.csv"';

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
        $filename = $filepath . 'LawOffices.csv';
        $this->info('Reading file');
        $i = 0;
        if (file_exists($filename)) {
            DB::table('requesting_offices')->where('is_lawoffice', '=', 1)->delete();
            if (($handle = fopen($filename, 'r')) !== FALSE) {
                while (($data = fgetcsv($handle, 5000, ",")) !== FALSE) {
                    $new_lawoffice = [
                        'name' => chop($data[0]),
                        'address1' => 'N/A',
                        'city' => 'Los Angeles',
                        'county' => 'Los Angeles',
                        'zipcode' => '90001',
                        'phone' => '(999) 999-9999',
                        'contact' => 'N/A',
                        'is_lawoffice' => 1,
                        'is_insurance' => 0,
                        'is_clinic' => 0
                    ];
                    LawOfficeShell::create($new_lawoffice);
                    $i++;
                }
            }
        }
        $this->info("Number of clinics added: {$i}");
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
