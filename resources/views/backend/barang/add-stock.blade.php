@extends('backend_layout.admin')

@section('backend')
<!--breadcrumb-->
<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
    <div class="breadcrumb-title pe-3">Master Data</div>
    <div class="ps-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 p-0">
                <li class="breadcrumb-item"><a href="{{ route('home') }}"><i class="bx bx-home-alt"></i></a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Data Barang</li>
                <li class="breadcrumb-item active" aria-current="page">Detail Barang</li>
            </ol>
        </nav>
    </div>
    {{-- <div class="ms-auto">
        <div class="btn-group">
            <button type="button" class="btn btn-primary">Settings</button>
            <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
            </button>
            <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end">	<a class="dropdown-item" href="javascript:;">Action</a>
                <a class="dropdown-item" href="javascript:;">Another action</a>
                <a class="dropdown-item" href="javascript:;">Something else here</a>
                <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Separated link</a>
            </div>
        </div>
    </div> --}}
</div>
<!--end breadcrumb-->
{{-- <h6 class="mb-0 text-uppercase">Data Customer</h6> --}}
<hr/>
<div class="card">
    <div class="row g-0">
      <div class="col-md-4 border-end">
        <img src="{{ asset('storage/' . $barang->foto_barang) }}" class="img-fluid pb-3 pt-3" alt="...">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h4 class="card-title">{{ $barang->nama_barang }}</h4>
          <div class="d-flex gap-3 py-3">
            <div>{{ $barang->total_stok }} stok</div>
              <div class="text-success"><i class='bx bxs-cart-alt align-middle'></i>{{ $barang->jumlah_terjual }} terjual</div>
          </div>
          <div class="mb-3">
            <span class="price h4">@currency($barang->harga_jual)</span>
            <span class="text-muted">/item</span>
          </div>
          <p class="card-text fs-6">{{ $barang->keterangan }}</p>
          <dl class="row">
            <dt class="col-sm-3">Kode Barang</dt>
            <dd class="col-sm-9">{{ $barang->kode_barang }}</dd>

            <dt class="col-sm-3">Kategori</dt>
            <dd class="col-sm-9">{{ $barang->kategori_barang->nama_kategori }}</dd>
          </dl>
          <hr/>
          <div class="form-body">
            <form class="row g-3" action="{{ route('barang.addStockStore', $barang->id) }}" method="POST">
                @method('PUT')
                @csrf
                <div class="col-12">
                    <label for="jumlah_stok" class="form-label">Tambah Stok Barang</label>
                    <input type="hidden" name="stokLama" value="{{ $barang->total_stok }}">
                    <input type="text" class="form-control @error('jumlah_stok') is-invalid @enderror" id="jumlah_stok" placeholder="Jumlah Stok" name="jumlah_stok" value="{{ old('jumlah_stok') }}" required autocomplete="jumlah_stok" autofocus>

                    @error('jumlah_stok')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="col-12">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
      </div>
    </div>
    <hr/>
    <div class="card-body">
        <h5 class="mb-3">Tabel Pencatatan Stok</h5>
        <div class="table-responsive">
            <table id="stok-barang-table" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Jumlah</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($stokBarangs as $stokBarang)
                    <tr>
                        <td>{{ $stokBarang->tanggal_catat }}</td>
                        <td>{{ $stokBarang->jumlah_stok }}</td>
                        @if ($stokBarang->keterangan == "Tambah Stok")
                        <td style="color: rgb(8, 151, 0)">{{ $stokBarang->keterangan }}</td>
                        @else
                        <td style="color: rgb(187, 9, 6)">{{ $stokBarang->keterangan }}</td>
                        @endif
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

@section('backend-script')
<script>
    $(document).ready(function() {
        $('#stok-barang-table').DataTable();
        } );
</script>
@endsection
