<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class FundTransferController extends Controller
{
    public function transfer(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'recipient_id' => 'required|exists:users,id',
                'amount' => 'required|numeric|min:1',
            ]);

            if ($validator->fails()) {
                Log::error("Validation failed for fund transfer", ['errors' => $validator->errors()]);
                return response()->json([
                    'success'=> false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors(),
                ], 422);
            }

            $validated = $validator->validated();
            $sender = $request->user();
            $recipient = User::findOrFail($validated['recipient_id']);

            if ($sender->id === $recipient->id) {
                Log::warning("User {$sender->id} tried to transfer funds to self.");
                return response()->json(['success'=> false,'message' => 'Cannot transfer to self'], 400);
            }

            if ($sender->balance < $validated['amount']) {
                Log::warning("Insufficient balance for transfer by user {$sender->id}", [
                    'success'=> false,
                    'available_balance' => $sender->balance,
                    'requested_amount' => $validated['amount'],
                ]);
                return response()->json(['message' => 'Insufficient balance'], 400);
            }

            // Adjust balances
            $sender->balance -= $validated['amount'];
            $recipient->balance += $validated['amount'];

            $sender->save();
            $recipient->save();

            // Log activity
            activity()->causedBy($sender)->log("Transferred Rs. {$validated['amount']} to {$recipient->name}");

            // Log transactions
            Transaction::create([
                'user_id' => $sender->id,
                'type' => 'Transfer Sent',
                'amount' => $validated['amount'],
                'description' => "To {$recipient->name}",
            ]);

            Transaction::create([
                'user_id' => $recipient->id,
                'type' => 'Transfer Received',
                'amount' => $validated['amount'],
                'description' => "From {$sender->name}",
            ]);

            Log::info("Transfer successful", [
                'from' => $sender->id,
                'to' => $recipient->id,
                'amount' => $validated['amount'],
            ]);

            return response()->json(['success'=> true,'message' => 'Transfer successful'], 200);

        } catch (Exception $e) {
            Log::error("Transfer failed", [
                'user_id' => auth()->id(),
                'error' => $e->getMessage(),
            ]);

            return response()->json([
                'success'=> false,
                'message' => 'Transfer failed. Please try again later.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

}
