@extends('frontend-layout.admin')

@section('frontend-content')
<!--============================
    BREADCRUMB START
==============================-->
<section id="wsus__breadcrumb">
    <div class="wsus_breadcrumb_overlay">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h4>register</h4>
                    <ul>
                        <li><a href="{{ route('home-user.index', 0) }}">home</a></li>
                        <li><a href="{{ route('register') }}">register</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!--============================
    BREADCRUMB END
==============================-->


<!--============================
    LOGIN/REGISTER PAGE START
==============================-->
<section id="wsus__login_register">
    <div class="container">
        <div class="row">
            <div class="col-xl-5 m-auto">
                <div class="wsus__login_reg_area">
                    <ul class="nav nav-pills mb-3" id="pills-tab2" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a href="{{ route('login') }}" class="nav-link" id="pills-home-tab2" style="color: rgb(30, 170, 225); text-align: center">login</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a href="{{ route('register') }}" class="nav-link active" id="pills-profile-tab2" style="color: skyblue; text-align: center">signup</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent2">
                        <div class="tab-pane fade show active" id="pills-profiles" role="tabpanel"
                            aria-labelledby="pills-profile-tab2">
                            <div class="wsus__login">
                                <form method="POST" action="{{ route('register') }}" enctype="multipart/form-data">
                                    @csrf
                                    <div class="wsus__login_input">
                                        <input type="text" class="@error('name') is-invalid @enderror" id="name" placeholder="Full Name" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="wsus__login_input">
                                        <select id="jenis_kelamin" name="jenis_kelamin" aria-label="Default select example">
                                            <option value="" style="color: gray" selected disabled>Jenis Kelamin</option>
                                            <option value="Laki-laki">Laki-laki</option>
                                            <option value="Perempuan">Perempuan</option>
                                        </select>
                                    </div>
                                    <div class="wsus__login_input">
                                                <input type="text" class="@error('no_telp') is-invalid @enderror" id="no_telp" placeholder="No Telp" name="no_telp" value="{{ old('name') }}" required autocomplete="no_telp" autofocus>
                                                @error('no_telp')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                    </div>
                                    <div class="wsus__login_input">
                                                <input id="email" type="email" class="@error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="Email (example@user.com)">
                                                @error('email')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                    </div>
                                    <div class="wsus__login_input">
                                                <input id="password" type="password" class="@error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="Enter Password">
                                                @error('password')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                    </div>
                                    <div class="wsus__login_input">
                                                <input id="password-confirm" type="password" name="password_confirmation" required autocomplete="new-password" placeholder="Confirm Password">
                                    </div>
                                    <div class="wsus__login_input">
                                        <div class="row">
                                            <div class="col-xl-12">
                                                <img class="img-preview img-fluid mb-3 col-sm-4" style="display: none;">
                                            </div>
                                            <div class="col-xl-12">
                                                <input id="image" type="file" style="padding-top: 20px" class="@error('image') is-invalid @enderror" name="image" value="{{ old('image') }}" onchange="previewImage()">
                                                @error('image')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="wsus__login_save">
                                        {{-- <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox"
                                                id="flexSwitchCheckDefault03">
                                            <label class="form-check-label" for="flexSwitchCheckDefault03">I consent
                                                to the privacy policy</label>
                                        </div> --}}
                                    </div>
                                    <button class="common_btn" type="submit">signup</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--============================
    LOGIN/REGISTER PAGE END
==============================-->
@endsection

@section('frontend-script')
    <script>
        function previewImage() {
            const image = document.querySelector('#image');
            const imgPreview = document.querySelector('.img-preview');

            imgPreview.style.display = 'block';

            const oFReader = new FileReader();
            oFReader.readAsDataURL(image.files[0]);

            oFReader.onload = function(oFREvent) {
                imgPreview.src = oFREvent.target.result;
            }
        }
    </script>
@endsection
