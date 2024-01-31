<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Penjualan;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf as PDF;
use Illuminate\Support\Facades\DB as DB;

class LaporanPenjualanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $id)
    {
        $minDate = Penjualan::min('tanggal_penjualan');
        $maxDate = Penjualan::max('tanggal_penjualan');
        $tanggalAwalDipilih = $minDate;
        $tanggalAkhirDipilih = $maxDate;

        if ($id == 0) {
            $dataPenjualans = Penjualan::selectRaw('DATE(tanggal_penjualan) as tanggal, SUM(total_penjualan) as total_penjualan')
                ->groupBy('tanggal')
                ->orderBy('tanggal')
                ->get();
        } else {
                $dataPenjualans = Penjualan::selectRaw('DATE(tanggal_penjualan) as tanggal, SUM(total_penjualan) as total_penjualan')
                ->whereBetween('tanggal_penjualan', [$request->tanggal_awal_data, $request->tanggal_akhir_data])
                ->groupBy('tanggal')
                ->orderBy('tanggal')
                ->get();

                $tanggalAwalDipilih = $request->tanggal_awal_data;
                $tanggalAkhirDipilih = $request->tanggal_akhir_data;
        }

        return view('backend.laporan-penjualan.index', compact('dataPenjualans', 'minDate', 'maxDate', 'tanggalAwalDipilih', 'tanggalAkhirDipilih'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Penjualan  $penjualan
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $tanggal_awal = date_create(date("Y-m-d", strtotime($request->tahun . "-" . $request->bulan . +"-01")));
        $tanggal_akhir = date_create(date("Y-m-t", strtotime($request->tahun . "-" . $request->bulan . +"-01")));

        dd($tanggal_awal, $tanggal_akhir);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Penjualan  $penjualan
     * @return \Illuminate\Http\Response
     */
    public function edit(Penjualan $penjualan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Penjualan  $penjualan
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Penjualan $penjualan)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Penjualan  $penjualan
     * @return \Illuminate\Http\Response
     */
    public function destroy(Penjualan $penjualan)
    {
        //
    }

    public function detail(Request $request, $id)
    {
        // dd($request->tanggal);
        // $tanggal_awal = date_create(date("Y-m-d", strtotime($request->tahun . "-" . $request->bulan . +"-01")));
        // $tanggal_akhir = date_create(date("Y-m-t", strtotime($request->tahun . "-" . $request->bulan . +"-01")));

        $dataPenjualans = Penjualan::where('tanggal_penjualan', $request->tanggal)->get();

        return view('backend.laporan-penjualan.show', compact('dataPenjualans'));
    }

    public function print(Request $request)
    {
        $dataPenjualans = Penjualan::selectRaw('DATE(tanggal_penjualan) as tanggal, SUM(total_penjualan) as total_penjualan')
            ->whereBetween('tanggal_penjualan', [$request->tanggalAwal, $request->tanggalAkhir])
            ->groupBy('tanggal')
            ->orderBy('tanggal')
            ->get();

        // $pdf = PDF::make();
        $pdf = PDF::loadView('backend.laporan-penjualan.print', compact('dataPenjualans'));

        return $pdf->stream('laporan-penjualan-website_' . Carbon::parse($request->tanggalAwal)->format('d F Y') . ' - ' . Carbon::parse($request->tanggalAkhir)->format('d F Y') . '.pdf');
    }
}
