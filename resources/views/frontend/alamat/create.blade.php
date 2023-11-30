@extends('frontend-layout.dashboard-customer')

@section('dashboard-content')
<div class="dashboard_content mt-2 mt-md-0">
    <h3><i class="fal fa-gift-card"></i>Tambah Alamat</h3>
    <div class="wsus__dashboard_add wsus__add_address">
      <form action="{{ route('alamat-customer.store') }}" method="POST">
        @csrf
        <div class="row">
          <div class="col-xl-6 col-md-6">
            <div class="wsus__add_address_single">
              <label>nama penerima <b>*</b></label>
              <input type="text" class="@error('nama_penerima') is-invalid @enderror" value="{{ old('nama_penerima') }}" name="nama_penerima" placeholder="Nama Penerima" required>
                @error('nama_penerima')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
          </div>
          <div class="col-xl-6 col-md-6">
            <div class="wsus__add_address_single">
              <label>no telp <b>*</b></label>
              <input type="text" class="@error('no_telp') is-invalid @enderror" value="{{ old('no_telp') }}" name="no_telp" placeholder="No Telp" required>
                @error('no_telp')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
          </div>
          <div class="col-xl-6 col-md-6">
            <div class="wsus__add_address_single">
              <label>alamat <b>*</b></label>
              <input type="text" class="@error('alamat') is-invalid @enderror" value="{{ old('alamat') }}" name="alamat" placeholder="Alamat" required>
                @error('alamat')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
          </div>
          <div class="col-xl-6 col-md-6">
            <div class="wsus__add_address_single">
              <label>tipe alamat <b>*</b></label>
              <input type="text" class="@error('tipe_alamat') is-invalid @enderror" value="{{ old('tipe_alamat') }}" name="tipe_alamat" placeholder="Rumah / Kantor / Lainnya" required>
                @error('tipe_alamat')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
          </div>
          <div class="col-xl-6 col-md-6">
            <div class="wsus__add_address_single">
              <label>keterangan </label>
              <input type="text" name="keterangan" placeholder="Keterangan">
            </div>
          </div>
        <div class="row">
            <div class="col-xl-6">
              <button type="submit" class="common_btn">tambah</button>
            </div>
        </div>
        </div>
      </form>
    </div>
</div>
@endsection
