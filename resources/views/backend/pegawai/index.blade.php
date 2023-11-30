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
                <li class="breadcrumb-item active" aria-current="page">Data Pegawai</li>
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
        <a href="{{ route('pegawai.create') }}" class="btn btn-sm btn-primary px-3 mb-2"><i class='bx bx-plus mr-1'></i>Tambah Pegawai</a>
        <div class="table-responsive">
            <table id="pegawai-table" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>NIK</th>
                        <th>Nama</th>
                        <th>Email</th>
                        <th>No Telp</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($dataPegawais as $dataPegawai)
                    <tr>
                        <td>{{ $dataPegawai->NIK }}</td>
                        <td>{{ $dataPegawai->nama_pegawai }}</td>
                        <td>{{ $dataPegawai->email }}</td>
                        <td>{{ $dataPegawai->no_telp }}</td>
                        <td>
                            @if ($dataPegawai->hak_akses != "Customer")
                            <a href="{{ route('pegawai.edit', $dataPegawai->id) }}" style="color: orange"><i class='bx bx-xs bx-edit-alt'></i></a>
                            <a href="{{ route('pegawai.show', $dataPegawai->id) }}" style="color: skyblue"><i class='bx bx-xs bx-info-circle' ></i></a>
                            @endif
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
        $('#pegawai-table').DataTable();
        } );
</script>
@endsection
