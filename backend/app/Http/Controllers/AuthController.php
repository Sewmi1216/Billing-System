<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        try {
            Log::debug('Registering user', $request->all());

            $validator = Validator::make($request->all(), [
                'name' => 'required|string',
                'email' => 'required|email|unique:users',
                'password' => 'required|min:6|confirmed',
            ]);

            if ($validator->fails()) {
                Log::error("Validation failed:", ['error' => $validator->errors()]);
                return response()->json([
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            $validated = $validator->validated();

            $user = User::create([
                'name' => $validated['name'],
                'email' => $validated['email'],
                'password' => Hash::make($validated['password']),
            ]);

            // Generate API token
            $token = $user->createToken('auth_token')->plainTextToken;

            // Log activity using Spatie
            activity()
                ->causedBy($user)
                ->log("User registered: {$user->email}");

            Log::info("User registered successfully");

            return response()->json([
                'success' => true,
                'token' => $token,
                'user' => $user
            ]);
        } catch (\Exception $e) {
            Log::error('Error registering user', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function login(Request $request)
    {
        try {
            Log::debug('Attempting user login', $request->only('email'));

            $validator = Validator::make($request->all(), [
                'email' => 'required|email',
                'password' => 'required|string|min:6',
            ]);

            if ($validator->fails()) {
                Log::warning('Login validation failed', ['errors' => $validator->errors()]);
                return response()->json([
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            $user = User::where('email', $request->email)->first();

            if (!$user || !Hash::check($request->password, $user->password)) {
                Log::warning('Login failed: Invalid credentials for ' . $request->email);
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid email or password'
                ], 401);
            }

            $token = $user->createToken('auth_token')->plainTextToken;

            // Log activity using Spatie
            activity()
                ->causedBy($user)
                ->log("User logged in: {$user->email}");

            Log::info('User logged in successfully', ['user_id' => $user->id]);

            return response()->json([
                'success' => true,
                'token' => $token,
                'user' => $user
            ], 200);
        } catch (\Exception $e) {
            Log::error('Login error', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function logout(Request $request)
    {
        try {
            $user = $request->user();

            if ($user) {
                $user->currentAccessToken()->delete();

                // Log activity using Spatie
                activity()
                    ->causedBy($user)
                    ->log("User logged out: {$user->email}");

                Log::info('User logged out successfully', ['user_id' => $user->id]);

                return response()->json([
                    'success' => true,
                    'message' => 'Logged out successfully'
                ], 200);
            } else {
                Log::warning('Logout attempted without valid user');
                return response()->json([
                    'message' => 'No authenticated user found'
                ], 401);
            }
        } catch (\Exception $e) {
            Log::error('Logout error', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
