<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->increments('id'); // Khóa chính tự tăng
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');

            $table->integer('id_phanquyen')->index('fk_admins');
        });
        //     $table->integer('id_phanquyen')->unsigned(); // Khóa ngoại từ bảng phanquyen
        //     $table->foreign('id_phanquyen')->references('id_phanquyen')->on('phanquyen')->onDelete('cascade');
        //     $table->rememberToken();
        //     $table->timestamps();
        // }); $table->integer('id_sanpham')->index('fk_comment');
        // $table->integer('id_kh')->index('fk_binhluan');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admins');
    }
};