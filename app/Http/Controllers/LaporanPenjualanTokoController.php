<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\PenjualanToko;
use Barryvdh\DomPDF\Facade\Pdf as PDF;
use Illuminate\Support\Facades\DB;

class LaporanPenjualanTokoController extends Controller
{
    public function index(Request $request, $id)
    {
        $minDate = PenjualanToko::min(DB::raw('DATE(created_at)'));
        $maxDate = PenjualanToko::max(DB::raw('DATE(created_at)'));
        $tanggalAwalDipilih = $minDate;
        $tanggalAkhirDipilih = $maxDate;

        if ($id == 0) {
            $dataPenjualans = PenjualanToko::selectRaw('DATE(created_at) as tanggal, SUM(total_penjualan) as total_penjualan')
                ->groupBy('tanggal')
                ->orderBy('tanggal')
                ->get();
        } else {
                $tanggal_awal = Carbon::createFromFormat('Y-m-d', $request->tanggal_awal_data)->startOfDay();
                $tanggal_akhir = Carbon::createFromFormat('Y-m-d', $request->tanggal_akhir_data)->endOfDay();
                $dataPenjualans = PenjualanToko::selectRaw('DATE(created_at) as tanggal, SUM(total_penjualan) as total_penjualan')
                ->whereBetween('created_at', [$tanggal_awal, $tanggal_akhir])
                ->groupBy('tanggal')
                ->orderBy('tanggal')
                ->get();

                $tanggalAwalDipilih = $request->tanggal_awal_data;
                $tanggalAkhirDipilih = $request->tanggal_akhir_data;
        }

        return view('backend.laporan-penjualan-toko.index', compact('dataPenjualans', 'minDate', 'maxDate', 'tanggalAwalDipilih', 'tanggalAkhirDipilih'));
    }

    public function detail(Request $request, $id)
    {
        // dd($request->tanggal);
        // $tanggal_awal = date_create(date("Y-m-d", strtotime($request->tahun . "-" . $request->bulan . +"-01")));
        // $tanggal_akhir = date_create(date("Y-m-t", strtotime($request->tahun . "-" . $request->bulan . +"-01")));

        $dataPenjualans = PenjualanToko::where('created_at', $request->tanggal)->get();

        return view('backend.laporan-penjualan-toko.show', compact('dataPenjualans'));
    }

    public function print(Request $request)
    {
        $tanggal_awal = Carbon::createFromFormat('Y-m-d', $request->tanggalAwal)->startOfDay();
        $tanggal_akhir = Carbon::createFromFormat('Y-m-d', $request->tanggalAkhir)->endOfDay();
        $dataPenjualans = PenjualanToko::selectRaw('DATE(created_at) as tanggal, SUM(total_penjualan) as total_penjualan')
            ->whereBetween('created_at', [$tanggal_awal, $tanggal_akhir])
            ->groupBy('tanggal')
            ->orderBy('tanggal')
            ->get();

        // $pdf = PDF::make();
        $pdf = PDF::loadView('backend.laporan-penjualan-toko.print', compact('dataPenjualans'));

        return $pdf->stream('laporan-penjualan-toko_' . Carbon::parse($request->tanggalAwal)->format('d F Y') . ' - ' . Carbon::parse($request->tanggalAkhir)->format('d F Y') . '.pdf');
    }
}
