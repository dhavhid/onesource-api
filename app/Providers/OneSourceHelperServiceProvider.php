<?php namespace OneSource\Providers;

use App;
use Illuminate\Support\ServiceProvider;

class OneSourceHelperServiceProvider extends ServiceProvider {

	/**
	 * Bootstrap the application services.
	 *
	 * @return void
	 */
	public function boot()
	{
		//
	}

	/**
	 * Register the application services.
	 *
	 * @return void
	 */
	public function register()
	{
		App::bind('OneSourceHelper',function(){
			return new \OneSourceHelper\OneSourceHelper;
		});
	}

}
