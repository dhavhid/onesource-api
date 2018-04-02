<?php namespace OneSource\Console\Commands;

use Illuminate\Console\Command;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputArgument;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use OneSource\AttorneyShell;

class ImportAttorneys extends Command {

	/**
	 * The console command name.
	 *
	 * @var string
	 */
	protected $name = 'import:attorneys';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Import Attorneys from CSV backup file located at imports folder and named after "Attorneys.csv".';

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
        $filename = $filepath . 'Attorneys.csv';
        $this->info('Reading file');
        $i = 0;
        if (file_exists($filename)) {
            DB::table('attorneys_doctors')->where('is_attorney', '=', 1)->delete();
            if (($handle = fopen($filename, 'r')) !== FALSE) {
                while (($data = fgetcsv($handle, 5000, ",")) !== FALSE) {
                    $new_attorney = [
                        'name' => chop($data[0]),
                        'phone' => '(999) 999-9999',
                        'is_attorney' => 1,
                    ];
                    AttorneyShell::create($new_attorney);
                    $i++;
                }
            }
        }
        $this->info("Number of attorneys added: {$i}");
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
