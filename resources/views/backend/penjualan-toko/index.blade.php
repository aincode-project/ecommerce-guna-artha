@extends('backend_layout.admin')

@section('backend')
<!--breadcrumb-->
<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
    <div class="breadcrumb-title pe-3">Transaksi Toko</div>
    <div class="ps-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 p-0">
                <li class="breadcrumb-item"><a href="{{ route('home') }}"><i class="bx bx-home-alt"></i></a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Penjualan Toko</li>
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
            <table id="penjualan-toko-table" class="table table-striped table-bordered" style="width:100%">
                <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th>Tanggal</th>
                        <th>Nama Pegawai</th>
                        <th>Total Penjualan</th>
                        <th>Detail</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($dataPenjualans as $dataPenjualan)
                    <tr>
                        <td>{{ Carbon\Carbon::parse($dataPenjualan->created_at)->format('d F Y') }}</td>
                        <td>{{ $dataPenjualan->pegawai->nama_pegawai }}</td>
                        <td class="text-end">@currency($dataPenjualan->total_penjualan)</td>
                        <td class="text-center">
                            <a href="{{ route('penjualan-toko.show', $dataPenjualan->id) }}" class="btn btn-outline-primary btn-sm">Lihat</a>
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
        $('#penjualan-toko-table').DataTable();
        } );
</script>
@endsection
