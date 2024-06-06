I. Tải laragon
- Truy cập vào liên kết https://laragon.org/download/index.html. 
- Vui lòng tải bản full.
- Ấn next liên tiếp => Install => finish (Địa chỉ khuyến khích lưu C:/laragon.)
- Thiết lập lại các thông số phù hợp với  máy của mình. Ở đây em để mặc định tất cả.
II. Tải PHPMyAdmin
- Tại link này https://www.phpmyadmin.net/downloads/. 
- Giải nén và copy tất cả cái file con của PHPMyAdmin vừa tải.
- Sau đó tại C:/laragon/etc/apps  tạo 1 tệp tên “phpMyAdmin” bỏ tất cả các file đã copy vào tệp vừa tạo.
III. Chạy Project
Bước 1: Tải và giải nén project về để vào tại C:/laragon/www.
Bước 2: Quay lại Laragon ấn vào mục database => chạy phpMyAdmin đầu tiên => tạo mới tên Database là “larave” import file sql có sẵn tại C:/laragon/www/shopthucung_laravel/larave.sql và bấm chạy.
Bước 3: Tại Laragon ấn chạy “Terminal” thực hiện các lệnh sau:
cd shopthucung_laravel
composer install
php artisan key:generate
Bước 4: Chỉnh lại file .env tại C:/laragon/www/shopthucung_laravel/.env
 -- các thông số dưới sao cho phù hợp với máy --
 
DB_CONNECTION=mysql   //kiểu kết nối
DB_HOST=127.0.0.1    //host truy cập
DB_PORT=3306     //port mysql
DB_DATABASE=larave  //tên database
DB_USERNAME=root   //user
DB_PASSWORD=          //nếu root có pass thì nhập không thì để trống
Bước 5: Gõ trên thanh địa chỉ của trình duyệt web bất kì:
Shopthucung_laravel.test => đi đến trang mua hàng.
Shopthucung_laravel.test/admin => đi đến trang quản trị.
*Quý thầy, cô hãy chắc chắn rằng đã bật chạy laragon bằng nút “ Start All” 
IV. Các tài khoản chạy thử chương trình.
•	Các tài khoản quản trị
Email: admin@gmail.com 	password: 123 (admin)
Email: 123@gmail.com	     password: 123456 (admin)
Email: staff@gmail.com 	          password: 123456 (nhân viên)
•	Các tài khoản khách hàng
Email: teo@gmail.com 	password:123 
Email: 2051010167lien@ou.edu.vn	 password: 123
Email: muahang@gmail.com 	password: 123














 


