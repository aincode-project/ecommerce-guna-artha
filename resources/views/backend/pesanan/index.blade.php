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
        <ul class="nav nav-tabs nav-primary mb-0" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" data-bs-toggle="tab" href="#dipesan" role="tab" aria-selected="true">
                    <div class="d-flex align-items-center">
                        {{-- <div class="tab-icon"><i class='bx bx-comment-detail font-18 me-1'></i>
                        </div> --}}
                        <div class="tab-icon"><i class='bx bx-bookmark-alt font-18 me-1'></i>
                        </div>
                        <div class="tab-title"> Dipesan ({{ $totalDipesan }})</div>
                    </div>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#diproses" role="tab" aria-selected="false">
                    <div class="d-flex align-items-center">
                        <div class="tab-icon"><i class='bx bx-bookmark-alt font-18 me-1'></i>
                        </div>
                        <div class="tab-title">Diproses ({{ $totalDiproses }})</div>
                    </div>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#dikirim" role="tab" aria-selected="false">
                    <div class="d-flex align-items-center">
                        {{-- <div class="tab-icon"><i class='bx bx-star font-18 me-1'></i>
                        </div> --}}
                        <div class="tab-icon"><i class='bx bx-bookmark-alt font-18 me-1'></i>
                        </div>
                        <div class="tab-title">Dikirim ({{ $totalDikirim }})</div>
                    </div>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#dikonfirmasi" role="tab" aria-selected="false">
                    <div class="d-flex align-items-center">
                        {{-- <div class="tab-icon"><i class='bx bx-star font-18 me-1'></i>
                        </div> --}}
                        <div class="tab-icon"><i class='bx bx-bookmark-alt font-18 me-1'></i>
                        </div>
                        <div class="tab-title">Dikonfirmasi ({{ $totalDikonfirmasi }})</div>
                    </div>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#cancel" role="tab" aria-selected="false">
                    <div class="d-flex align-items-center">
                        {{-- <div class="tab-icon"><i class='bx bx-star font-18 me-1'></i>
                        </div> --}}
                        <div class="tab-icon"><i class='bx bx-bookmark-alt font-18 me-1'></i>
                        </div>
                        <div class="tab-title">Cancel ({{ $totalCancel }})</div>
                    </div>
                </a>
            </li>
        </ul>
        <div class="tab-content pt-3">
            <div class="tab-pane fade show active" id="dipesan" role="tabpanel">
                <div class="table-responsive">
                    <table id="pesanan-table-dipesan" class="table table-striped table-bordered" style="width:100%">
                        <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                            <tr>
                                <th>Tanggal</th>
                                <th>Nama Customer</th>
                                <th>Alamat</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($dataPesanans as $dataPesanan)
                                @if ($dataPesanan->status_pesanan == "Dipesan")
                                <tr>
                                    <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                    <td>{{ $dataPesanan->customer->nama_customer }}</td>
                                    <td>{{ $dataPesanan->alamat }}</td>
                                    <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                    <td>{{ $dataPesanan->status_pesanan }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('pesanan.show', $dataPesanan->id) }}" class="btn btn-outline-primary btn-sm">Lihat</a>
                                    </td>
                                </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="diproses" role="tabpanel">
                <div class="table-responsive">
                    <table id="pesanan-table-diproses" class="table table-striped table-bordered" style="width:100%">
                        <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                            <tr>
                                <th>Tanggal</th>
                                <th>Nama Customer</th>
                                <th>Alamat</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($dataPesanans as $dataPesanan)
                                @if ($dataPesanan->status_pesanan == "Diproses")
                                <tr>
                                    <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                    <td>{{ $dataPesanan->customer->nama_customer }}</td>
                                    <td>{{ $dataPesanan->alamat }}</td>
                                    <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                    <td>{{ $dataPesanan->status_pesanan }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('pesanan.show', $dataPesanan->id) }}" class="btn btn-outline-primary btn-sm">Lihat</a>
                                    </td>
                                </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="dikirim" role="tabpanel">
                <div class="table-responsive">
                    <table id="pesanan-table-dikirim" class="table table-striped table-bordered" style="width:100%">
                        <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                            <tr>
                                <th>Tanggal</th>
                                <th>Nama Customer</th>
                                <th>Alamat</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($dataPesanans as $dataPesanan)
                                @if ($dataPesanan->status_pesanan == "Dikirim")
                                <tr>
                                    <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                    <td>{{ $dataPesanan->customer->nama_customer }}</td>
                                    <td>{{ $dataPesanan->alamat }}</td>
                                    <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                    <td>{{ $dataPesanan->status_pesanan }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('pesanan.show', $dataPesanan->id) }}" class="btn btn-outline-primary btn-sm">Lihat</a>
                                    </td>
                                </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="dikonfirmasi" role="tabpanel">
                <div class="table-responsive">
                    <table id="pesanan-table-dikonfirmasi" class="table table-striped table-bordered" style="width:100%">
                        <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                            <tr>
                                <th>Tanggal</th>
                                <th>Nama Customer</th>
                                <th>Alamat</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($dataPesanans as $dataPesanan)
                                @if ($dataPesanan->status_pesanan == "Dikonfirmasi")
                                <tr>
                                    <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                    <td>{{ $dataPesanan->customer->nama_customer }}</td>
                                    <td>{{ $dataPesanan->alamat }}</td>
                                    <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                    <td>{{ $dataPesanan->status_pesanan }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('pesanan.show', $dataPesanan->id) }}" class="btn btn-outline-primary btn-sm">Lihat</a>
                                    </td>
                                </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="cancel" role="tabpanel">
                <div class="table-responsive">
                    <table id="pesanan-table-cancel" class="table table-striped table-bordered" style="width:100%">
                        <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                            <tr>
                                <th>Tanggal</th>
                                <th>Nama Customer</th>
                                <th>Alamat</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($dataPesanans as $dataPesanan)
                                @if ($dataPesanan->status_pesanan == "Cancel")
                                <tr>
                                    <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                    <td>{{ $dataPesanan->customer->nama_customer }}</td>
                                    <td>{{ $dataPesanan->alamat }}</td>
                                    <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                    <td>{{ $dataPesanan->status_pesanan }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('pesanan.show', $dataPesanan->id) }}" class="btn btn-outline-primary btn-sm">Lihat</a>
                                    </td>
                                </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>
@endsection

@section('backend-script')
<script>
    $(document).ready(function() {
        $('#pesanan-table-dipesan').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });

        $('#pesanan-table-diproses').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });

        $('#pesanan-table-dikirim').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });

        $('#pesanan-table-dikonfirmasi').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });

        $('#pesanan-table-cancel').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    } );
</script>
@endsection
