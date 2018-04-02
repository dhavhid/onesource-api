<?php namespace OneSource\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Mail;
use LucaDegasperi\OAuth2Server\Authorizer;
use OneSource\Http\Requests;
use OneSource\ApiResponse\ApiBody;
use OneSource\Client;
use OneSource\User;

use OneSourceHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

/**
 * Class MailController
 * @package OneSource\Http\Controllers
 */
class MailController extends Controller {

    /**
     * @param Request $request
     * @param Authorizer $authorizer
     * @param ApiBody $apiBody
     * @return mixed
     * @request: message, to,
     */
    public function sendMessage(Request $request, Authorizer $authorizer, ApiBody $apiBody)
    {
        $owner_id = $authorizer->getResourceOwnerId();
        $user = User::where('id',$owner_id)->first();
        $data = $request->all();
        $recipient = User::where('id',$data['to'])->first();
        if (isset($data['message']) && isset($data['to'])) {
            if (isset($data['id'])) {
                $data['link'] = 'Case to modify: <a href="' . env('APP_URL','http://providence.rmpublicidad.com.sv') . '/#/referrals/' . $data['id'] . '">Record ID# ' . $data['id'] .'</a>';
            } else {$data['link'] = false;}
            Mail::queue('emails.message',['user'=>$user->name,'emailBody'=>$data['message'],'link'=>$data['link'],'app_url'=>env('APP_URL','http://providence.rmpublicidad.com.sv')],function($message) use($data,$recipient,$user) {
                $message->to($recipient->email,$recipient->name)
                    ->cc($user->email,$user->name)
                    ->from($user->email,$user->name)
                    ->replyTo($user->email,$user->name)
                    ->subject($user->name . " sent you a reminder.");
            });
            $response = $apiBody->singleResult(['message'=>'Your reminder has been sent successfully.'],200,Config::get('constants.200'));
            $code = 200;
        } else {
            $response = $apiBody->singleResult(['message'=>'Your reminder could not be sent. Please try later.'],400,Config::get('constants.400'));
            $code = 400;
        }
        return response()->json($response,$code);
    }

}
