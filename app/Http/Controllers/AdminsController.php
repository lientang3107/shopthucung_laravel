<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Khachhang;
use App\Models\PhanQuyen;

class AdminsController extends Controller
{
    public function index()
    {
        $admins = Khachhang::all();
        return view('admins.index', compact('admins'));
    }

    public function create()
    {
        $roles = PhanQuyen::all();
        return view('admins.create', compact('roles'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:khachhang,email',
            'password' => 'required|min:6',
            'id_phanquyen' => 'required'
        ]);

        Khachhang::create([
            'hoten' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'id_phanquyen' => $request->id_phanquyen
        ]);

        return redirect()->route('admins.index')->with('success', 'Tạo nhân viên thành công');
    }

    public function edit($id)
    {
        $admin = Khachhang::find($id);
        $roles = PhanQuyen::all();
        return view('admins.edit', compact('admin', 'roles'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'hoten' => 'required',
            'email' => 'required|email|unique:admins,email,' . $id,
            'id_phanquyen' => 'required'
        ]);

        $admin = Khachhang::find($id);
        $admin->update([
            'hoten' => $request->hoten,
            'email' => $request->email,
            'password' => $request->password ? bcrypt($request->password) : $admin->password,
            'id_phanquyen' => $request->id_phanquyen
        ]);

        return redirect()->route('admins.index')->with('success', 'Cập nhập thông tin nhân viên thành công');
    }

    public function destroy($id)
    {
        Khachhang::destroy($id);
        return redirect()->route('admins.index')->with('success', 'Xóa nhân viên thành công');
    }
}
