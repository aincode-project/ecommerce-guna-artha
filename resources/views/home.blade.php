@extends('backend_layout.admin')

@section('backend')
<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-2">
    {{-- <div class="col">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Total Barang</p>
                        <h4 class="my-1">{{ $totalBarang }}</h4>
                        <p class="mb-0 font-13 text-success"><i class='bx bxs-up-arrow align-middle'></i>$34 Since last week</p>
                    </div>
                    <div class="widgets-icons bg-light-success text-success ms-auto"><i class='bx bxs-wallet'></i>
                    </div>
                </div>
                <div id="chart10"></div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Total Customers</p>
                        <h4 class="my-1">{{ $totalCustomer }}</h4>
                        <p class="mb-0 font-13 text-success"><i class='bx bxs-up-arrow align-middle'></i>14% Since last week</p>
                    </div>
                    <div class="widgets-icons bg-light-warning text-warning ms-auto"><i class='bx bxs-group'></i>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}
    <div class="col">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Jumlah Transaksi</p>
                        <h4 class="my-1">{{ $jumlahTransaksi }}</h4>
                        {{-- <p class="mb-0 font-13 text-danger"><i class='bx bxs-down-arrow align-middle'></i>12.4% Since last week</p> --}}
                    </div>
                    <div class="widgets-icons bg-light-danger text-danger ms-auto"><i class='bx bxs-binoculars'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Total Penjualan</p>
                        <h4 class="my-1">@currency($totalPenjualan)</h4>
                        {{-- <p class="mb-0 font-13 text-success"><i class='bx bxs-up-arrow align-middle'></i>$34 Since last week</p> --}}
                    </div>
                    <div class="widgets-icons bg-light-success text-success ms-auto"><i class='bx bxs-wallet'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Jumlah Transaksi Diproses</p>
                        <h4 class="my-1">{{ $totalDiproses }}</h4>
                        {{-- <p class="mb-0 font-13 text-danger"><i class='bx bxs-down-arrow align-middle'></i>12.4% Since last week</p> --}}
                    </div>
                    <div class="widgets-icons bg-light-danger text-danger ms-auto"><i class='bx bxs-binoculars'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Jumlah Transaksi Dikirim</p>
                        <h4 class="my-1">{{ $totalDikirim }}</h4>
                        {{-- <p class="mb-0 font-13 text-success"><i class='bx bxs-up-arrow align-middle'></i>$34 Since last week</p> --}}
                    </div>
                    <div class="widgets-icons bg-light-success text-success ms-auto"><i class='bx bxs-wallet'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Jumlah Transaksi Selesai</p>
                        <h4 class="my-1">{{ $totalDikonfirmasi }}</h4>
                        {{-- <p class="mb-0 font-13 text-danger"><i class='bx bxs-down-arrow align-middle'></i>12.4% Since last week</p> --}}
                    </div>
                    <div class="widgets-icons bg-light-danger text-danger ms-auto"><i class='bx bxs-binoculars'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card radius-10">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div>
                        <p class="mb-0 text-secondary">Total Barang Terjual</p>
                        <h4 class="my-1">{{ $totalBarangTerjual }}</h4>
                        {{-- <p class="mb-0 font-13 text-success"><i class='bx bxs-up-arrow align-middle'></i>$34 Since last week</p> --}}
                    </div>
                    <div class="widgets-icons bg-light-success text-success ms-auto"><i class='bx bxs-wallet'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end row-->
<div class="row">
    <div class="col">
        <div class="card">
            <div class="card-header">Grafik Penjualan Bulanan</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <label for="yearFilter" class="form-label">Pilih Tahun:</label>
                        <select id="yearFilter" class="form-select">
                            @foreach ($tahun as $item)
                                <option value="{{ $item }}">{{ $item }}</option>
                            @endforeach

                            {{-- <option value="2024">2024</option> --}}
                            <!-- Tambahkan opsi lain sesuai dengan tahun yang ada di data Anda -->
                        </select>
                    </div>
                </div>
                <div id="grafik_penjualan"></div>
            </div>
        </div>
    </div>
</div>
<!--end row-->
<div class="row">
    <div class="col">
        <div class="card">
            <div class="card-header">Grafik Barang Terjual</div>
            <div class="card-body">
                <div id="grafik_barang"></div>
            </div>
        </div>
    </div>
</div>
<!--end row-->

{{-- <script src="https://code.highcharts.com/highcharts.js"></script> --}}

@endsection

@section('backend-script')
<script type="text/javascript">
    $(document).ready(function() {
        var chart;
        var salesData = [];

        // Inisialisasi grafik awal
        createChart(2023); // Gantilah tahun awal sesuai kebutuhan

        $('#yearFilter').change(function() {
            var selectedYear = $(this).val();
            updateChart(selectedYear);
        });

        function createChart(year) {
            // Fetch data penjualan berdasarkan tahun yang dipilih
            $.ajax({
                url: '/get-monthly-sales-data',
                method: 'GET',
                data: { year: year },
                success: function(response) {
                    salesData = response;
                    renderSalesChart();
                },
                error: function() {
                    alert('Terjadi kesalahan dalam mengambil data.');
                }
            });
        }

        function updateChart(year) {
            // Fetch data penjualan berdasarkan tahun yang dipilih
            $.ajax({
                url: '/get-monthly-sales-data',
                method: 'GET',
                data: { year: year },
                success: function(response) {
                    salesData = response;
                    renderSalesChart();
                },
                error: function() {
                    alert('Terjadi kesalahan dalam mengambil data.');
                }
            });
        }

        function renderSalesChart() {
            Highcharts.chart('grafik_penjualan', {
                // chart: {
                //     type: 'column'
                // },
                credits: {
                    enabled: false
                },
                title: {
                    text: 'Grafik Penjualan Bulanan'
                },
                xAxis: {
                    categories: salesData.labels,
                    title: {
                        text: 'Bulan'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Nominal penjualan Bulanan'
                    }
                },
                plotOptions : {
                    series : {
                        allowPointSelect: true
                    }
                },
                series: [{
                    name: 'Penjualan',
                    colorByPoint: true,
                    data: salesData.data
                }]
            });
        }
    });

    var jumlah_terjual = <?php echo json_encode($jumlah_terjual) ?>;
    var nama_barang = <?php echo json_encode($nama_barang) ?>;
    // Highcharts.chart('grafik_penjualan', {
    //     chart: {
	// 		type: 'column',
	// 	},
    //     credits: {
	// 		enabled: false
	// 	},
    //     title : {
    //         text: 'Grafik penjualan Bulanan'
    //     },
    //     xAxis : {
    //         categories : bulan
    //     },
    //     yAxis : {
    //         title : {
    //             text : 'Nominal penjualan Bulanan'
    //         }
    //     },
    //     plotOptions : {
    //         series : {
    //             allowPointSelect: true
    //         }
    //     },
    //     series :
    //     [
    //         {
    //             name: 'Nominal Penjualan',
    //             colorByPoint: true,
    //             data: penjualan
    //         }
    //     ],
    // });
    Highcharts.chart('grafik_barang', {
        chart: {
			type: 'bar',
		},
        credits: {
			enabled: false
		},
        title : {
            text: 'Grafik Barang Terjual'
        },
        xAxis : {
            categories : nama_barang
        },
        yAxis : {
            title : {
                text : 'Jumlah Barang Terjual'
            }
        },
        plotOptions : {
            series : {
                allowPointSelect: true
            }
        },
        series :
        [
            {
                name: 'Jumlah Terjual',
                colorByPoint: true,
                data: jumlah_terjual
            }
        ],
    });
</script>
@endsection
