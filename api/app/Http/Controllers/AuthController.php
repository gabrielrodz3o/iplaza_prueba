<?php

namespace App\Http\Controllers;

use App\Models\user;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
//use App\Models\employes;
use Illuminate\Http\Request;

class AuthController extends Controller
{



    public function auth(Request $request)
    {

        $users =   DB::select(

            "SELECT ID,
            USERNAME,
            PASSWORD
        FROM PUBLIC.USERS where USERNAME=? and PASSWORD=?",
            [$request->username, $request->password]
        );

        if (count($users) > 0) {
            $user = $users[0];
            $token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2MjI4MTE4MTMsImV4cCI6MTY1NDM0NzgxM30.MPByadoQz5eQi_wiVgz6iyuhK7vxqujeFffbjjyLbiA';
            return [
                'username' => $user->username,
                'token' => $token
            ];
        } else {

            return  ([""])("error usuario o conraseña incorrectos")->response()->setStatusCode(202);;
        }
    }
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer'
        ]);
    }
}
