<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Pesanan;
use App\Models\Customer;
use App\Models\Penjualan;
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
            $jumlahTransaksi = Pesanan::all()->count();
            $totalPenjualan = Penjualan::all()->sum('total_penjualan');
            $totalBarangTerjual = Barang::all()->sum('jumlah_terjual');
            $totalDiproses = Pesanan::where('status_pesanan', 'Dipesan')->count();
            $totalDikirim = Pesanan::where('status_pesanan', 'Dikirim')->count();
            $totalDikonfirmasi = Pesanan::where('status_pesanan', 'Dikonfirmasi')->count();

            // $total_penjualan = Penjualan::select(DB::raw("CAST(SUM(total_penjualan) as int) as total_penjualan"))
            //     ->GroupBy(DB::raw("Month(tanggal_penjualan)"))
            //     ->pluck('total_penjualan');

            // $bulan = Penjualan::select(DB::raw("MONTHNAME(tanggal_penjualan) as bulan"))
            //     ->GroupBy(DB::raw("MONTHNAME(tanggal_penjualan)"))
            //     ->pluck('bulan');

            $tahun = Penjualan::select(DB::raw("YEAR(tanggal_penjualan) as tahun"))
                ->GroupBy(DB::raw("YEAR(tanggal_penjualan)"))
                ->pluck('tahun');

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

            return view('home', compact('totalBarang', 'totalCustomer', 'jumlahTransaksi', 'totalPenjualan', 'nama_barang', 'jumlah_terjual', 'tahun', 'totalBarangTerjual', 'totalDiproses', 'totalDikirim', 'totalDikonfirmasi'));
        }

    }

    public function getMonthlySalesData(Request $request) {
        $year = $request->input('year'); // Ambil tahun dari request

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
}
