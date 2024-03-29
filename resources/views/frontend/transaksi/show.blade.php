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
                            <p>Tanggal: {{ Carbon\Carbon::parse($pesanan->created_at)->format('d F Y H:i:s') }}</p>
                            <p>Status: {{ $pesanan->status_pesanan }}</p>
                            @if (($pesanan->status_pesanan == "Dikirim" || $pesanan->status_pesanan == "Dikonfirmasi") && $pesanan->konfirmasi_customer == "Belum Dikonfirmasi")
                                <form action="{{ route('transaksi.update', $pesanan->id) }}" method="POST">
                                    @method('PUT')
                                    @csrf
                                    <button class="btn btn-sm btn-outline-success">Konfirmasi Penerimaan</button>
                                </form>
                            @endif
                            @if ($pesanan->status_pesanan == "Dipesan")
                                <form action="{{ route('transaksi-customer.cancelPesanan', $pesanan->id) }}" method="POST" id="formPembatalan">
                                    @method('put')
                                    @csrf
                                    <button class="btn btn-sm btn-outline-danger" onclick="konfirmasiPembatalan()"><i class="fal fa-trash-alt"></i> Cancel</button>
                                </form>
                            @endif
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
                            @if ($pesanan->status_pesanan == "Dipesan")
                            <th class="total">

                            </th>
                            @endif
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
                                @if ($pesanan->status_pesanan == "Dipesan")
                                <a href="" data-bs-toggle="modal" data-bs-target="#jumlahUpdate{{$detail_pesanan->id}}"><i class="fal fa-edit" style="color: orange; margin-left: 10px"></i></a>
                                <!-- Modal -->
                                <div class="modal fade" id="jumlahUpdate{{$detail_pesanan->id}}" tabindex="-1" aria-labelledby="exampleModalLabel{{$detail_pesanan->id}}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel{{$detail_pesanan->id}}">Ubah Jumlah</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form action="{{ route('transaksi-customer.ubahJumlah', $detail_pesanan->id) }}" method="POST">
                                                @method('put')
                                                @csrf
                                                <div class="modal-body text-start">
                                                    {{ $detail_pesanan->barang->nama_barang }}
                                                    <input type="number" class="form-control" min="1" max="{{ $detail_pesanan->barang->total_stok }}" name="jumlah" id="jumlah" value="{{ $detail_pesanan->jumlah }}">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                    <button type="submit" class="btn btn-primary">Ubah</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                @endif
                            </td>
                            <td class="total">
                                @currency($detail_pesanan->jumlah * $detail_pesanan->harga_barang)
                            </td>
                            @if ($pesanan->status_pesanan == "Dipesan")
                            <td class="total">
                                <form action="{{ route('transaksi-customer.hapusPesanan', $detail_pesanan->id) }}" method="POST">
                                    @method('delete')
                                    @csrf
                                    <button type="submit" class="btn btn-link"><i class="fal fa-trash-alt" style="color: red"></i></button>
                                </form>
                            </td>
                            @endif
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

    function konfirmasiPembatalan() {
        // Munculkan alert konfirmasi
        var konfirmasi = confirm("Apakah Anda yakin ingin membatalkan pesanan ini?");

        // Cek hasil konfirmasi
        if (konfirmasi) {
            // Jika user menekan "OK", lakukan proses pemesanan
            var form = document.getElementById("formPembatalan");
            // Lakukan sesuatu dengan data formulir, misalnya kirim ke server
            alert("Proses pembatalan berhasil dilakukan!");
            form.submit(); // Ini hanya contoh, sesuaikan dengan kebutuhan Anda
            } else {
                // Jika user menekan "Batal", berikan feedback atau lakukan sesuatu
                alert("Pembatalan dibatalkan.");
            }
    }
</script>
@endsection
