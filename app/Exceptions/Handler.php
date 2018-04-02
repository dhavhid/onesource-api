<?php namespace OneSource\Exceptions;

use Exception;
use OneSource\ApiResponse\ApiBody;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Support\Facades\Config;

class Handler extends ExceptionHandler {

    protected $apiBody;

	/**
	 * A list of the exception types that should not be reported.
	 *
	 * @var array
	 */
	protected $dontReport = [
		'Symfony\Component\HttpKernel\Exception\HttpException'
	];

	/**
	 * Report or log an exception.
	 *
	 * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
	 *
	 * @param  \Exception  $e
	 * @return void
	 */
	public function report(Exception $e)
	{
		return parent::report($e);
	}

	/**
	 * Render an exception into an HTTP response.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Exception  $e
	 * @return \Illuminate\Http\Response
	 */
	public function render($request, Exception $e)
	{
        $apiBody = new ApiBody();
        if (config('app.debug') == false) {
            $code = $e->getStatusCode();
            if (Config::has('constants.'.$code) == false) {
                $code = 404;
            }
            $result = $apiBody->singleResult(['message'=>Config::get('constants.'.$code)],$code,Config::get('constants.'.$code));
            return response()->json($result,$code);
        }
		return parent::render($request, $e);
	}

}
