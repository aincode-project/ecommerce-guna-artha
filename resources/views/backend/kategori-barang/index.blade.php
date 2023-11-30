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
                <li class="breadcrumb-item active" aria-current="page">Data Kategori Barang</li>
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
        @if ($id == 0)
        <form action="{{ route('kategori-barang.store') }}" method="post">
        @else
        <form action="{{ route('kategori-barang.update', $id) }}" method="post">
            <input type="hidden" name="_method" value="put" />
        @endif
            @csrf
            <div class="row">
                <div class="col-md-4">
                    <input class="form-control mb-3" type="text" id="nama_kategori" name="nama_kategori" placeholder="Masukan Nama Kategori" @if ($id != 0)
                        value="{{ $editKategoriBarang->nama_kategori }}"
                    @endif required>

                    @error('nama_kategori')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
                <div class="col-md">
                    <button type="submit" class="btn btn-primary px-3 mb-2"><i class='bx bx-plus mr-1'></i>@if ($id == 0)
                        Tambah Kategori
                    @else
                        Ubah Kategori
                    @endif</button>
                </div>
            </div>
        </form>
        <div class="table-responsive">
            <table id="kategori-barang-table" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>Nama Kategori</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($kategoriBarangs as $kategoriBarang)
                    <tr>
                        <td>{{ $kategoriBarang->nama_kategori }}</td>
                        <td>
                            <a href="{{ route('kategori-barang.index', $kategoriBarang->id) }}" style="color: orange"><i class='bx bx-xs bx-edit-alt'></i></a>
                        </td>
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
        $('#kategori-barang-table').DataTable();
        } );
</script>
@endsection
