<?php

namespace App\Http\Controllers;

use App\Models\marital_status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class MaritalStatusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getMaritalStatus()
    {
        $query='SELECT
        ID,
        DESCRIPTION
        FROM PUBLIC.MARITAL_STATUS ORDER BY ID ASC;';
       return DB::select( DB::raw($query));
    }


}
