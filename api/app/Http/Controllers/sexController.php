<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
class sexController extends Controller
{

    public function allSex()
    {
        $query='SELECT ID,
        DESCRIPTION
    FROM PUBLIC.SEX;';
       return DB::select( DB::raw($query));
    }


}
