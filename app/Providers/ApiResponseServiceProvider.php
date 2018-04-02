<?php namespace OneSource\Providers;
use App;
use Illuminate\Support\ServiceProvider;

class ApiResponseServiceProvider extends ServiceProvider {

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
		App::bind('apiBody',function(){
            return new \ApiResponse\ApiBody;
        });
	}

}
