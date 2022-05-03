<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
class UserController extends Controller
{
    public function getUser()
    {
        $query='SELECT ID,
        USERNAME,
        PASSWORD
         FROM PUBLIC."user" order by id asc;';
       return DB::select( DB::raw($query));
    }
}
