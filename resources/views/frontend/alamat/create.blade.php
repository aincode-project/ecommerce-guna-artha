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
              <input type="text" name="nama_penerima" placeholder="Nama Penerima" required>
            </div>
          </div>
          <div class="col-xl-6 col-md-6">
            <div class="wsus__add_address_single">
              <label>no telp <b>*</b></label>
              <input type="text" name="no_telp" placeholder="No Telp" required>
            </div>
          </div>
          <div class="col-xl-6 col-md-6">
            <div class="wsus__add_address_single">
              <label>alamat <b>*</b></label>
              <input type="text" name="alamat" placeholder="Alamat" required>
            </div>
          </div>
          <div class="col-xl-6 col-md-6">
            <div class="wsus__add_address_single">
              <label>tipe alamat <b>*</b></label>
              <input type="text" name="tipe_alamat" placeholder="Rumah / Kantor / Lainnya" required>
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
