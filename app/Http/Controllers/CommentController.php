<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'content' => 'required',
            'rating' => 'required|integer|min:1|max:5', // Kiểm tra rating từ 1 đến 5
            'id_sanpham' => 'required|exists:sanpham,id_sanpham',
            'id_kh' => 'required|exists:khachhang,id_kh',
        ]);

        // Tạo bình luận mới với dữ liệu từ form
        $comment = new Comment();
        $comment->content = $request->content;
        $comment->rating = $request->rating;
        $comment->id_sanpham = $request->id_sanpham;
        $comment->id_kh = $request->id_kh;
        $comment->save();

        return redirect()->back()->with('success', 'Bình luận của bạn đã được thêm thành công.');
    }
   
    
}
