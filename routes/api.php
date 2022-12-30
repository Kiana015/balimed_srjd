<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/rjd/data',[resikoJatuhDewasaController::class, 'store']);
Route::post('/rjd/data/{srjd}',[resikoJatuhDewasaController::class, 'update']);

Route::post('/tindakan/data',[tindakanController::class, 'store']);
Route::post('/tindakan/data/{srjd}',[tindakanController::class, 'update']);