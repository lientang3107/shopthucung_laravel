@extends('admin_layout')
@section('admin_content')

<h1 class="h3 mb-3"><strong>Danh sách danh mục</strong></h1>

<div class="mb-3">
  @if(session()->has('success'))
      <div class="alert alert-success">
          {{ session('success') }}
      </div>
  @endif
</div>

<a class="btn btn-primary mb-3" href="{{ route('danhmuc.create') }}">Thêm danh mục</a>

<table class="table">
  <thead>
    <tr>
      <th>Id</th>
      <th>Tên danh mục</th>
      <th>Actions</th>
    </tr>
  </thead>

  <tbody>
    @foreach($Danhmucs as $danhmuc)
    <tr>
      <td>{{ $danhmuc->id_danhmuc }}</td>
      <td>{{ $danhmuc->ten_danhmuc }}</td>
      <td>
        <a href="{{ route('danhmuc.edit', ['danhmuc' => $danhmuc]) }}" class="btn btn-warning">Sửa</a>
        <form method="post" action="{{ route('danhmuc.destroy', ['danhmuc' => $danhmuc]) }}" style="display: inline-block;">
          @csrf
          @method('delete')
          <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?')">Xóa</button>
        </form>
      </td>
    </tr>
    @endforeach
  </tbody>
</table>
@endsection
