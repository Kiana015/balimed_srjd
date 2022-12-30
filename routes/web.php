<?php

use App\Helpers\RBACHelper;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function() {
    header('Location: /spa/home');
    exit();
});


/**
 * SPA (Single Page Application) Vue JS
 * biar saja seperti ini
 */
Route::get('/spa', function() {
    header('Location: /spa/home');
    exit();
});
// ->middleware(['auth']);

Route::get('/spa/{any}', function () {
    return view('spa.app');
})
->where('any','.*');
// ->middleware(['auth']);

Route::get('/build', function() {
    header('Location: /spa/home');
    exit();
});
// ->middleware(['auth']);

Route::get('/build/{any}', function () {
    return view('spa.app');
})
->where('any','.*');
// ->middleware(['auth']);

Route::get('/build/spa', function() {
    header('Location: /spa/home');
    exit();
});
// ->middleware(['auth']);

Route::get('/build/spa/{any}', function () {
    return view('spa.app');
})
->where('any','.*');
// ->middleware(['auth']);


/**
 * Route web
 * Kalau mau tanpa auth, hapus middleware(['auth'])
 */
// Route::middleware(['auth'])->group(function(){
    /**
     * Route api manual
     * Supaya session dari sso tetap bisa terpakai
     */
    Route::prefix('api')->group(function () {
        /**
         * Auth
         */
        Route::get('/rjd/data',[App\Http\Controllers\resikoJatuhDewasaController::class, 'showData']);
        Route::get('/rjd/data/{id}',[App\Http\Controllers\resikoJatuhDewasaController::class, 'showSpecData']);
        Route::get('/rjd/delete/{srjd}',[App\Http\Controllers\resikoJatuhDewasaController::class, 'delete']);

        Route::get('/tindakan/data',[App\Http\Controllers\tindakanController::class, 'showData']);
        Route::get('/tindakan/data/{id}',[App\Http\Controllers\tindakanController::class, 'showSpecData']);
        Route::get('/tindakan/delete/{srjd}',[App\Http\Controllers\tindakanController::class, 'delete']);

        Route::get('user', [App\Http\Controllers\Api\UserController::class, 'index']);
        
        /**
         * Get Data Master
         */
        Route::get('master/faskes', [App\Http\Controllers\Api\MasterController::class, 'getFaskes']);
        Route::get('master/paginate-icd', [App\Http\Controllers\Api\MasterController::class, 'paginateIcd']);
        Route::get('master/get-multi/{id}', [App\Http\Controllers\Api\MasterController::class, 'getMulti']);
        Route::get('master/{id}', [App\Http\Controllers\Api\MasterController::class, 'index']);

        /**
         * Layanan
         */
        Route::resource('layanan', App\Http\Controllers\Api\LayananController::class);
        
        /**
         * Triage
         */
        Route::get('triage/show-by-layanan-id/{id}', [App\Http\Controllers\Api\TriageController::class, 'showByLayananId']);
        Route::resource('triage', App\Http\Controllers\Api\TriageController::class);

        /**
         * Master data Log
         */
        Route::resource('log', App\Http\Controllers\Api\LogController::class);
        
        /**
         * Setup Unit
         * Setting2 berbagai variable 
         */
        Route::resource('setup-unit', App\Http\Controllers\Api\SetupUnitController::class);

    });

    /**
     * Auth
     */
    Route::post('logout',[App\Http\Controllers\Auth\LoginController::class, 'logout'])->name('logout');
    Route::get('logout',[App\Http\Controllers\Auth\LoginController::class, 'logout']);

    /**
     * RBAC dari template lama
     * Ini harus isi middleware auth
     */
    Route::prefix('rbac')->group(function () {
        Route::resource('menu', App\Http\Controllers\Rbac\MenuController::class);
        Route::get('loadRbacMenu',[App\Http\Controllers\Rbac\MenuController::class,'loadRbacMenu'])->name('rbac.menu.load');
        Route::get('getComboParentMenu',[App\Http\Controllers\Rbac\MenuController::class,'getComboParentMenu'])->name('rbac.menu.parent');

        Route::post('permission/listData',[App\Http\Controllers\Rbac\PermissionController::class,'listData'])->name('rbac.permission.listdata');
        Route::resource('permission', App\Http\Controllers\Rbac\PermissionController::class);
        
        Route::post('role/listData',[App\Http\Controllers\Rbac\RoleController::class,'listData'])->name('rbac.role.listdata');
        Route::resource('role', App\Http\Controllers\Rbac\RoleController::class);
        
        Route::resource('rolepermission', App\Http\Controllers\Rbac\RolePermissionController::class);
        
        Route::post('userrole/listData',[App\Http\Controllers\Rbac\UserRoleController::class,'listData'])->name('rbac.userrole.listdata');
        Route::post('userrole/updatePassword',[App\Http\Controllers\Rbac\UserRoleController::class,'updatePassword'])->name('rbac.userrole.password');
        Route::resource('userrole', App\Http\Controllers\Rbac\UserRoleController::class);
        
        Route::get('rbac/changeRoleActive/{role_id}',[App\Http\Controllers\Rbac\RbacController::class, 'changeRoleActive'])->name('change.role.active');
    });
// });

/**
 * Terkait SSO
 */
Route::prefix('sso')->group(function(){
    Route::get('redirect',[App\Http\Controllers\Auth\LoginController::class, 'redirect'])->name('redirect');
    Route::get('callback',[App\Http\Controllers\Auth\LoginController::class, 'callback'])->name('callback');
    Route::get('hastoken',[App\Http\Controllers\Auth\LoginController::class, 'loginSSO'])->name('hastoken')->middleware('sso');
});

/**
 * Get file di storage
 */
Route::get('storage/{folder}/{filename}', function ($folder, $filename)
{
    $path = storage_path('app/public/'.$folder.'/'.$filename);

    try {
        $file = File::get($path);
        $type = File::mimeType($path);
    } catch (\Throwable $th) {
        abort(404);
    }

    $response = Illuminate\Support\Facades\Response::make($file, 200);
    $response->header("Content-Type", $type);

    return $response;
})->name('storagex');

/**
 * Siapa tahu ada localStorage nyangkut
 */
Route::get('clear-data', function() {
    echo '<script>localStorage.clear(); setTimeout(() => window.location = "/spa/home", 1000)</script>';
});

/**
 * Versioning
 * Hanya untuk ngecek di live sudah berubah apa belum
 */
Route::get('version', function() {
    return response()->json([
        'status' => true,
        'message' => 'ok',
        'data' => array(
            'version' => '1.1.1',
            'date' => '24 Desember 2022'
        )
    ]);
});
