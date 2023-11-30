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
                <li class="breadcrumb-item active" aria-current="page">Ubah Barang</li>
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
    <div class="card-body">
        <div class="form-body">
            <form class="row g-3" action="{{ route('barang.update', $barang->id) }}" method="POST" enctype="multipart/form-data">
                @method('PUT')
                @csrf
                <div class="col-6">
                    <label for="kode_barang" class="form-label">Kode Barang</label>
                    <input type="text" class="form-control @error('kode_barang') is-invalid @enderror" id="kode_barang" placeholder="Kode Barang" name="kode_barang" value="{{ $barang->kode_barang }}" required autocomplete="kode_barang" autofocus>

                    @error('kode_barang')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="col-6">
                    <label for="nama_barang" class="form-label">Nama Barang</label>
                    <input type="text" class="form-control @error('nama_barang') is-invalid @enderror" id="nama_barang" placeholder="Nama Barang" name="nama_barang" value="{{ $barang->nama_barang }}" required autocomplete="nama_barang" autofocus>

                    @error('nama_barang')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="col-6">
                    <label for="kategori_barang_id" class="form-label">Kategori Barang</label>
                    <select class="form-select" id="kategori_barang_id" name="kategori_barang_id" aria-label="Default select example">
                        @foreach ($dataKategoriBarangs as $dataKategoriBarang)
                            <option value="{{ $dataKategoriBarang->id }}" {{ $dataKategoriBarang->id == $barang->kategori_barang_id ? 'selected' : '' }}>{{ $dataKategoriBarang->nama_kategori }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-6">
                    <label for="harga_jual" class="form-label">Harga Jual</label>
                    <input type="text" class="form-control @error('harga_jual') is-invalid @enderror" id="harga_jual" placeholder="Harga Jual" name="harga_jual" value="{{ $barang->harga_jual }}" required autocomplete="harga_jual" autofocus>

                    @error('harga_jual')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="col-6">
                    <label for="keterangan" class="form-label">Keterangan</label>
                    <input type="text" class="form-control @error('keterangan') is-invalid @enderror" id="keterangan" placeholder="Keterangan" name="keterangan" value="{{ $barang->keterangan }}" required autocomplete="keterangan" autofocus>

                    @error('keterangan')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="col-12">
                    <label for="foto_barang" class="form-label">Foto Barang</label>
                    <input type="hidden" name="oldFotoBarang" value="{{ $barang->foto_barang }}">
                    @if ($barang->foto_barang)
                        <img src="{{ asset('storage/' . $barang->foto_barang) }}" class="img-preview img-fluid mb-3 col-sm-3 d-block">
                    @else
                        <img class="img-preview img-fluid mb-3 col-sm-5">
                    @endif
                    <input type="file" class="form-control @error('foto_barang') is-invalid @enderror" id="foto_barang" name="foto_barang" value="{{ old('foto_barang') }}" autocomplete="foto_barang" autofocus onchange="previewImage()">

                    @error('foto_barang')
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
@endsection

@section('backend-script')
    <script>
        function previewImage() {
            const image = document.querySelector('#foto_barang');
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
