<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TopupController;
use App\Http\Controllers\BillPaymentController;
use App\Http\Controllers\FundTransferController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login'])->name('login');

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/topup', [TopUpController::class, 'store']);
    Route::post('/pay-bill', [BillPaymentController::class, 'pay']);
    Route::post('/transfer-fund', [FundTransferController::class, 'transfer']);

});