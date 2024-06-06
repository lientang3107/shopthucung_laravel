@extends('admin_layout')
@section('admin_content')
<div class="container">
    <h1>Sửa nhân viên</h1>

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('admins.update', $admin->id_kh) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="hoten">Tên</label>
            <input type="text" class="form-control" id="hoten" name="hoten" value="{{ $admin->hoten }}" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="{{ $admin->email }}" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu (để trống nếu không đổi)</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="form-group">
            <label for="id_phanquyen">Tên quyền</label>
            <select class="form-control" id="id_phanquyen" name="id_phanquyen" required>
                @foreach ($roles as $role)
                    <option value="{{ $role->id_phanquyen }}" {{ $admin->id_phanquyen == $role->id_phanquyen ? 'selected' : '' }}>{{ $role->tenquyen }}</option>
                @endforeach
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>
@endsection
