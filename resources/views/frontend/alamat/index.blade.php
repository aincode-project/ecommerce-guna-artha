@extends('frontend-layout.dashboard-customer')

@section('dashboard-content')
<div class="dashboard_content">
    <h3><i class="fal fa-gift-card"></i> alamat</h3>
    <div class="wsus__dashboard_add">
      <div class="row">
        @foreach ($dataAlamats as $dataAlamat)
        <div class="col-xl-6">
            <div class="wsus__dash_add_single">
              <h4>
                Alamat Penerima <span>{{ $dataAlamat->tipe_alamat }}</span>
              </h4>
              <ul>
                <li><span>Nama :</span> {{ $dataAlamat->nama_penerima }}</li>
                <li><span>No Telp :</span> {{ $dataAlamat->no_telp }}</li>
                <li><span>Alamat :</span> {{ $dataAlamat->alamat }}</li>
                <li><span>Keterangan :</span> @if ($dataAlamat->keterangan == null)
                    -
                @else
                    {{ $dataAlamat->keterangan }}
                @endif </li>
              </ul>
              <div class="wsus__address_btn">
                <a href="{{ route('alamat-customer.edit', $dataAlamat->id) }}" class="edit"><i class="fal fa-edit"></i> edit</a>
                <form action="{{ route('alamat-customer.destroy', $dataAlamat->id) }}" method="POST">
                    @method('delete')
                    @csrf
                    <button class="btn btn-xs btn-danger"><i class="fal fa-trash-alt"></i></button>
                </form>
              </div>
            </div>
        </div>
        @endforeach
        <div class="col-12">
          <a href="{{ route('alamat-customer.create') }}" class="add_address_btn common_btn"><i class="far fa-plus"></i>
            Tambah Alamat Baru</a>
        </div>
      </div>
    </div>
</div>
@endsection
