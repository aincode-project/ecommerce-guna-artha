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
                <li class="breadcrumb-item active" aria-current="page">Data Customer</li>
                <li class="breadcrumb-item active" aria-current="page">Detail Customer</li>
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
<div class="container">
    <div class="main-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="{{ asset('storage/' . $customer->image) }}" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                            <div class="mt-3">
                                <h4>{{ $customer->nama_pegawai }}</h4>
                                <p class="text-secondary mb-1">{{ $customer->user->hak_akses }}</p>
                                <p class="text-muted font-size-sm">{{ $customer->email }}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 mb-2 text-secondary">
                                <h6 class="mb-2">Nama</h6>
                                <input type="text" class="form-control" disabled value="{{ $customer->nama_customer }}" />
                            </div>
                            <div class="col-sm-6 mb-2 text-secondary">
                                <h6 class="mb-2">Jenis Kelamin</h6>
                                <input type="text" class="form-control" disabled value="{{ $customer->jenis_kelamin }}" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 mb-2 text-secondary">
                                <h6 class="mb-2">No Telp</h6>
                                <input type="text" class="form-control" disabled value="{{ $customer->no_telp }}" />
                            </div>
                        </div>
                        <hr>
                        <div class="table-responsive">
                            <table id="pesanan-table" class="table table-striped table-bordered" style="width:100%">
                                <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                                    <tr>
                                        <th>Tanggal</th>
                                        <th>Alamat</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($dataPesanans as $dataPesanan)
                                    <tr>
                                        <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                        <td>{{ $dataPesanan->alamat }}</td>
                                        <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('backend-script')
<script>
    $(document).ready(function() {
        $('#pesanan-table').DataTable();
        } );
</script>
@endsection
