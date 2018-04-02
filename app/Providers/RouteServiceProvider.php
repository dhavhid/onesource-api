<?php namespace OneSource\Providers;

use Illuminate\Routing\Router;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class RouteServiceProvider extends ServiceProvider {

	/**
	 * This namespace is applied to the controller routes in your routes file.
	 *
	 * In addition, it is set as the URL generator's root namespace.
	 *
	 * @var string
	 */
	protected $namespace = 'OneSource\Http\Controllers';

	/**
	 * Define your route model bindings, pattern filters, etc.
	 *
	 * @param  \Illuminate\Routing\Router  $router
	 * @return void
	 */
	public function boot(Router $router)
	{
        $router->patterns([
            'id'=>'[0-9]+',
            'lawoffices' => '[0-9]+',
            'bodyparts' => '[0-9]+',
            'confirmations' => '[0-9]+',
            'cancelations' => '[0-9]+',
            'clinics' => '[0-9]+',
            'insurancecompanies' => '[0-9]+',
            'attorneys' => '[0-9]+',
            'doctors' => '[0-9]+',
            'clients' => '[0-9]+',
            'passengers' => '[0-9]+',
            'users' => '[0-9]+',
            'roles' => '[0-9]+'
        ]);
		parent::boot($router);

		//
	}

	/**
	 * Define the routes for the application.
	 *
	 * @param  \Illuminate\Routing\Router  $router
	 * @return void
	 */
	public function map(Router $router)
	{
		$router->group(['namespace' => $this->namespace], function($router)
		{
			require app_path('Http/routes.php');
		});
	}

}
