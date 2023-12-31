<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport"
    content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=device-dpi" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <title>e-Commerce BUMDes Guna Artha</title>
  <link rel="icon" type="image/png" href="{{ asset('storage/logo_bumdes/logo-2.jpg') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/all.min.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/bootstrap.min.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/select2.min.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/slick.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/jquery.nice-number.min.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/jquery.calendar.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/add_row_custon.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/mobile_menu.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/jquery.exzoom.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/multiple-image-video.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/ranger_style.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/jquery.classycountdown.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/venobox.min.css') }}">
  <link rel="stylesheet" href="{{ asset('backend-assets/plugins/datatable/css/dataTables.bootstrap5.min.css') }}" />

  <link rel="stylesheet" href="{{ asset('frontend-assets/css/style.css') }}">
  <link rel="stylesheet" href="{{ asset('frontend-assets/css/responsive.css') }}">
  <!-- <link rel="stylesheet" href="css/rtl.css"> -->
</head>

<body>


  <!--=============================
    DASHBOARD MENU START
  ==============================-->
  <div class="wsus__dashboard_menu">
    <div class="wsusd__dashboard_user">
      <img src="{{ asset('storage/' . Auth::user()->customer->image) }}" alt="img" class="img-fluid">
      <p>{{ Auth::user()->name }}</p>
    </div>
  </div>
  <!--=============================
    DASHBOARD MENU END
  ==============================-->


  <!--=============================
    DASHBOARD START
  ==============================-->
  <section id="wsus__dashboard">
    <div class="container-fluid">
      <div class="dashboard_sidebar">
        <span class="close_icon">
          <i class="far fa-bars dash_bar"></i>
          <i class="far fa-times dash_close"></i>
        </span>
        <a href="dsahboard.html" class="dash_logo"><img src="{{ asset('storage/logo_bumdes/logo-1.jpg') }}" alt="logo" class="img-fluid"></a>
        <ul class="dashboard_link">
          <li><a class="active" href="{{ route('dashboard-customer.index') }}"><i class="fas fa-tachometer"></i>Dashboard</a></li>
          <li><a href="{{ route('home-user.index', 0) }}"><i class="fal fa-arrow-circle-right"></i>Lihat Produk</a></li>
          <li><a href="{{ route('transaksi.index') }}"><i class="fas fa-list-ul"></i> Daftar Transaksi</a></li>
          {{-- <li><a href="dsahboard_download.html"><i class="far fa-cloud-download-alt"></i> Downloads</a></li> --}}
          {{-- <li><a href="dsahboard_review.html"><i class="far fa-star"></i> Reviews</a></li> --}}
          {{-- <li><a href="dsahboard_wishlist.html"><i class="far fa-heart"></i> Wishlist</a></li> --}}
          <li><a href="{{ route('profil-customer.index') }}"><i class="far fa-user"></i> Profil</a></li>
          <li><a href="{{ route('alamat-customer.index') }}"><i class="fal fa-gift-card"></i> Alamat</a></li>
          <li>
            <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="far fa-sign-out-alt"></i> Log out</a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                @csrf
            </form>
          </li>
        </ul>
      </div>
      <div class="row">
        <div class="col-xl-9 col-xxl-10 col-lg-9 ms-auto">
            @yield('dashboard-content')
        </div>
      </div>
    </div>
  </section>
  <!--=============================
    DASHBOARD START
  ==============================-->


  <!--============================
      SCROLL BUTTON START
    ==============================-->
  <div class="wsus__scroll_btn">
    <i class="fas fa-chevron-up"></i>
  </div>
  <!--============================
    SCROLL BUTTON  END
  ==============================-->


  <!--jquery library js-->
  <script src="{{ asset('frontend-assets/js/jquery-3.6.0.min.js') }}"></script>
  <!--bootstrap js-->
  <script src="{{ asset('frontend-assets/js/bootstrap.bundle.min.js') }}"></script>
  <!--font-awesome js-->
  <script src="{{ asset('frontend-assets/js/Font-Awesome.js') }}"></script>
  <!--select2 js-->
  <script src="{{ asset('frontend-assets/js/select2.min.js') }}"></script>
  <!--slick slider js-->
  <script src="{{ asset('frontend-assets/js/slick.min.js') }}"></script>
  <!--simplyCountdown js-->
  <script src="{{ asset('frontend-assets/js/simplyCountdown.js') }}"></script>
  <!--product zoomer js-->
  <script src="{{ asset('frontend-assets/js/jquery.exzoom.js') }}"></script>
  <!--nice-number js-->
  <script src="{{ asset('frontend-assets/js/jquery.nice-number.min.js') }}"></script>
  <!--counter js-->
  <script src="{{ asset('frontend-assets/js/jquery.waypoints.min.js') }}"></script>
  <script src="{{ asset('frontend-assets/js/jquery.countup.min.js') }}"></script>
  <!--add row js-->
  <script src="{{ asset('frontend-assets/js/add_row_custon.js') }}"></script>
  <!--multiple-image-video js-->
  <script src="{{ asset('frontend-assets/js/multiple-image-video.js') }}"></script>
  <!--sticky sidebar js-->
  <script src="{{ asset('frontend-assets/js/sticky_sidebar.js') }}"></script>
  <!--price ranger js-->
  <script src="{{ asset('frontend-assets/js/ranger_jquery-ui.min.js') }}"></script>
  <script src="{{ asset('frontend-assets/js/ranger_slider.js') }}"></script>
  <!--isotope js-->
  <script src="{{ asset('frontend-assets/js/isotope.pkgd.min.js') }}"></script>
  <!--venobox js-->
  <script src="{{ asset('frontend-assets/js/venobox.min.js') }}"></script>
  <!--classycountdown js-->
  <script src="{{ asset('frontend-assets/js/jquery.classycountdown.js') }}"></script>

  <!--main/custom js-->
  <script src="{{ asset('frontend-assets/js/main.js') }}"></script>

  <script src="{{ asset('backend-assets/plugins/datatable/js/jquery.dataTables.min.js') }}"></script>
  <script src="{{ asset('backend-assets/plugins/datatable/js/dataTables.bootstrap5.min.js') }}"></script>

  @yield('dashboard-script')
</body>

</html>
