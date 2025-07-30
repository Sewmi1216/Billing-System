<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Models\Transaction;
use Illuminate\Support\Facades\Validator;

class BillPaymentController extends Controller
{
   public function pay(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'biller' => 'required|in:Electricity,Water,Internet',
                'amount' => 'required|numeric|min:1',
            ]);

            if ($validator->fails()) {
                Log::error("Validation failed for bill payment", ['errors' => $validator->errors()]);
                return response()->json([
                    'success'=> false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors(),
                ], 422);
            }

            $validated = $validator->validated();
            $user = $request->user();

            $biller = $validated['biller'];
            $amount = (float) $validated['amount'];

            $feeMap = [
                'Electricity' => 0.10,
                'Water' => 0.05,
                'Internet' => 0,
            ];

            $fee = $amount * $feeMap[$biller];
            $total = $amount + $fee;

            if ($user->balance < $total) {
                Log::warning("Insufficient balance for user {$user->id}", [
                    'required' => $total,
                    'available' => $user->balance,
                ]);

                return response()->json(['success'=> false, 'message' => 'Insufficient balance'], 400);
            }

            // Deduct balance
            $user->balance -= $total;
            $user->save();

            // Log activity
            activity()->causedBy($user)->log("Paid Rs. {$total} for {$biller}");

            // Save transaction
            Transaction::create([
                'user_id' => $user->id,
                'type' => 'Bill Payment',
                'amount' => $total,
                'description' => "{$biller} (Base: Rs. {$amount}, Extra Fee: Rs. {$fee})"
            ]);

            Log::info("Bill payment successful", [
                'user_id' => $user->id,
                'biller' => $biller,
                'amount' => $amount,
                'fee' => $fee,
                'total_deducted' => $total,
            ]);

            return response()->json(['success'=> true, 'message' => 'Payment successful'], 200);

        } catch (\Exception $e) {
            Log::error("Bill payment failed", [
                'user_id' => auth()->id(),
                'error' => $e->getMessage(),
            ]);

            return response()->json([
                'success'=> false, 
                'message' => 'Payment failed. Please try again later.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

}
