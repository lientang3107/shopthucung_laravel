<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderSuccess extends Mailable
{
    use Queueable, SerializesModels;
    

    public $order;

    public function __construct($order)
    {
        $this->order = $order;
    }

    public function build()
    {
        return $this->subject('Xác Nhận Đơn Hàng')
                    ->view('emails.orders.success')
                    ->with([
                        'id_dathang' => $this->order->id_dathang,
                        'tongtien' => $this->order->tongtien
                    ]);
    }
}
