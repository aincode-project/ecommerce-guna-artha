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
        <a href="{{ route('barang.create') }}" class="btn btn-sm btn-primary px-3 mb-2"><i class='bx bx-plus mr-1'></i>Tambah Barang</a>
        <div class="table-responsive">
            <table id="barang-table" class="table table-striped table-bordered" style="width:100%">
                <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th>Foto</th>
                        <th>Nama Barang</th>
                        <th>Kategori</th>
                        <th>Total Stok</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($dataBarangs as $dataBarang)
                    <tr>
                        <td class="text-center"><img src="{{ asset('storage/'.$dataBarang->foto_barang) }}" alt="bag" class="img-fluid" style="width: 100px"></td>
                        <td>{{ $dataBarang->nama_barang }}</td>
                        <td>{{ $dataBarang->kategori_barang->nama_kategori }}</td>
                        <td>
                            <div class="row text-end">
                                <div class="col-md-8">
                                    {{ $dataBarang->total_stok }}
                                </div>
                                <div class="col-md-2">
                                    <a href="{{ route('barang.addStock', $dataBarang->id) }}" style="color: rgb(47, 255, 151)"><i class='bx bx-xs bx-plus'></i></a>
                                    @if ($dataBarang->total_stok != 0)
                                    <a href="{{ route('barang.deleteStock', $dataBarang->id) }}" style="color: rgba(255, 72, 0, 0.993)"><i class='bx bx-xs bx-minus'></i></a>
                                    @endif
                                </div>
                            </div>
                        </td>
                        <td>
                            <a href="{{ route('barang.edit', $dataBarang->id) }}" style="color: orange"><i class='bx bx-xs bx-edit-alt'></i></a>
                            <a href="{{ route('barang.show', $dataBarang->id) }}" style="color: skyblue"><i class='bx bx-xs bx-info-circle' ></i></a>
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
        $('#barang-table').DataTable();
        } );
</script>
@endsection
