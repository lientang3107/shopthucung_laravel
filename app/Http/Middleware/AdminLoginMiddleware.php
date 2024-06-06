<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminLoginMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::user();
        if (Auth::check() && ($user->id_phanquyen == 1 || $user->id_phanquyen == 3)) {
            return $next($request);
        } else {
            return redirect('/admin')->with('info', 'Không có quyền truy cập.');
        }
    }
}
