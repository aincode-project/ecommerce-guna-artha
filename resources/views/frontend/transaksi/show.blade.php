@extends('frontend-layout.dashboard-customer')

@section('dashboard-content')
<div class="dashboard_content">
    <h3><i class="fas fa-list-ul"></i> detail transaksi</h3>
    <div class="wsus__invoice_area">
        <div class="wsus__invoice_header">
            <div class="wsus__invoice_content">
                <div class="row">
                    <div class="col-xl-6 col-md-6 mb-5 mb-md-0">
                        <div class="wsus__invoice_single">
                            <h5>Detail Tranasksi</h5>
                            <h6>Nama: {{ $pesanan->customer->nama_customer }}</h6>
                            <p>Tanggal: {{ Carbon\Carbon::parse($pesanan->tanggal_pesanan)->format('d F Y') }}</p>
                            <p>Status: {{ $pesanan->status_pesanan }}</p>
                        </div>
                    </div>
                    <div class="col-xl-6 col-md-6">
                        <div class="wsus__invoice_single text-md-end">
                            <h5>Alamat Pengiriman</h5>
                            <h6>{{ $pesanan->nama_penerima }}</h6>
                            <p>{{ $pesanan->no_telp }}</p>
                            <p>{{ $pesanan->alamat }}</p>
                            <p>{{ $pesanan->keterangan_alamat }}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wsus__invoice_description">
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th class="images">
                                foto barang
                            </th>

                            <th class="name">
                                barang
                            </th>

                            <th class="amount">
                                harga
                            </th>

                            <th class="quentity">
                                jumlah
                            </th>
                            <th class="total">
                                subtotal
                            </th>
                        </tr>
                        @foreach ($pesanan->detail_pesanan as $detail_pesanan)
                        <tr>
                            <td class="images">
                                <img src="{{ asset('storage/'.$detail_pesanan->barang->foto_barang) }}" alt="bag" class="img-fluid w-100">
                            </td>

                            <td class="name">
                                <p>{{ $detail_pesanan->barang->nama_barang }}</p>
                                <span>kategori : {{ $detail_pesanan->barang->kategori_barang->nama_kategori }}</span>
                            </td>
                            <td class="amount">
                                @currency($detail_pesanan->harga_barang)
                            </td>

                            <td class="quentity">
                                {{ $detail_pesanan->jumlah }}
                            </td>
                            <td class="total">
                                @currency($detail_pesanan->jumlah * $detail_pesanan->harga_barang)
                            </td>
                        </tr>
                        @endforeach
                    </table>
                </div>
            </div>
        </div>
        <div class="wsus__invoice_footer">
            <p><span>Total Transaksi:</span> @currency($pesanan->total_pesanan) </p>
        </div>
    </div>
</div>
@endsection

@section('dashboard-script')
<script>
    $(document).ready(function() {
        $('#barang-table').DataTable();
        } );
</script>
@endsection
