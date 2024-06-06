<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;

use App\Models\Sanpham;
use App\Models\Dathang;
use App\Models\ChitietDonhang;
use App\Mail\OrderSuccess;

class CartController extends Controller
{
    public function index()
    {
        $products = Sanpham::all();
        return view('products', compact('products'));
    }
 
    public function cart()
    {
        return view('pages.cart');
    }
    public function addToCart($id)
    {
        $product = Sanpham::findOrFail($id);
 
        $cart = session()->get('cart', []);
 
        if(isset($cart[$id])) {
            $cart[$id]['quantity']++;
        }  else {
            $cart[$id] = [
                "id_sanpham" => $product->id_sanpham,
                "tensp" => $product->tensp,
                "anhsp" => $product->anhsp,
                "giasp" => $product->giasp,
                "giamgia" => $product->giamgia,
                "giakhuyenmai" => $product->giakhuyenmai,
                "quantity" => 1
            ];
        }
 
        session()->put('cart', $cart);
        return redirect()->back()->with('success', 'Thêm vào giỏ hàng thành công!');
    }
    public function addGoToCart($id)
    {
        $product = Sanpham::findOrFail($id);
 
        $cart = session()->get('cart', []);
 
        if(isset($cart[$id])) {
            $cart[$id]['quantity']++;
        }  else {
            $cart[$id] = [
                "id_sanpham" => $product->id_sanpham,
                "tensp" => $product->tensp,
                "anhsp" => $product->anhsp,
                "giasp" => $product->giasp,
                "giamgia" => $product->giamgia,
                "giakhuyenmai" => $product->giakhuyenmai,
                "quantity" => 1
            ];
        }
 
        session()->put('cart', $cart);
        return redirect('/cart');
    }
 
    public function update(Request $request)
    {
        if($request->id && $request->quantity){
            $cart = session()->get('cart');
            $cart[$request->id]["quantity"] = $request->quantity;
            session()->put('cart', $cart);
            session()->flash('success', 'Cập nhật giỏ hàng thành công!');
        }
    }
 
    public function remove(Request $request)
    {
        if($request->id) {
            $cart = session()->get('cart');
            if(isset($cart[$request->id])) {
                unset($cart[$request->id]);
                session()->put('cart', $cart);
            }
            session()->flash('success', 'Xóa sản phẩm trong giỏ hàng thành công');
        }
    }

    public function checkout(){
        if(Auth::check()){
            if(Auth::user()){
                $showusers = DB::table('khachhang')
                    ->join('dathang', 'khachhang.id_kh', '=', 'dathang.id_kh')
                    ->select('khachhang.*')
                    ->where('khachhang.id_kh', Auth::user()->id_kh)
                    ->get();

                return view('pages.checkout', ['showusers' => $showusers]);
            }
        }
        return redirect('/login');
    }

    public function dathang(Request $request)
{
    // Kiểm tra nếu giỏ hàng không tồn tại hoặc rỗng
    if (!$request->session()->has('cart') || empty(session('cart'))) {
        return redirect()->back()->with('error', 'Giỏ hàng của bạn đang trống.');
    }

    // Lấy đối tượng người dùng hiện tại
    $user = Auth::user();

    // Kiểm tra xem người dùng có tồn tại hay không
    if (!$user) {
        return redirect('/login')->with('error', 'Bạn cần đăng nhập để tiếp tục.');
    }

    // Lấy đơn hàng từ session
    $cart = session('cart');

    // Kiểm tra xem giỏ hàng có phải là mảng không
    if (!is_array($cart)) {
        return redirect()->back()->with('error', 'Dữ liệu giỏ hàng không hợp lệ.');
    }
    
    if (empty($cart)) {
        return redirect()->back()->with('error', 'Giỏ hàng của bạn đang trống.');
    }


    // Tạo mới đơn hàng và lưu vào cơ sở dữ liệu
    $dathangCre = Dathang::create([
        'ngaydathang' => Carbon::now(),
        'ngaygiaohang' => null,
        'tongtien' => $request->tongtien,
        'phuongthucthanhtoan' => $request->redirect,
        'diachigiaohang' => $request->diachigiaohang,
        'trangthai' => 'đang xử lý',
        'id_kh' => $user->id_kh,
    ]);

    // Thêm các mục vào chi tiết đơn hàng
    foreach ($cart as $item) {
        ChitietDonhang::create([
            'tensp' => $item['tensp'],
            'soluong' => $item['quantity'],
            'giamgia' => $item['giamgia'],
            'giatien' => $item['giasp'],
            'giakhuyenmai' => $item['giakhuyenmai'],
            'id_sanpham' => $item['id_sanpham'],
            'id_dathang' => $dathangCre->id_dathang,
            'id_kh' => $user->id_kh,
        ]);
    }

    // Xóa giỏ hàng sau khi đặt hàng thành công
    $request->session()->forget('cart');

    // Gửi email thông báo đơn hàng thành công
    Mail::to($user->email)->send(new OrderSuccess($dathangCre, $user));

    // Redirect hoặc hiển thị thông báo đặt hàng thành công
    return view('pages.thongbaodathang');
}


    public function thongbaodathang(Request $request){


        if ($request->has('vnp_ResponseCode') && $request->has('vnp_TransactionNo')) {
            $responseCode = $request->input('vnp_ResponseCode');
            $order_id = session()->get('order_id');
            $order = Dathang::find($order_id);
    
            if ($order) {
                if ($responseCode == '00') {
                    $order->trangthai = 'đã thanh toán';
                    $order->ngaygiaohang = Carbon::now();
                    $order->save();
    
                    // Gửi email thông báo đơn hàng thành công
                    Mail::to(Auth::user()->email)->send(new OrderSuccess($order));
    
                    // Xóa giỏ hàng
                    session()->forget('cart');
                    session()->forget('order_id');
    
                    return view('pages.thongbaodathang');
                } else {
                    // Thanh toán thất bại
                    $order->trangthai = 'thanh toán thất bại';
                    $order->save();
    
                    // Xóa giỏ hàng
                    session()->forget('cart');
                    session()->forget('order_id');
    
                    return redirect('/cart')->with('error', 'Thanh toán thất bại, vui lòng thử lại.');
                }
            }
        } else {
            // Yêu cầu không hợp lệ
            return redirect('/cart')->with('error', 'Yêu cầu không hợp lệ.');
        }
    }

    public function vnpay(Request $request){
        // Kiểm tra giỏ hàng không trống
        if (!$request->session()->has('cart') || empty(session('cart'))) {
            return redirect()->back()->with('error', 'Giỏ hàng của bạn đang trống.');
        }
    
        // Lưu thông tin đơn hàng vào session
        session()->put('order_info', [
            'ngaydathang' => Carbon::now(),
            'ngaygiaohang' => null,
            'tongtien' => $request->tongtien,
            'phuongthucthanhtoan' => 'vnpay',
            'diachigiaohang' => $request->diachigiaohang,
            'trangthai' => "chờ thanh toán",
            'id_kh' => Auth::user()->id_kh,
        ]);
    
        // Tạo mới đơn hàng và lưu vào cơ sở dữ liệu
        $order = Dathang::create([
            'ngaydathang' => Carbon::now(),
            'ngaygiaohang' => null,
            'tongtien' => $request->tongtien,
            'phuongthucthanhtoan' => 'vnpay',
            'diachigiaohang' => $request->diachigiaohang,
            'trangthai' => "chờ thanh toán",
            'id_kh' => Auth::user()->id_kh,
        ]);
    
        // Thêm các mục vào chi tiết đơn hàng
        foreach(session('cart') as $item){
            ChitietDonhang::create([
                'tensp' => $item['tensp'],
                'soluong' => $item['quantity'],
                'giamgia' => $item['giamgia'],
                'giatien' => $item['giasp'],
                'giakhuyenmai' => $item['giakhuyenmai'],
                'id_sanpham' => $item['id_sanpham'],
                'id_dathang' => $order->id_dathang,
                'id_kh' => Auth::user()->id_kh
            ]);
        }
    
        // Lưu lại thông tin đơn hàng để xử lý sau
        session()->put('order_id', $order->id_dathang);
    
        // Cấu hình tham số cho VNPAY
        $vnp_TmnCode = "GHHNT2HB"; // Mã website tại VNPAY
        $vnp_HashSecret = "BAGAOHAPRHKQZASKQZASVPRSAKPXNYXS"; // Chuỗi bí mật
        $vnp_Url = "http://sandbox.vnpayment.vn/paymentv2/vpcpay.html"; // URL của VNPAY
        $vnp_Returnurl = route('thongbaodathang'); // Đường dẫn trả về sau khi thanh toán thành công
        $vnp_TxnRef = Carbon::now()->format("YmdHis"); // Mã đơn hàng
        $vnp_OrderInfo = "Thanh toán hóa đơn phí dịch vụ"; // Thông tin đơn hàng
        $vnp_OrderType = 'billpayment'; // Loại đơn hàng
        $vnp_Amount = $request->tongtien * 100; // Tổng tiền, phải nhân 100 để đưa về đơn vị VNĐ
        $vnp_Locale = 'vn'; // Ngôn ngữ trang thanh toán VNPAY
        $vnp_IpAddr = $request->ip(); // Địa chỉ IP của người dùng
    
        // Tạo dữ liệu đầu vào cho VNPAY
        $inputData = [
            "vnp_Version" => "2.0.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => Carbon::now()->format('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
        ];
    
        // Sắp xếp dữ liệu theo thứ tự mã hóa
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . $key . "=" . $value;
            } else {
                $hashdata .= $key . "=" . $value;
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }
    
        // Thêm tham số bảo mật
        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash('sha256', $vnp_HashSecret . $hashdata);
            $vnp_Url .= 'vnp_SecureHashType=SHA256&vnp_SecureHash=' . $vnpSecureHash;
        }
    
        // Chuyển hướng đến trang thanh toán VNPAY
        return redirect($vnp_Url);
    }
}    
