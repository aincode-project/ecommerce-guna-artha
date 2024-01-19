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
                <li class="breadcrumb-item active" aria-current="page">Data Pesanan</li>
                <li class="breadcrumb-item active" aria-current="page">Detail Pesanan</li>
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
                    <h6>Nama: {{ $pesanan->customer->nama_customer }}</h6>
                    <p class="mb-2">Tanggal: {{ Carbon\Carbon::parse($pesanan->tanggal_pesanan)->format('d F Y') }}</p>
                    <p>Status: {{ $pesanan->status_pesanan }}</p>
                    @if (auth()->check() && auth()->user()->hak_akses == "Admin")
                        @if ($pesanan->status_pesanan == "Dipesan")
                            <form action="{{ route('pesanan.proses', $pesanan->id) }}" method="POST">
                                @method('PUT')
                                @csrf
                                <button class="btn btn-sm btn-outline-warning"><i class='bx bx-xs bx-paper-plane'></i> Proses Pesanan</button>
                            </form>
                        @elseif ($pesanan->status_pesanan == "Diproses")
                            <form action="{{ route('pesanan.kirim', $pesanan->id) }}" method="POST">
                                @method('PUT')
                                @csrf
                                <button class="btn btn-sm btn-outline-warning"><i class='bx bx-xs bx-paper-plane'></i> Kirim</button>
                            </form>
                        @elseif (($pesanan->status_pesanan == "Dikirim" || $pesanan->status_pesanan == "Dikonfirmasi") && $pesanan->konfirmasi_admin == "Belum Dikonfirmasi")
                            <form action="{{ route('pesanan.konfirmasi', $pesanan->id) }}" method="POST">
                                @method('PUT')
                                @csrf
                                <button class="btn btn-sm btn-outline-success"><i class='bx bx-xs bx-check-circle'></i> Konfirmasi</button>
                            </form>
                        @endif
                    @endif
            </div>
            <div class="col-xl-6 col-md-6">
                <div class="text-md-end">
                    <h5>Alamat Pengiriman</h5>
                    <h6>{{ $pesanan->nama_penerima }}</h6>
                    <p class="mb-2">{{ $pesanan->no_telp }}</p>
                    <p class="mb-2">{{ $pesanan->alamat }}</p>
                    <p>{{ $pesanan->keterangan_alamat }}</p>
                </div>
            </div>
        </div>
        <hr>
        <div class="table-responsive">
            <table id="detail-pesanan-table" class="table table-striped table-bordered" style="width:100%">
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
                    @foreach ($pesanan->detail_pesanan as $detailPesanan)
                    <tr>
                        <td class="text-center"><img src="{{ asset('storage/'.$detailPesanan->barang->foto_barang) }}" alt="bag" class="img-fluid" style="width: 100px"></td>
                        <td class="text-center">
                            <p>{{ $detailPesanan->barang->nama_barang }}</p>
                            <p>Kategori: {{ $detailPesanan->barang->kategori_barang->nama_kategori }}</p>
                        </td>
                        <td class="pt-5 text-end">@currency($detailPesanan->harga_barang)</td>
                        <td class="pt-5 text-end">{{ $detailPesanan->jumlah }}</td>
                        <td class="pt-5 text-end">@currency($detailPesanan->jumlah * $detailPesanan->harga_barang)</td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th colspan="4" class="text-center">
                            Total
                        </th>
                        <th class="text-end">@currency($pesanan->total_pesanan)</th>
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
        $('#detail-pesanan-table').DataTable();
        } );
</script>
@endsection
