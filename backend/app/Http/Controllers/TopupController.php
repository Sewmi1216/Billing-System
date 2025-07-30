<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Transaction;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class TopupController extends Controller
{
    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'amount' => 'required|numeric|min:1',
            ]);

            if ($validator->fails()) {
                Log::error("Validation failed:", ['error' => $validator->errors()]);
                return response()->json([
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            $validated = $validator->validated();
            $amount = (float) $validated['amount'];
            $user = auth()->user();

            DB::beginTransaction();

            // Update balance
            $user->balance += $amount;
            $user->save();

            // Activity log
            activity()
                ->causedBy($user)
                ->log("Top-up: Rs. {$amount}");

            // Transaction record
            Transaction::create([
                'user_id' => $user->id,
                'type' => 'Top-up',
                'amount' => $amount,
            ]);

            DB::commit();

            Log::info('Top-up successful', [
                'user_id' => $user->id,
                'amount' => $amount
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Top-up successful',
                'new_balance' => $user->balance
            ], 200);

        } catch (Exception $e) {
            DB::rollBack();

            Log::error('Top-up failed', [
                'error' => $e->getMessage(),
                'user_id' => auth()->id()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Top-up failed. Please try again.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}
