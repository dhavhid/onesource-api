<?php namespace OneSource\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel {

	/**
	 * The Artisan commands provided by your application.
	 *
	 * @var array
	 */
	protected $commands = [
		'OneSource\Console\Commands\Inspire',
		'OneSource\Console\Commands\ImportClinics',
        'OneSource\Console\Commands\ImportLawOffices',
        'OneSource\Console\Commands\ImportInsurances',
        'OneSource\Console\Commands\ImportAttorneys',
        'OneSource\Console\Commands\ImportDoctors',
        'OneSource\Console\Commands\ImportCities',
		'OneSource\Console\Commands\ImportCases'
	];

	/**
	 * Define the application's command schedule.
	 *
	 * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
	 * @return void
	 */
	protected function schedule(Schedule $schedule)
	{
		$schedule->command('inspire')
				 ->hourly();
	}

}
