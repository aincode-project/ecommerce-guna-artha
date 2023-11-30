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
                <li class="breadcrumb-item active" aria-current="page">Data Penjualan</li>
                <li class="breadcrumb-item active" aria-current="page">Detail Penjualan</li>
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
        <div class="row">
            <div class="col-xl-6 col-md-6 ">
                    <h5>Detail Tranasksi</h5>
                    <h6>Nama: {{ $penjualan->customer->nama_customer }}</h6>
                    <p class="mb-2">Tanggal: {{ $penjualan->tanggal_penjualan }}</p>
            </div>
            <div class="col-xl-6 col-md-6">
                <div class="text-md-end">
                    <h5>Alamat Pengiriman</h5>
                    <h6>{{ $penjualan->nama_penerima }}</h6>
                    <p class="mb-2">{{ $penjualan->no_telp }}</p>
                    <p class="mb-2">{{ $penjualan->alamat }}</p>
                    <p>{{ $penjualan->keterangan_alamat }}</p>
                </div>
            </div>
        </div>
        <hr>
        <div class="table-responsive">
            <table id="detail-penjualan-table" class="table table-striped table-bordered" style="width:100%">
                <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th>Foto Barang</th>
                        <th>Barang</th>
                        <th>Harga</th>
                        <th>Jumlah</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($penjualan->detail_penjualan as $detailPenjualan)
                    <tr>
                        <td class="text-center"><img src="{{ asset('storage/'.$detailPenjualan->barang->foto_barang) }}" alt="bag" class="img-fluid" style="width: 100px"></td>
                        <td class="text-center">
                            <p>{{ $detailPenjualan->barang->nama_barang }}</p>
                            <p>Kategori: {{ $detailPenjualan->barang->kategori_barang->nama_kategori }}</p>
                        </td>
                        <td class="pt-5 text-end">@currency($detailPenjualan->harga_barang)</td>
                        <td class="pt-5 text-end">{{ $detailPenjualan->jumlah }}</td>
                        <td class="pt-5 text-end">@currency($detailPenjualan->jumlah * $detailPenjualan->harga_barang)</td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th colspan="4" class="text-center">
                            Total
                        </th>
                        <th class="text-end">@currency($penjualan->total_penjualan)</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
@endsection

@section('backend-script')
<script>
    $(document).ready(function() {
        $('#detail-penjualan-table').DataTable();
        } );
</script>
@endsection
