<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    protected $fillable = ['content', 'rating', 'id_sanpham', 'id_kh'];

    public function khachhang()
    {
        return $this->belongsTo(KhachHang::class, 'id_kh');
    }

    
}
