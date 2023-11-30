@extends('frontend-layout.admin')

@section('frontend-content')
<!--============================
    BREADCRUMB START
==============================-->
<section id="wsus__breadcrumb">
    <div class="wsus_breadcrumb_overlay">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h4>check out</h4>
                    <ul>
                        <li><a href="{{ route('home-user.index', 0) }}">home</a></li>
                        <li><a href="{{ route('checkout.index') }}">check out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!--============================
    BREADCRUMB END
==============================-->


<!--============================
    CHECK OUT PAGE START
==============================-->
<section id="wsus__cart_view">
    <div class="container">
        <form id="myForm" class="wsus__checkout_form" action="{{ route('checkout.checkout') }}" method="POST">
            @csrf
            <div class="row">
                <div class="col-xl-7 col-lg-6">
                    <div class="wsus__check_form">
                        <h5> <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Tambah Alamat Baru</a></h5>
                        <div class="row">
                            @foreach ($dataAlamats as $dataAlamat)
                            <div class="col-xl-12">
                                <div class="wsus__checkout_single_address">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="alamat_pengiriman"
                                            id="{{ 'alamat_pengiriman_' . $dataAlamat->id }}" value="{{ $dataAlamat->id }}" checked>
                                        <label class="form-check-label" for="{{ 'alamat_pengiriman_' . $dataAlamat->id }}">
                                            Select Address
                                        </label>
                                    </div>
                                    <ul>
                                        <li><span>Tipe Alamat :</span> {{ $dataAlamat->tipe_alamat }}</li>
                                        <li><span>Nama Penerima :</span> {{ $dataAlamat->nama_penerima }}</li>
                                        <li><span>No Telp :</span> {{ $dataAlamat->no_telp }}</li>
                                        <li><span>Alamat  :</span> {{ $dataAlamat->alamat }}</li>
                                        <li><span>Keterangan :</span> @if ($dataAlamat->keterangan == null ) - @else {{ $dataAlamat->keterangan }} @endif</li>
                                    </ul>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-6">
                    <div class="wsus__order_details" id="sticky_sidebar">
                        <p class="wsus__product">detail pesanan</p>
                        <div class="wsus__order_details_summery">
                            <p>jumlah produk: <span>{{ $totalProduk }} Produk</span></p>
                            <p><b>total:</b> <span><b>@currency($totalKeranjang)</b></span></p>
                            <input type="hidden" name="total_pesanan" value="{{ $totalKeranjang }}">
                        </div>
                        <button type="button" onclick="konfirmasiPemesanan()" class="common_btn">Proses Pesanan</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

<div class="wsus__popup_address">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tambah Alamat Baru</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-0">
                    <div class="wsus__check_form p-3">
                        <form action="{{ route('checkout.addNewAddress') }}" method="POST">
                            @csrf
                            <div class="row">
                              <div class="col-xl-6 col-md-6">
                                <div class="wsus__add_address_single">
                                  <label>nama penerima <b>*</b></label>
                                  <input type="text" name="nama_penerima" placeholder="Nama Penerima" required>
                                </div>
                              </div>
                              <div class="col-xl-6 col-md-6">
                                <div class="wsus__add_address_single">
                                  <label>no telp <b>*</b></label>
                                  <input type="text" name="no_telp" placeholder="No Telp" required>
                                </div>
                              </div>
                              <div class="col-xl-6 col-md-6">
                                <div class="wsus__add_address_single">
                                  <label>alamat <b>*</b></label>
                                  <input type="text" name="alamat" placeholder="Alamat" required>
                                </div>
                              </div>
                              <div class="col-xl-6 col-md-6">
                                <div class="wsus__add_address_single">
                                  <label>tipe alamat <b>*</b></label>
                                  <input type="text" name="tipe_alamat" placeholder="Rumah / Kantor / Lainnya" required>
                                </div>
                              </div>
                              <div class="col-xl-6 col-md-6">
                                <div class="wsus__add_address_single">
                                  <label>keterangan </label>
                                  <input type="text" name="keterangan" placeholder="Keterangan">
                                </div>
                              </div>
                            <div class="row">
                                <div class="col-xl-6">
                                  <button type="submit" class="common_btn">tambah</button>
                                </div>
                            </div>
                            </div>
                          </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--============================
    CHECK OUT PAGE END
==============================-->
@endsection

@section('frontend-script')
<script>
    function konfirmasiPemesanan() {
        // Munculkan alert konfirmasi
        var konfirmasi = confirm("Apakah Anda yakin ingin melakukan proses pemesanan?");

        // Cek hasil konfirmasi
        if (konfirmasi) {
            // Jika user menekan "OK", lakukan proses pemesanan
            var form = document.getElementById("myForm");
            // Lakukan sesuatu dengan data formulir, misalnya kirim ke server
            alert("Proses pemesanan berhasil dilakukan!");
            form.submit(); // Ini hanya contoh, sesuaikan dengan kebutuhan Anda
        } else {
            // Jika user menekan "Batal", berikan feedback atau lakukan sesuatu
            alert("Proses pemesanan dibatalkan.");
        }
    }
</script>
@endsection
