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
        @if (auth()->check() && auth()->user()->hak_akses == "Admin")
        <button type="button" class="btn btn-sm btn-primary px-3 mb-2" data-bs-toggle="modal" data-bs-target="#stockOpnameModal"><i class='bx bx-plus mr-1'></i>Stock Opname Baru</button>
        @endif
        <div class="modal fade" id="stockOpnameModal" tabindex="-1" aria-labelledby="stockOpnameModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="{{ route('stock-opname.store') }}" method="post">
                        @csrf
                        <div class="modal-header">
                            <h5 class="modal-title" id="stockOpnameModalLabel">Stock Opname Baru</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col">
                                    <input class="form-control" type="date" id="tanggal_opname" name="tanggal_opname" value="{{ old('kode_barang') }}" required>

                                    @error('tanggal_opname')
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
        <div class="table-responsive">
            <table id="stock-opname-table" class="table table-striped table-bordered" style="width:100%">
                <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th>Tanggal</th>
                        <th>Nama</th>
                        <th>Jumlah Barang Selisih</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($dataStockOpnames as $dataStockOpname)
                    <tr>
                        <td>{{ Carbon\Carbon::parse($dataStockOpname->tanggal_opname)->format('d F Y') }}</td>
                        <td>{{ $dataStockOpname->pegawai->nama_pegawai }}</td>
                        <td class="text-end">{{ $dataStockOpname->barang_selisih }}</td>
                        <td>
                            @if (auth()->check() && auth()->user()->hak_akses == "Admin")
                            <a href="" data-bs-toggle="modal" data-bs-target="#editStockOpnameModal{{ $dataStockOpname->id }}" style="color: orange"><i class='bx bx-xs bx-edit-alt'></i></a>
                            <div class="modal fade" id="editStockOpnameModal{{ $dataStockOpname->id }}" tabindex="-1" aria-labelledby="editStockOpnameModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="{{ route('stock-opname.update', $dataStockOpname->id) }}" method="post">
                                            @method('PUT')
                                            @csrf
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editStockOpnameModalLabel">Ubah Stock Opname</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col">
                                                        <input class="form-control" type="date" id="tanggal_opname" name="tanggal_opname" value="{{ $dataStockOpname->tanggal_opname }}" required>

                                                        @error('tanggal_opname')
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
                            @endif
                            <a href="{{ route('stock-opname.show', $dataStockOpname->id) }}" style="color: skyblue"><i class='bx bx-xs bx-info-circle' ></i></a>
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
