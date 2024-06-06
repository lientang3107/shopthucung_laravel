@extends('admin_layout')
@section('admin_content')
<div class="container">
    <h1>Danh sách Nhân viên</h1>
    <a href="{{ route('admins.create') }}" class="btn btn-primary mb-3">Thêm nhân viên</a>

    @if (session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Email</th>
                <th>Quyền</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($admins as $admin)
            <tr>
                <td>{{ $admin->id_kh }}</td>
                <td>{{ $admin->hoten }}</td>
                <td>{{ $admin->email }}</td>
                <td>
                    {{ $admin->id_phanquyen }}
                </td>
                <td>
                    <a href="{{ route('admins.edit', $admin->id_kh) }}" class="btn btn-warning">Sửa</a>
                    <form action="{{ route('admins.destroy', $admin->id_kh) }}" method="POST" style="display:inline-block;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Xóa</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
