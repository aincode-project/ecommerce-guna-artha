<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Pesanan;
use App\Models\Customer;
use App\Models\Penjualan;
use App\Models\PenjualanToko;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB as DB;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if (Auth::user()->hak_akses == "Customer") {
            return redirect()->route('home-user.index', 0);
        } else {
            $totalBarang = Barang::all()->count();
            $totalCustomer = Customer::all()->count();
            $jumlahTransaksi = Pesanan::all()->count() + PenjualanToko::all()->count();
            $totalPenjualan = Penjualan::all()->sum('total_penjualan') + PenjualanToko::all()->sum('total_penjualan');
            $totalBarangTerjual = Barang::all()->sum('jumlah_terjual');
            $totalDipesan = Pesanan::where('status_pesanan', 'Dipesan')->count();
            $totalDiproses = Pesanan::where('status_pesanan', 'Diproses')->count();
            $totalDikirim = Pesanan::where('status_pesanan', 'Dikirim')->count();
            $totalCancel = Pesanan::where('status_pesanan', 'Cancel')->count();
            $totalDikonfirmasi = Pesanan::where('status_pesanan', 'Dikonfirmasi')->count() + PenjualanToko::all()->count();

            // $total_penjualan = Penjualan::select(DB::raw("CAST(SUM(total_penjualan) as int) as total_penjualan"))
            //     ->GroupBy(DB::raw("Month(tanggal_penjualan)"))
            //     ->pluck('total_penjualan');

            // $bulan = Penjualan::select(DB::raw("MONTHNAME(tanggal_penjualan) as bulan"))
            //     ->GroupBy(DB::raw("MONTHNAME(tanggal_penjualan)"))
            //     ->pluck('bulan');

            $tahunWebsite = Penjualan::select(DB::raw("YEAR(tanggal_penjualan) as tahunWebsite"))
                ->GroupBy(DB::raw("YEAR(tanggal_penjualan)"))
                ->pluck('tahunWebsite');

            $tahunToko = PenjualanToko::select(DB::raw("YEAR(created_at) as tahunToko"))
                ->GroupBy(DB::raw("YEAR(created_at)"))
                ->pluck('tahunToko');

            $jumlah_terjual = Barang::select(DB::raw("CAST(SUM(jumlah_terjual) as int) as jumlah_terjual"))
                ->GroupBy(DB::raw("nama_barang"))
                ->orderBy('jumlah_terjual', 'desc')
                ->take(10)
                ->pluck('jumlah_terjual');

            $nama_barang = Barang::select(DB::raw("nama_barang"))
                ->GroupBy(DB::raw("nama_barang"))
                ->orderBy('jumlah_terjual', 'desc')
                ->take(10)
                ->pluck('nama_barang');

            return view('home', compact('totalBarang', 'totalCustomer', 'jumlahTransaksi', 'totalPenjualan', 'nama_barang', 'jumlah_terjual', 'tahunWebsite', 'tahunToko', 'totalBarangTerjual', 'totalDipesan', 'totalDiproses', 'totalDikirim', 'totalCancel', 'totalDikonfirmasi'));
        }

    }

    public function getMonthlySalesData(Request $request) {
        $year = $request->input('yearWebsite'); // Ambil tahun dari request

        // Query database untuk mengambil data penjualan berdasarkan tahun
        $salesData = DB::table('penjualans')
            ->select(
                DB::raw('MONTH(tanggal_penjualan) as month'),
                DB::raw('CAST(SUM(total_penjualan) as int) as total_sales')
            )
            ->whereYear('tanggal_penjualan', $year)
            ->groupBy('month')
            ->orderBy('month')
            ->get();

        $labels = [];
        $data = [];

        // Buat label bulan dan data total penjualan dari hasil query
        for ($i = 1; $i <= 12; $i++) {
            $labels[] = date('F', mktime(0, 0, 0, $i, 1, 2000)); // Nama bulan
            $monthData = $salesData->where('month', $i)->first();
            $data[] = $monthData ? $monthData->total_sales : 0;
        }

        $response = [
            'labels' => $labels,
            'data' => $data
        ];

        return response()->json($response);
    }

    public function getMonthlySalesDataToko(Request $request) {
        $year = $request->input('yearToko'); // Ambil tahun dari request

        // Query database untuk mengambil data penjualan berdasarkan tahun
        $salesData = DB::table('penjualan_tokos')
            ->select(
                DB::raw('MONTH(created_at) as month'),
                DB::raw('CAST(SUM(total_penjualan) as int) as total_sales')
            )
            ->whereYear('created_at', $year)
            ->groupBy('month')
            ->orderBy('month')
            ->get();

        $labels = [];
        $data = [];

        // Buat label bulan dan data total penjualan dari hasil query
        for ($i = 1; $i <= 12; $i++) {
            $labels[] = date('F', mktime(0, 0, 0, $i, 1, 2000)); // Nama bulan
            $monthData = $salesData->where('month', $i)->first();
            $data[] = $monthData ? $monthData->total_sales : 0;
        }

        $response = [
            'labels' => $labels,
            'data' => $data
        ];

        return response()->json($response);
    }
}
