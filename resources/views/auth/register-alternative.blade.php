<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="{{ asset('build/assets/backend-assets/images/favicon-32x32.png') }}" type="image/png" />
	<!--plugins-->
	<link href="{{ asset('build/assets/backend-assets/plugins/simplebar/css/simplebar.css') }}" rel="stylesheet" />
	<link href="{{ asset('build/assets/backend-assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css') }}" rel="stylesheet" />
	<link href="{{ asset('build/assets/backend-assets/plugins/metismenu/css/metisMenu.min.css') }}" rel="stylesheet" />
	<!-- loader-->
	<link href="{{ asset('build/assets/backend-assets/css/pace.min.css') }}" rel="stylesheet" />
	<script src="{{ asset('build/assets/backend-assets/js/pace.min.js') }}"></script>
	<!-- Bootstrap CSS -->
	<link href="{{ asset('build/assets/backend-assets/css/bootstrap.min.css') }}" rel="stylesheet">
	<link href="{{ asset('build/assets/backend-assets/css/app.css') }}" rel="stylesheet">
	<link href="{{ asset('build/assets/backend-assets/css/icons.css') }}" rel="stylesheet">
	<title>Rukada - Responsive Bootstrap 5 Admin Template</title>
</head>

<body class="bg-login">
	<!--wrapper-->
	<div class="wrapper">
		<div class="d-flex align-items-center justify-content-center my-5 my-lg-0">
			<div class="container">
				<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-2">
					<div class="col mx-auto">
						<div class="my-4 text-center">
							<img src="{{ asset('build/assets/backend-assets/images/logo-img.png') }}" width="180" alt="" />
						</div>
						<div class="card">
							<div class="card-body">
								<div class="border p-4 rounded">
									<div class="text-center">
										<h3 class="">Sign Up</h3>
									</div>
									<div class="form-body">
										<form class="row g-3" action="{{ route('register') }}" method="POST">
                                            @csrf
											<div class="col-sm-12">
												<label for="name" class="form-label">Nama Lengkap</label>
												<input type="text" class="form-control @error('name') is-invalid @enderror" id="name" placeholder="Full Name" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                                @error('name')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
											</div>
                                            <div class="col-12">
												<label for="jenis_kelamin" class="form-label">Jenis Kelamin</label>
												<select class="form-select" id="jenis_kelamin" name="jenis_kelamin" aria-label="Default select example">
													<option value="Laki-laki" selected>Laki-laki</option>
													<option value="Perempuan">Perempuan</option>
												</select>
											</div>
                                            <div class="col-sm-12">
												<label for="no_telp" class="form-label">No. Telp</label>
												<input type="text" class="form-control @error('no_telp') is-invalid @enderror" id="no_telp" placeholder="0812xxxxxxxx" name="no_telp" value="{{ old('name') }}" required autocomplete="no_telp" autofocus>

                                                @error('no_telp')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
											</div>
											<div class="col-12">
												<label for="email" class="form-label">Email Address</label>
												<input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="example@user.com">

                                                @error('email')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
											</div>
											<div class="col-12">
												<label for="password" class="form-label">Password</label>
												<div class="input-group" id="show_hide_password">
													<input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="Enter Password"> <a href="javascript:;" class="input-group-text bg-transparent"><i class='bx bx-hide'></i></a>
												</div>
                                                @error('password')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
											</div>
											<div class="col-12">
												<label for="password-confirm" class="form-label">Confirm Password</label>
												<div class="input-group" id="show_hide_password">
													<input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="Enter Password">
												</div>
											</div>

											<div class="col-12">
												<p>Already have an account? <a href="{{ route('login') }}">Sign in here</a>
                                                </p>
											</div>
											<div class="col-12">
												<div class="d-grid">
													<button type="submit" class="btn btn-primary"><i class='bx bx-user'></i>Sign up</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--end row-->
			</div>
		</div>
	</div>
	<!--end wrapper-->
	<!-- Bootstrap JS -->
	<script src="{{ asset('build/assets/backend-assets/js/bootstrap.bundle.min.js') }}"></script>
	<!--plugins-->
	<script src="{{ asset('build/assets/backend-assets/js/jquery.min.js') }}"></script>
	<script src="{{ asset('build/assets/backend-assets/plugins/simplebar/js/simplebar.min.js') }}"></script>
	<script src="{{ asset('build/assets/backend-assets/plugins/metismenu/js/metisMenu.min.js') }}"></script>
	<script src="{{ asset('build/assets/backend-assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js') }}"></script>
	<!--Password show & hide js -->
	<script>
		$(document).ready(function () {
			$("#show_hide_password a").on('click', function (event) {
				event.preventDefault();
				if ($('#show_hide_password input').attr("type") == "text") {
					$('#show_hide_password input').attr('type', 'password');
					$('#show_hide_password i').addClass("bx-hide");
					$('#show_hide_password i').removeClass("bx-show");
				} else if ($('#show_hide_password input').attr("type") == "password") {
					$('#show_hide_password input').attr('type', 'text');
					$('#show_hide_password i').removeClass("bx-hide");
					$('#show_hide_password i').addClass("bx-show");
				}
			});
		});
	</script>
	<!--app JS-->
	<script src="{{ asset('build/assets/backend-assets/js/app.js') }}"></script>
</body>

</html>
