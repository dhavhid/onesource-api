<?php namespace OneSource\Http\Middleware;

use Closure;
use LucaDegasperi\OAuth2Server\Authorizer;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Contracts\Routing\TerminableMiddleware;
use Illuminate\Support\Facades\Log;
use OneSource\Client;
use OneSource\User;

class Activities implements TerminableMiddleware {

    protected $auth;
    protected $authorizer;

    /**
     * Create a new filter instance.
     *
     * @param  Guard  $auth
     * @return void
     */
    public function __construct(Guard $auth, Authorizer $authorizer)
    {
        $this->auth = $auth;
        $this->authorizer = $authorizer;
    }

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
        return $next($request);
	}

    public function terminate($request, $response)
    {
        $statusCode = $response->getStatusCode();
        if ($statusCode == 200) {
            $path = $request->path(); // it needs to hold v?/clients
            $method = $request->method(); // it can be PUT or POST
            if (preg_match("/v\d\/clients/",$path) === 1 && ($method == 'PUT' || $method == 'POST')) {
                $user_id = $this->authorizer->getResourceOwnerId();
                $content = json_decode($response->getContent(),true);
                $client = Client::find($content['data']['id']);
                if ($method == 'POST') {
                    $client->created_by = $user_id;
                }
                $client->updated_by = $user_id;
                $client->save();
            }
        }
    }

}