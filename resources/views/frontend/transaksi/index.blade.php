@extends('frontend-layout.dashboard-customer')

@section('dashboard-content')
<div class="dashboard_content">
    <h3><i class="fas fa-list-ul"></i> transaksi</h3>
    <div class="row">
        <div class="col-xl-12">
            <div class="wsus__pro_det_description" style="padding-top: 0">
                <div class="wsus__details_bg">
                    <ul class="nav nav-pills" id="pills-tab3" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pills-home-tab7" data-bs-toggle="pill"
                                data-bs-target="#pills-home22" type="button" role="tab"
                                aria-controls="pills-home" aria-selected="true">Dipesan</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-profile-tab7" data-bs-toggle="pill"
                                data-bs-target="#pills-profile22" type="button" role="tab"
                                aria-controls="pills-profile" aria-selected="false">Diproses</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                                data-bs-target="#pills-contact" type="button" role="tab"
                                aria-controls="pills-contact" aria-selected="false">Dikirim</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-contact-tab2" data-bs-toggle="pill"
                                data-bs-target="#pills-contact2" type="button" role="tab"
                                aria-controls="pills-contact2" aria-selected="false">Dikonfirmasi</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-contact-tab23" data-bs-toggle="pill"
                                data-bs-target="#pills-contact23" type="button" role="tab"
                                aria-controls="pills-contact23" aria-selected="false">Cancel</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent4">
                        <div class="tab-pane fade  show active " id="pills-home22" role="tabpanel"
                            aria-labelledby="pills-home-tab7">
                            <div class="table-responsive">
                                <table id="transaksi-customer-table-dipesan" class="table table-striped table-bordered" style="width:100%">
                                  <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                                    <tr>
                                      <th>Tanggal Transaksi</th>
                                      <th>Total Transaksi</th>
                                      <th>Status Transaksi</th>
                                      <th>Detail</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach ($dataPesanans as $dataPesanan)
                                        @if ($dataPesanan->status_pesanan == "Dipesan")
                                        <tr>
                                            <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                            <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                            <td>{{ $dataPesanan->status_pesanan }}</td>
                                            <td class="text-center"><a class="btn btn-outline-primary btn-sm" href="{{ route('transaksi.show', $dataPesanan) }}">view</a></td>
                                        </tr>
                                        @endif
                                    @endforeach
                                  </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-profile22" role="tabpanel"
                            aria-labelledby="pills-profile-tab7">
                            <div class="table-responsive">
                                <table id="transaksi-customer-table-diproses" class="table table-striped table-bordered" style="width:100%">
                                  <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                                    <tr>
                                      <th>Tanggal Transaksi</th>
                                      <th>Total Transaksi</th>
                                      <th>Status Transaksi</th>
                                      <th>Detail</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach ($dataPesanans as $dataPesanan)
                                        @if ($dataPesanan->status_pesanan == "Diproses")
                                        <tr>
                                            <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                            <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                            <td>{{ $dataPesanan->status_pesanan }}</td>
                                            <td class="text-center"><a class="btn btn-outline-primary btn-sm" href="{{ route('transaksi.show', $dataPesanan) }}">view</a></td>
                                        </tr>
                                        @endif
                                    @endforeach
                                  </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-contact" role="tabpanel"
                            aria-labelledby="pills-contact-tab">
                            <div class="wsus__pro_det_vendor">
                                <div class="table-responsive">
                                    <table id="transaksi-customer-table-dikirim" class="table table-striped table-bordered" style="width:100%">
                                      <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                                        <tr>
                                          <th>Tanggal Transaksi</th>
                                          <th>Total Transaksi</th>
                                          <th>Status Transaksi</th>
                                          <th>Detail</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        @foreach ($dataPesanans as $dataPesanan)
                                            @if ($dataPesanan->status_pesanan == "Dikirim")
                                            <tr>
                                                <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                                <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                                <td>{{ $dataPesanan->status_pesanan }}</td>
                                                <td class="text-center"><a class="btn btn-outline-primary btn-sm" href="{{ route('transaksi.show', $dataPesanan) }}">view</a></td>
                                            </tr>
                                            @endif
                                        @endforeach
                                      </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-contact2" role="tabpanel"
                            aria-labelledby="pills-contact-tab2">
                            <div class="wsus__pro_det_review">
                                <div class="wsus__pro_det_review_single">
                                    <div class="table-responsive">
                                        <table id="transaksi-customer-table-dikonfirmasi" class="table table-striped table-bordered" style="width:100%">
                                          <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                                            <tr>
                                              <th>Tanggal Transaksi</th>
                                              <th>Total Transaksi</th>
                                              <th>Status Transaksi</th>
                                              <th>Detail</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            @foreach ($dataPesanans as $dataPesanan)
                                                @if ($dataPesanan->status_pesanan == "Dikonfirmasi")
                                                <tr>
                                                    <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                                    <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                                    <td>{{ $dataPesanan->status_pesanan }}</td>
                                                    <td class="text-center"><a class="btn btn-outline-primary btn-sm" href="{{ route('transaksi.show', $dataPesanan) }}">view</a></td>
                                                </tr>
                                                @endif
                                            @endforeach
                                          </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-contact23" role="tabpanel"
                            aria-labelledby="pills-contact-tab23">
                            <div class="wsus__pro_det_comment">
                                <div class="table-responsive">
                                    <table id="transaksi-customer-table-cancel" class="table table-striped table-bordered" style="width:100%">
                                      <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                                        <tr>
                                          <th>Tanggal Transaksi</th>
                                          <th>Total Transaksi</th>
                                          <th>Status Transaksi</th>
                                          <th>Detail</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        @foreach ($dataPesanans as $dataPesanan)
                                            @if ($dataPesanan->status_pesanan == "Cancel")
                                            <tr>
                                                <td>{{ Carbon\Carbon::parse($dataPesanan->created_at)->format('d F Y H:i:s') }}</td>
                                                <td class="text-end">@currency($dataPesanan->total_pesanan)</td>
                                                <td>{{ $dataPesanan->status_pesanan }}</td>
                                                <td class="text-center"><a class="btn btn-outline-primary btn-sm" href="{{ route('transaksi.show', $dataPesanan) }}">view</a></td>
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
            </div>
        </div>

    </div>
    <div class="card">
        <div class="card-body">

        </div>
    </div>
  </div>
@endsection

@section('dashboard-script')
<script>
    $(document).ready(function() {
        $('#transaksi-customer-table-dipesan').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });

        $('#transaksi-customer-table-diproses').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });

        $('#transaksi-customer-table-dikirim').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });

        $('#transaksi-customer-table-dikonfirmasi').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });

        $('#transaksi-customer-table-cancel').DataTable({
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
