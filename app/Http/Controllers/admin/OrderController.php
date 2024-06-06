<?php

namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Repositories\IOrderRepository;
use App\Mail\OrderCancelled;
use Illuminate\Support\Facades\Mail;

class OrderController extends Controller
{

    private $OrderRepository;

    public function __construct(IOrderRepository $OrderRepository) {
        $this->OrderRepository = $OrderRepository;
    }

    public function index(){
        $orders = $this->OrderRepository->allOrder();
        return view('admin.orders.index', ['orders' => $orders]);
    }

    public function edit($id){
        $order = $this->OrderRepository->findOrder($id);
        $orderdetails = $this->OrderRepository->findDetailProduct($id);
        $showusers = $this->OrderRepository->findUser($id);
        return view('admin.orders.edit', ['order' => $order, 'orderdetails' => $orderdetails, 'showusers' => $showusers]);
    }

    public function update($id, Request $request){
        $validatedData = $request->validate([
            'ngaygiaohang' => 'required',
            'trangthai' => 'required',
        ]);
        $order = $this->OrderRepository->findOrder($id);
        $this->OrderRepository->updateOrder($validatedData, $id);


        if ($validatedData['trangthai'] === 'đã hủy' && $order->trangthai !== 'đã hủy') {
            $showUsers = $this->OrderRepository->findUser($id);
    
            foreach ($showUsers as $showUser) {
                Mail::to($showUser->email)->send(new OrderCancelled($order));
            }
        }

        return redirect()->route('orders.index')->with('success', 'Cập nhật đơn hàng thành công');
    }

}
