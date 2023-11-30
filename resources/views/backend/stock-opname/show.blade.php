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
                <li class="breadcrumb-item active" aria-current="page">Stock Opname</li>
                <li class="breadcrumb-item active" aria-current="page">Detail Stock Opname tanggal {{ $stockOpname->tanggal_opname }}</li>
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
{{-- <h6 class="mb-0 text-uppercase">Data User</h6> --}}
<hr/>
<div class="card">
    <div class="card-body">
        <div class="table-responsive">
            <table id="stock-opname-table" class="table table-striped table-bordered" style="width:100%">
                <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th>Foto</th>
                        <th>Nama Barang</th>
                        <th>Stok Sistem</th>
                        <th>Stok Fisik</th>
                        <th>Selisih</th>
                        {{-- <th>Keterangan</th> --}}
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($stockOpname->detail_stock_opname as $detailStockOpname)
                    <tr>
                        <td class="text-center"><img src="{{ asset('storage/'.$detailStockOpname->barang->foto_barang) }}" alt="bag" class="img-fluid" style="width: 100px"></td>
                        <td>{{ $detailStockOpname->barang->nama_barang }}</td>
                        <td class="text-end">{{ $detailStockOpname->barang->total_stok }}</td>
                        <td class="text-end">{{ $detailStockOpname->stok_fisik }}</td>
                        <td class="text-end">{{ $detailStockOpname->selisih }}</td>
                        {{-- <td>{{ $detailStockOpname->keterangan }}</td> --}}
                        <td>
                            <a href="" data-bs-toggle="modal" data-bs-target="#barangOpnameModal{{ $detailStockOpname->id }}" style="color: orange"><i class='bx bx-sm bx-list-plus'></i></a>
                            <div class="modal fade" id="barangOpnameModal{{ $detailStockOpname->id }}" tabindex="-1" aria-labelledby="barangOpnameModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="{{ route('stock-opname.updateStock', $detailStockOpname->id) }}" method="post">
                                            @method('PUT')
                                            @csrf
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="barangOpnameModalLabel">Ubah Stock Opname</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="hidden" name="stok_sistem" value="{{ $detailStockOpname->barang->total_stok }}">
                                                        <input class="form-control" type="text" id="nama_barang" name="nama_barang" value="{{ $detailStockOpname->barang->nama_barang }}" disabled>

                                                        @error('nama_barang')
                                                            <span class="invalid-feedback" role="alert">
                                                                <strong>{{ $message }}</strong>
                                                            </span>
                                                        @enderror
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input class="form-control" type="text" id="stok_fisik" name="stok_fisik" value="{{ old('stok_fisik') }}" placeholder="Masukan Jumlah Stok Fisik" required>

                                                        @error('stok_fisik')
                                                            <span class="invalid-feedback" role="alert">
                                                                <strong>{{ $message }}</strong>
                                                            </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                <button type="submit" class="btn btn-primary">Simpan</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
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
        $('#stock-opname-table').DataTable();
        } );
</script>
@endsection
