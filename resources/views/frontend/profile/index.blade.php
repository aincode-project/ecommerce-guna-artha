@extends('frontend-layout.dashboard-customer')

@section('dashboard-content')
<div class="dashboard_content mt-2 mt-md-0">
    <h3><i class="far fa-user"></i> profile</h3>
    <div class="wsus__dashboard_profile">
      <div class="wsus__dash_pro_area">
        <h4>Informasi Customer</h4>
        <form action="{{ route('profil-customer.update', $dataCustomer->id) }}" method="post" enctype="multipart/form-data">
            @method('PUT')
            @csrf
          <div class="row">
            <div class="col-xl-9">
              <div class="row">
                <div class="col-xl-6 col-md-6">
                  <div class="wsus__dash_pro_single">
                    <i class="fas fa-user-tie"></i>
                    <input type="text" name="name" class="@error('name') is-invalid @enderror" placeholder="Full Name" value="{{ $dataCustomer->nama_customer }}">
                    @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                  </div>
                </div>
                <div class="col-xl-6 col-md-6">
                  <div class="wsus__dash_pro_single">
                    <i class="fas fa-user-tie"></i>
                    <select class="select_2" name="jenis_kelamin">
                        <option value="Laki-laki" {{ $dataCustomer->jenis_kelamin == "Laki-laki" ? 'selected' : ''}}>Laki-laki</option>
                        <option value="Perempuan" {{ $dataCustomer->jenis_kelamin == "Perempuan" ? 'selected' : ''}}>Perempuan</option>
                    </select>
                  </div>
                </div>
                <div class="col-xl-6 col-md-6">
                  <div class="wsus__dash_pro_single">
                    <i class="far fa-phone-alt"></i>
                    <input type="text" class="@error('no_telp') is-invalid @enderror" name="no_telp" placeholder="No Telp" value="{{ $dataCustomer->no_telp }}">
                    @error('no_telp')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                  </div>
                </div>
                <div class="col-xl-6 col-md-6">
                  <div class="wsus__dash_pro_single">
                    <i class="fal fa-envelope-open"></i>
                    <input type="email" value="{{ $dataCustomer->email }}" placeholder="Email" disabled>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-md-6">
              <div class="wsus__dash_pro_img">
                <input type="hidden" name="oldFotoCustomer" value="{{ $dataCustomer->image }}">
                <img src="{{ asset('storage/' . $dataCustomer->image) }}" class="img-preview img-fluid w-100">
                <input type="file" class="@error('image') is-invalid @enderror" id="image" name="image" value="{{ old('image') }}" onchange="previewImage()">
                @error('image')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
              </div>
            </div>
            <div class="col-xl-12">
              <button class="common_btn mb-4 mt-2" type="submit">update</button>
            </div>
        </form>
        <form action="{{ route('profil-customer.updatePassword', Auth::user()->id) }}" method="post">
            @method('PUT')
            @csrf
            <div class="wsus__dash_pass_change mt-2">
              <div class="row">
                {{-- <div class="col-xl-4 col-md-6">
                  <div class="wsus__dash_pro_single">
                    <i class="fas fa-unlock-alt"></i>
                    <input id="current_password" type="password" class="@error('current_password') is-invalid @enderror" name="current_password" autocomplete="new-password" placeholder="Current Password">
                  </div>
                </div> --}}
                <div class="col-xl-4 col-md-6">
                  <div class="wsus__dash_pro_single">
                    <i class="fas fa-lock-alt"></i>
                    <input id="password" type="password" class="@error('password') is-invalid @enderror" name="password" autocomplete="new-password" placeholder="New Password">
                    @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                  </div>
                </div>
                <div class="col-xl-4">
                  <div class="wsus__dash_pro_single">
                    <i class="fas fa-lock-alt"></i>
                    <input id="password-confirm" type="password" name="password_confirmation" autocomplete="new-password" placeholder="Confirm Password">
                  </div>
                </div>
                <div class="col-xl-12">
                  <button class="common_btn" type="submit">update</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
</div>
@endsection

@section('dashboard-script')
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
