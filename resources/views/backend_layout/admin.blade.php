<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="{{ asset('storage/logo_bumdes/logo-2.jpg') }}" type="image/png" />
	<!--plugins-->
	<link href="{{ asset('backend-assets/plugins/vectormap/jquery-jvectormap-2.0.2.css') }}" rel="stylesheet"/>
	<link href="{{ asset('backend-assets/plugins/simplebar/css/simplebar.css') }}" rel="stylesheet" />
	<link href="{{ asset('backend-assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css') }}" rel="stylesheet" />
	<link href="{{ asset('backend-assets/plugins/metismenu/css/metisMenu.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('backend-assets/plugins/datatable/css/dataTables.bootstrap5.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('backend-assets/plugins/highcharts/css/highcharts.css') }}" rel="stylesheet" />
	<!-- loader-->
	<link href="{{ asset('backend-assets/css/pace.min.css') }}" rel="stylesheet" />
	<script src="{{ asset('backend-assets/js/pace.min.js') }}"></script>
	<!-- Bootstrap CSS -->
	<link href="{{ asset('backend-assets/css/bootstrap.min.css') }}" rel="stylesheet">
	<link href="{{ asset('backend-assets/css/app.css') }}" rel="stylesheet">
	<link href="{{ asset('backend-assets/css/icons.css') }}" rel="stylesheet">
	<!-- Theme Style CSS -->
	<link rel="stylesheet" href="{{ asset('backend-assets/css/dark-theme.css') }}" />
	<link rel="stylesheet" href="{{ asset('backend-assets/css/semi-dark.css') }}" />
	<link rel="stylesheet" href="{{ asset('backend-assets/css/header-colors.css') }}" />

    <link href="{{ asset('backend-assets/plugins/select2/css/select2.min.css') }}" rel="stylesheet" />
	<link href="{{ asset('backend-assets/plugins/select2/css/select2-bootstrap4.css') }}" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<title>BUMDes Guna Artha</title>

    @yield('backend-head')
</head>

<body>
	<!--wrapper-->
	<div class="wrapper">
		<!--sidebar wrapper -->
		@include('backend_layout.sidebar')
		<!--end sidebar wrapper -->
		<!--start header -->
		@include('backend_layout.header')
		<!--end header -->
		<!--start page wrapper -->
		<div class="page-wrapper">
			<div class="page-content">
                @yield('backend')
			</div>
		</div>
		<!--end page wrapper -->
		<!--start overlay-->
		<div class="overlay toggle-icon"></div>
		<!--end overlay-->
		<!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
		<!--End Back To Top Button-->
		<footer class="page-footer">
			@include('backend_layout.footer')
		</footer>
	</div>
	<!--end wrapper-->
	<!-- Bootstrap JS -->
	<script src="{{ asset('backend-assets/js/bootstrap.bundle.min.js') }}"></script>
	<!--plugins-->
	<script src="{{ asset('backend-assets/js/jquery.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/simplebar/js/simplebar.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/metismenu/js/metisMenu.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/chartjs/js/Chart.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js') }}"></script>
    <script src="{{ asset('backend-assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/jquery.easy-pie-chart/jquery.easypiechart.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/sparkline-charts/jquery.sparkline.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/jquery-knob/excanvas.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/jquery-knob/jquery.knob.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/datatable/js/jquery.dataTables.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/datatable/js/dataTables.bootstrap5.min.js') }}"></script>
	  <script>
		  $(function() {
			  $(".knob").knob();
		  });
	  </script>
	  <script src="{{ asset('backend-assets/js/index.js') }}"></script>

    <!-- highcharts js -->
	<script src="{{ asset('backend-assets/plugins/highcharts/js/highcharts.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/highcharts-more.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/variable-pie.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/solid-gauge.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/highcharts-3d.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/cylinder.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/funnel3d.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/exporting.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/export-data.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/accessibility.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/highcharts/js/highcharts-custom.script.js') }}"></script>

    <script src="{{ asset('backend-assets/plugins/select2/js/select2.min.js') }}"></script>

    <!--notification js -->
	<script src="{{ asset('backend-assets/plugins/notifications/js/lobibox.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/notifications/js/notifications.min.js') }}"></script>
	<script src="{{ asset('backend-assets/plugins/notifications/js/notification-custom-script.js') }}"></script>
	<!--app JS-->
	<script src="{{ asset('backend-assets/js/app.js') }}"></script>

    @yield('backend-script')
</body>

</html>
