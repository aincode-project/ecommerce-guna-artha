@extends('backend_layout.admin')

@section('backend-head')
    @if(Session::has('success'))
    <script>
        Lobibox.notify('success', {
            size: 'mini',
            delay: 2000,
            title: 'Sukses',
            msg: '{{ Session::get("success") }}'
        });
    </script>
    @endif
@endsection

@section('backend')
<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
    <div class="breadcrumb-title pe-3">Transaksi Offline</div>
    <div class="ps-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 p-0">
                <li class="breadcrumb-item"><a href="{{ route('home') }}"><i class="bx bx-home-alt"></i></a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Kasir</li>
            </ol>
        </nav>
    </div>
</div>
<hr/>
<div class="card">
    <div class="card-body">
        <form action="{{ route('kasir.store') }}" id="formKasir" method="POST">
            @csrf
            <div class="row mb-3">
                <div class="col-md-1">
                    <label class="form-label" style="font-size: 18px">Barang</label>
                </div>
                <div class="col-md-8">
                    <select class="select-product" name="barang_id" id="barang_id">
                        @foreach ($dataBarangs as $dataBarang)
                            <option value="{{ $dataBarang->id }}">{{ $dataBarang->kode_barang }} - {{ $dataBarang->nama_barang }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary" id="submitFormKasir"><i class="bx bx-right-arrow-alt"></i></button>
                </div>
            </div>
        </form>
        <div class="table-responsive">
            <table id="kasir-table" class="table table-striped table-bordered table-sm" style="width:100%">
                <thead class="text-center" style="background-color: rgb(53, 146, 213); color: white">
                    <tr>
                        <th>Kode Barang</th>
                        <th>Nama Barang</th>
                        <th>Harga</th>
                        <th>Jumlah</th>
                        <th>Subtotal</th>
                        <th>
                            <form action="{{ route('kasir.deleteAll') }}" method="POST">
                                @method('delete')
                                @csrf

                                <button type="submit" class="btn btn-link btn-sm" style="color: red"><i class="fadeIn animated bx bx-trash"></i></button>
                            </form>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($dataDummys as $dataDummy)
                        <tr>
                            <td>{{ $dataDummy->barang->kode_barang }}</td>
                            <td>{{ $dataDummy->barang->nama_barang }}</td>
                            <td class="text-end">@currency($dataDummy->barang->harga_jual)</td>
                            <td>
                                <div class="row">
                                    <div class="col-8">
                                        <form action="{{ route('kasir.update', $dataDummy->id) }}" method="POST">
                                            @method('put')
                                            @csrf
                                            <input type="number" class="form-control" min="1" max="{{ $dataDummy->barang->total_stok }}" name="jumlah" id="jumlah" value="{{ $dataDummy->jumlah }}">
                                    </div>
                                    <div class="col-1">
                                        <button type="submit" style="color: orange" class="btn btn-link"><i class='bx bx-xs bx-edit-alt'></i></button>
                                        </form>
                                    </div>
                                </div>
                                {{-- {{ $dataDummy->jumlah }}<a href="#" style="color: orange" data-bs-toggle="modal" data-bs-target="#exampleModal{{ $dataDummy->id }}"><i class='bx bx-xs bx-edit-alt'></i></a>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal{{ $dataDummy->id }}" tabindex="-1" aria-labelledby="exampleModalLabel{{ $dataDummy->id }}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel{{ $dataDummy->id }}">Ubah Jumlah</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form action="{{ route('kasir.update', $dataDummy->id) }}" method="POST">
                                                @method('put')
                                                @csrf
                                                <div class="modal-body text-start">
                                                    <input type="number" class="form-control" min="1" max="{{ $dataDummy->barang->total_stok }}" name="jumlah" id="jumlah" value="{{ $dataDummy->jumlah }}">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                    <button type="submit" class="btn btn-primary">Ubah</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div> --}}
                            </td>
                            <td class="text-end">@currency($dataDummy->subtotal)</td>
                            <td>
                                <form action="{{ route('kasir.destroy', $dataDummy->id) }}" method="POST">
                                    @method('delete')
                                    @csrf

                                    <button type="submit" class="btn btn-link" style="color: red"><i class="fadeIn animated bx bx-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="bg-primary" style="font-size: 3em; text-align: center; height: 100px; color: #f0f0f0">Bayar: @currency($dataDummys->sum('subtotal'))</div>
                {{-- <div style="padding: 10px; background: #f0f0f0;">  Rupiah</div> --}}
            </div>
            <div class="col-md-4">
                <form action="{{ route('kasir.prosesTransaksi') }}" method="POST" id="formTransaksi">
                    @csrf
                    <p>
                        <div class="row">
                            <div class="col-md-4">
                                Total :
                            </div>
                            <div class="col-md-8 text-end">
                                @currency($dataDummys->sum('subtotal'))
                            </div>
                        </div>
                    </p>
                    <p>
                        <div class="row">
                            <div class="col-md-4">
                                Uang :
                            </div>
                            <div class="col-md-8 text-end">
                                <input type="number" class="form-control text-end" name="uang" id="uang" oninput="formatInput()" onchange="calculateChange()" value="0">
                            </div>
                        </div>
                    </p>
                    <p>
                        <div class="row">
                            <div class="col-md-4">
                                Kembalian :
                            </div>
                            <div class="col-md-8 text-end" id="kembalian" style="color: red">
                                -@currency($dataDummys->sum('subtotal'))
                            </div>
                        </div>
                    </p>
                    <p class="text-end">
                        @if ($dataDummys->count() != 0)
                            <button type="button" class="btn btn-sm btn-success" onclick="konfirmasiTransaksi()">Proses Transaksi</button>
                        @endif
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@section('backend-script')
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Calculate change when the page is loaded
            calculateChange();
        });

        $('.select-product').select2({
			theme: 'bootstrap4',
			width: $(this).data('width') ? $(this).data('width') : $(this).hasClass('w-100') ? '100%' : 'style',
			placeholder: $(this).data('placeholder'),
			allowClear: Boolean($(this).data('allow-clear')),
		});

        $(document).ready(function() {
            $('#kasir-table').DataTable({
                searching: false,
                paging: false,
                info: false
            });
        } );

        function formatInput() {
            var uangInput = document.getElementById('uang');
            var value = uangInput.value.replace(/\D/g, ''); // Remove non-numeric characters

            // Format the value with thousand separators
            var formattedValue = new Intl.NumberFormat('id-ID').format(value);

            // Update the input value
            uangInput.value = formattedValue;
        }

        function calculateChange() {
            // Get the total and input value
            var total = parseFloat("{{$dataDummys->sum('subtotal')}}");
            var uang = parseFloat(document.getElementById('uang').value.replace(/\D/g, ''));

            // Calculate the change
            var kembalian = uang - total;

            // Determine the sign manually
            // Determine the sign manually
            var sign = kembalian < 0 ? '-' : '';

            // Format the kembalian as Indonesian Rupiah without decimal
            var formattedKembalian = new Intl.NumberFormat('id-ID', {
                style: 'currency',
                currency: 'IDR',
                minimumFractionDigits: 0,
                maximumFractionDigits: 0
            }).format(Math.abs(kembalian));

            // Update the kembalian element and apply red color if it's negative
            var kembalianElement = document.getElementById('kembalian');
            kembalianElement.innerText = sign + formattedKembalian;
            kembalianElement.style.color = kembalian < 0 ? 'red' : 'inherit';
        }

        function konfirmasiTransaksi() {
            // Munculkan alert konfirmasi
            var total = parseFloat("{{$dataDummys->sum('subtotal')}}");
            var uang = parseFloat(document.getElementById('uang').value.replace(/\D/g, ''));

            if (uang >= total) {
                var konfirmasi = confirm("Apakah Anda yakin ingin melakukan proses transaksi?");

                // Cek hasil konfirmasi
                if (konfirmasi) {
                    // Jika user menekan "OK", lakukan proses pemesanan
                    var form = document.getElementById("formTransaksi");
                    // Lakukan sesuatu dengan data formulir, misalnya kirim ke server
                    alert("Transaksi berhasil dilakukan!");
                    form.submit(); // Ini hanya contoh, sesuaikan dengan kebutuhan Anda
                } else {
                    // Jika user menekan "Batal", berikan feedback atau lakukan sesuatu
                    alert("Transaksi dibatalkan.");
                }
            } else {
                alert("Uang belum cukup!");
            }


        }
    </script>
@endsection
