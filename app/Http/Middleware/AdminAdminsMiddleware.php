<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminAdminsMiddleware
{
    /**
     * Xử lý một yêu cầu đến.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Kiểm tra nếu người dùng đã đăng nhập và có quyền truy cập (id_phanquyen là 1)
        if (Auth::check() && Auth::user()->id_phanquyen == 1) {
            return $next($request);
        } else {
            return redirect('/dashboard')->with('info', 'Không có quyền truy cập.');
        }
    }
}
