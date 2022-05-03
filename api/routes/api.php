<?php

use App\Http\Controllers\sexController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



//auth
Route::post('/auth', 'App\Http\Controllers\AuthController@auth');

//employes
Route::get('/employes', 'App\Http\Controllers\EmployesController@getEmployes');
Route::post('/employes', 'App\Http\Controllers\EmployesController@postEmployes');
Route::put('/employes', 'App\Http\Controllers\EmployesController@putEmployes');
Route::delete('/employes/{id}', 'App\Http\Controllers\EmployesController@deleteEmployes');
//sex
Route::get('/sex', 'App\Http\Controllers\sexController@allSex');
//marital_status
Route::get('/marital_status', 'App\Http\Controllers\MaritalStatusController@getMaritalStatus');
//users
Route::get('/user', 'App\Http\Controllers\UserController@getUser');
