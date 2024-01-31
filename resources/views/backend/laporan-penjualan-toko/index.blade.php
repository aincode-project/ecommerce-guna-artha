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
                <li class="breadcrumb-item active" aria-current="page">Laporan Penjualan Toko</li>
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
        <form action="{{ route('laporanPenjualanToko.index', 1) }}" method="post">
            @csrf
            <div class="row mb-3">
                <div class="col-md-9 d-flex">
                    <input id="tanggal_awal_data" min="{{ $minDate }}" max="{{ $maxDate }}" type="date" class="form-control" name="tanggal_awal_data" value="{{ old('tanggal_awal_data') }}" required>
                    <h2 style="margin: 0 10px;"> - </h2>
                    <input id="tanggal_akhir_data" min="{{ $minDate }}" max="{{ $maxDate }}" type="date" class="form-control" name="tanggal_akhir_data" value="{{ old('tanggal_akhir_data') }}" required>
                    <button type="submit" class="btn btn-outline-primary" style="margin-left: 10px;">Filter</button>
                </div>
            </form>
                <div class="text-end col-md-3">
                    <form action="{{ route('laporanPenjualanToko.print') }}">
                        <input type="hidden" name="tanggalAwal" value="{{ $tanggalAwalDipilih }}">
                        <input type="hidden" name="tanggalAkhir" value="{{ $tanggalAkhirDipilih }}">
                        @if ($dataPenjualans->count() != 0)
                        <button type="submit" class="btn btn-outline-success">Cetak Laporan</button>

                        @endif
                    </form>
                </div>
            </div>

        <div class="table-responsive">
            <table id="laporan-penjualan-table" class="table table-striped table-bordered" style="width:100%">
                <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Total Penjualan</th>
                        <th>Detail</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($dataPenjualans as $dataPenjualan)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ Carbon\Carbon::parse($dataPenjualan->tanggal)->format('d F Y') }}</td>
                        <td class="text-end">@currency($dataPenjualan->total_penjualan)</td>
                        <td class="text-center">
                            <form action="{{ route('laporanPenjualan.detail', 0) }}" method="post">
                                @csrf
                                <input type="hidden" name="tanggal" value="{{ $dataPenjualan->tanggal }}">

                                <button type="submit" class="btn btn-outline-primary btn-sm">Lihat</button>
                            </form>
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
        $('#laporan-penjualan-table').DataTable( {
            // lengthChange: false,
            // paging: false
        });
    } );

    // Ambil elemen input untuk start date dan end date
    var startDateInput = document.getElementById('tanggal_awal_data');
    var endDateInput = document.getElementById('tanggal_akhir_data');

    // Tambahkan event listener untuk perubahan nilai pada start date
    startDateInput.addEventListener('change', function () {
        // Set nilai minimum pada end date sesuai dengan start date
        endDateInput.min = startDateInput.value;
    });
</script>
@endsection
