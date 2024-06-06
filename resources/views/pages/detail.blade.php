@extends('layout')
@section('content')
    <!--Main-->
    <div class="body" style="padding-top: 50px; background-color: #FFFFFF; color: #0e0d0d;">
        <a class="buy_continute" href="{{ URL::to('/') }}"><i class="fa fa-arrow-circle-left"></i> Trở lại mua hàng</a>
        @if (session('success'))
            <div class="alert alert-success mt-3">
                {{ session('success') }}
            </div>
        @endif
        <div class="product_card mt-3">
            <div class="product__details-img mr-2">
                <div class="big-img">
                    <img src="{{ asset($sanpham->anhsp) }}" alt="" id="zoom" style="visibility: visible;">
                </div>
            </div>

            <div class="product__details-info">
                <h3 style="margin-top: unset; line-height: unset;">{{ $sanpham->tensp }}</h3>
                <p>{{ $sanpham->mota }}</p>

                <div class="product__pride">
                    @if ($sanpham->giakhuyenmai < $sanpham->giasp && $sanpham->giakhuyenmai > 0)
                        <div class="product__pride-oldPride" style="font-size: 20px; text-align: start;">
                            <span class="Price">
                                <bdi>
                                    {{ number_format($sanpham->giasp, 0, ',', '.') }}
                                    <span class="currencySymbol">₫</span>
                                </bdi>
                            </span>
                        </div>
                        <div class="product__pride-newPride" style="font-size: 40px; text-align: start;">
                            <span class="Price">
                                <bdi>{{ number_format($sanpham->giakhuyenmai, 0, ',', '.') }}
                                    <span class="currencySymbol">₫</span>
                                </bdi>
                            </span>
                        </div>
                    @else
                        <div class="product__pride-newPride" style="font-size: 40px; text-align: start;">
                            <span class="Price">
                                <bdi>{{ number_format($sanpham->giasp, 0, ',', '.') }}
                                    <span class="currencySymbol">₫</span>
                                </bdi>
                            </span>
                        </div>
                    @endif
                </div>

                <form action="" method="POST">
                    <div class="number">
                        <span>
                            Số lượng
                            <span class="number__count">
                                {{ $sanpham->soluong }}
                            </span>
                        </span>
                    </div>

                    <div class="product__cart">
                        <a href="{{ route('add_to_cart', $sanpham->id_sanpham) }}" class="product__cart-add"
                            name="add-to-cart">
                            Thêm vào giỏ hàng
                        </a>
                        <a href="{{ route('add_go_to_cart', $sanpham->id_sanpham) }}" class="product__cart-buy"
                            name="buy-now">
                            Mua ngay
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <!-- Bình luận sản phẩm -->
        <div class="container">

            <!-- Form để thêm comment mới -->
            <form action="{{ route('comments.store') }}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="rating">Đánh giá:</label>
                    <div class="rating">
                        <input type="radio" id="star5" name="rating" value="5"><label for="star5"><i
                                class="fas fa-star"></i></label>
                        <input type="radio" id="star4" name="rating" value="4"><label for="star4"><i
                                class="fas fa-star"></i></label>
                        <input type="radio" id="star3" name="rating" value="3"><label for="star3"><i
                                class="fas fa-star"></i></label>
                        <input type="radio" id="star2" name="rating" value="2"><label for="star2"><i
                                class="fas fa-star"></i></label>
                        <input type="radio" id="star1" name="rating" value="1"><label for="star1"><i
                                class="fas fa-star"></i></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="content">Thêm bình luận:</label>
                    <textarea class="form-control" id="content" name="content" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <input type="hidden" name="id_sanpham" value="{{ $sanpham->id_sanpham }}">
                    @if (Auth::check())
                        <input type="hidden" name="id_kh" value="{{ Auth::user()->id_kh }}">
                    @endif
                </div>
                <button type="submit" class="btn btn-primary">Gửi bình luận</button>
            </form>
        </div>

        <!-- Hiển thị danh sách các bình luận -->
        <div class="container">
            <h2>Bình luận</h2>
            @if ($comments->count() > 0)
                @foreach ($comments as $comment)
                    <div class="comment">
                        <p><strong>{{ $comment->khachhang->hoten }}</strong></p>
                        <p>{{ $comment->content }}</p>
                        <p>Đánh giá:
                            @for ($i = 0; $i < $comment->rating; $i++)
                            <i class="fas fa-star" style="color: gold;"></i>
                            @endfor
                        </p>
                        <p>Thời gian: {{ $comment->created_at->format( 'd/m/Y H:i:s') }}</p>
                    </div>
                @endforeach
            @else
                <p>Chưa có bình luận nào.</p>
            @endif
        </div>

        <!-- Sản phẩm ngẫu nhiên -->
        <div class="body__mainTitle">
            <h2>CÓ THỂ BẠN CŨNG THÍCH</h2>
        </div>
        <div class="row">
            @foreach ($randoms as $random)
                <div class="col-lg-2_5 col-md-4 col-6 post2">
                    <a href="{{ route('detail', ['id' => $random->id_sanpham]) }}">
                        <div class="product">
                            <div class="product__img">
                                <img src="{{ asset($random->anhsp) }}" alt="">
                            </div>
                            <div class="product__sale">
                                <div>
                                    @if ($random->giamgia)
                                        -{{ $random->giamgia }}%
                                    @else
                                        Mới
                                    @endif
                                </div>
                            </div>

                            <div class="product__content">
                                <div class="product__title">
                                    {{$random->tensp}}
                                </div>
                            
                                <div class="product__pride">
                                    @if ($random->giakhuyenmai < $random->giasp && $random->giakhuyenmai > 0)
                                        <div class="product__pride-oldPride" style="font-size: 16px; text-align: start;">
                                            <span class="Price">
                                                <bdi>
                                                    <del>{{ number_format($random->giasp, 0, ',', '.') }}</del>
                                                    <span class="currencySymbol">₫</span>
                                                </bdi>
                                            </span>
                                        </div>
                                        <div class="product__pride-newPride" style="font-size: 24px; text-align: start; color: red;">
                                            <span class="Price">
                                                <bdi>{{ number_format($random->giakhuyenmai, 0, ',', '.') }}
                                                    <span class="currencySymbol">₫</span>
                                                </bdi>
                                            </span>
                                        </div>
                                    @else
                                        <div class="product__pride-newPride" style="font-size: 24px; text-align: start;">
                                            <span class="Price">
                                                <bdi>{{ number_format($random->giasp, 0, ',', '.') }}
                                                    <span class="currencySymbol">₫</span>
                                                </bdi>
                                            </span>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
@endsection
