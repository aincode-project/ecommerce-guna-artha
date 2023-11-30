<header class="header-area header-style-1 header-height-2">
    <div class="header-middle header-middle-ptb-1 d-none d-lg-block">
        <div class="container">
            <div class="header-wrap">
                <div class="logo logo-width-1">
                    <a href="{{ route('landing-page') }}" style="pointer-events: none"><img src="{{ asset('storage/logo_bumdes/logo-1.jpg') }}" alt="logo" /></a>
                </div>
                <div class="header-right">
                    <div class="search-style-1">
                        <form action="#">
                            <input type="text" placeholder="Search for items..." />
                        </form>
                    </div>
                    <div class="header-action-right">
                        <div class="header-action-2">
                            <div class="header-action-icon-2">
                                <a href="{{ route('home-user.index', 0) }}">
                                    <img class="svgInject" alt="Nest" src="{{ asset('build/assets/frontend-assets/imgs/theme/icons/icon-heart.svg') }}" />
                                </a>
                                <a href="{{ route('home-user.index', 0) }}"><span class="lable ml-0">Semua Kategori</span></a>
                                <div class="cart-dropdown-wrap cart-dropdown-hm2 account-dropdown">
                                    <ul>
                                        @foreach ($dataKategoriBarangs as $dataKategoriBarang)
                                        <li>
                                            <a href="{{ route('home-user.index', $dataKategoriBarang->id) }}">{{ $dataKategoriBarang->nama_kategori }}</a>
                                        </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                            @auth
                            <div class="header-action-icon-2">
                                <a class="mini-cart-icon" href="{{ route('keranjang.index') }}">
                                    <img alt="Nest" src="{{ asset('build/assets/frontend-assets/imgs/theme/icons/icon-cart.svg') }}" />
                                    {{-- <span class="pro-count blue">2</span> --}}
                                </a>
                                <a href="{{ route('keranjang.index') }}"><span class="lable">Cart</span></a>
                                <div class="cart-dropdown-wrap cart-dropdown-hm2">
                                    <ul>
                                        @foreach ($dataKeranjangs as $dataKeranjang)
                                        @if ($dataKeranjang->jumlah <= $dataKeranjang->barang->total_stok)
                                        <li>
                                            <div class="shopping-cart-img">
                                                <a href="shop-product-right.html"><img alt="Nest" src="{{ asset('storage/' . $dataKeranjang->barang->foto_barang) }}" /></a>
                                            </div>
                                            <div class="shopping-cart-title">
                                                <h4><a href="shop-product-right.html">{{ $dataKeranjang->barang->nama_barang }}</a></h4>
                                                <h4><span>{{ $dataKeranjang->jumlah }} × </span>@currency($dataKeranjang->barang->harga_jual)</h4>
                                            </div>
                                            {{-- <div class="shopping-cart-delete">
                                                <a href="#"><i class="fi-rs-cross-small"></i></a>
                                            </div> --}}
                                        </li>
                                        <hr>
                                        @endif
                                        @endforeach
                                    </ul>
                                    <div class="shopping-cart-footer">
                                        <div class="shopping-cart-total">
                                            <h4>Total <span>@currency($totalKeranjang)</span></h4>
                                        </div>
                                        <div class="shopping-cart-button">
                                            <a href="{{ route('keranjang.index') }}" class="outline">Lihat Keranjang</a>
                                            <a href="shop-checkout.html">Pesan</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endauth
                            <div class="header-action-icon-2">
                                <a href="page-account.html" style="pointer-events: none">
                                    <img class="svgInject" alt="Nest" src="{{ asset('build/assets/frontend-assets/imgs/theme/icons/icon-user.svg') }}" />
                                </a>
                                <a href="page-account.html" style="pointer-events: none"><span class="lable ml-0">Account</span></a>
                                <div class="cart-dropdown-wrap cart-dropdown-hm2 account-dropdown">
                                    <ul>
                                        @guest
                                        <li>
                                            <a href="{{ route('login') }}"><i class="fi fi-rs-user mr-10"></i>Sign In</a>
                                        </li>
                                        @endguest
                                        @auth
                                        {{-- <li>
                                            <a href="page-account.html"><i class="fi fi-rs-user mr-10"></i>My Account</a>
                                        </li>
                                        <li>
                                            <a href="page-account.html"><i class="fi fi-rs-location-alt mr-10"></i>Order Tracking</a>
                                        </li>
                                        <li>
                                            <a href="page-account.html"><i class="fi fi-rs-settings-sliders mr-10"></i>Setting</a>
                                        </li> --}}
                                        <li>
                                            <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="fi fi-rs-sign-out mr-10"></i>Sign out</a>
                                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                                @csrf
                                            </form>
                                        </li>
                                        @endauth
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="header-bottom header-bottom-bg-color sticky-bar">
        <div class="container">
            <div class="header-wrap header-space-between position-relative">
                <div class="logo logo-width-1 d-block d-lg-none">
                    <a href="index.html"><img src="{{ asset('build/assets/frontend-') }}assets/imgs/theme/logo.svg" alt="logo" /></a>
                </div>


                {{-- <div class="hotline d-none d-lg-flex">
                    <img src="{{ asset('build/assets/frontend-') }}assets/imgs/theme/icons/icon-headphone.svg" alt="hotline" />
                    <p>0361 - 12121381<span>Contact Center</span></p>
                </div> --}}
                <div class="header-action-icon-2 d-block d-lg-none">
                    <div class="burger-icon burger-icon-white">
                        <span class="burger-icon-top"></span>
                        <span class="burger-icon-mid"></span>
                        <span class="burger-icon-bottom"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- End Header  -->

<div class="mobile-header-active mobile-header-wrapper-style">
    <div class="mobile-header-wrapper-inner">
        <div class="mobile-header-top">
            <div class="mobile-header-logo">
                <a href="index.html"><img src="{{ asset('build/assets/frontend-') }}assets/imgs/theme/logo.svg" alt="logo" /></a>
            </div>
            <div class="mobile-menu-close close-style-wrap close-style-position-inherit">
                <button class="close-style search-close">
                    <i class="icon-top"></i>
                    <i class="icon-bottom"></i>
                </button>
            </div>
        </div>
        <div class="mobile-header-content-area">
            <div class="mobile-search search-style-3 mobile-header-border">
                <form action="#">
                    <input type="text" placeholder="Search for items…" />
                    <button type="submit"><i class="fi-rs-search"></i></button>
                </form>
            </div>
            <div class="mobile-menu-wrap mobile-header-border">
                <!-- mobile menu start -->
                {{-- <nav>
                    <ul class="mobile-menu font-heading">
                        <li class="menu-item-has-children">
                            <a href="index.html">Home</a>

                        </li>
                    </ul>
                </nav> --}}
                <!-- mobile menu end -->
            </div>
            <div class="mobile-header-info-wrap">
                <div class="single-mobile-header-info">
                    <a href="page-contact.html"><i class="fi-rs-marker"></i> Our location </a>
                </div>
                <div class="single-mobile-header-info">
                    <a href="page-login.html"><i class="fi-rs-user"></i>Log In / Sign Up </a>
                </div>
                <div class="single-mobile-header-info">
                    <a href="#"><i class="fi-rs-headphones"></i>(+01) - 2345 - 6789 </a>
                </div>
            </div>
            <div class="mobile-social-icon mb-50">
                <h6 class="mb-15">Follow Us</h6>
                <a href="#"><img src="{{ asset('build/assets/frontend-') }}assets/imgs/theme/icons/icon-facebook-white.svg" alt="" /></a>
                <a href="#"><img src="{{ asset('build/assets/frontend-') }}assets/imgs/theme/icons/icon-twitter-white.svg" alt="" /></a>
                <a href="#"><img src="{{ asset('build/assets/frontend-') }}assets/imgs/theme/icons/icon-instagram-white.svg" alt="" /></a>
                <a href="#"><img src="{{ asset('build/assets/frontend-') }}assets/imgs/theme/icons/icon-pinterest-white.svg" alt="" /></a>
                <a href="#"><img src="{{ asset('build/assets/frontend-') }}assets/imgs/theme/icons/icon-youtube-white.svg" alt="" /></a>
            </div>
            {{-- <div class="site-copyright">Copyright 2022 © Nest. All rights reserved. Powered by AliThemes.</div> --}}
        </div>
    </div>
</div>
