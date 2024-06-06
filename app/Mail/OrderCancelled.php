<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderCancelled extends Mailable
{
    use Queueable, SerializesModels;

    public $order;

    public function __construct($order) {
        $this->order = $order;
    }

    public function build() {
        return $this->subject('Thông Báo Hủy Đơn Hàng')
                    ->view('emails.orders.order_cancelled');
    }
}
