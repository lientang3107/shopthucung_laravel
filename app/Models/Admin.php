<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use Notifiable;

    protected $fillable = [
        'name', 'email', 'password', 'id_phanquyen',
    ];

    public function phanquyen()
    {
        return $this->belongsTo(PhanQuyen::class, 'id_phanquyen', 'id_phanquyen');
    }
}
