
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <p>Xin chào!</p>
    <p>Mã đơn hàng của bạn là: {{ $id_dathang }}</p>
    <p>Cảm ơn bạn đã đặt hàng tại cửa hàng của chúng tôi với giá {{ number_format($tongtien, 0, ',', '.') }} VND. Đơn hàng của bạn đã được xác nhận và đang được xử lý.</p>
    <p>Xin vui lòng kiểm tra lại thông tin đơn hàng của bạn.</p>
    <p>Xin cảm ơn!</p>
</body>
</html>
