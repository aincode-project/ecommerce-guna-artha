<?php

namespace App\Http\Controllers;

use App\Models\Penjualan;
use Illuminate\Http\Request;
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
        $tahuns = Penjualan::selectRaw('YEAR(tanggal_penjualan) as tahun')
            ->groupBy('tahun')
            ->orderBy('tahun')
            ->get();

        if ($id == 0) {
            $dataPenjualans = Penjualan::selectRaw('YEAR(tanggal_penjualan) as tahun, MONTHNAME(tanggal_penjualan) as bulan, SUM(total_penjualan) as total_penjualan')
                ->groupBy('tahun', 'bulan')
                ->orderByDesc('tahun', 'bulan')
                ->get();
        } else {
            if ($request->filter_tahun == 'All') {
                return redirect()->route('laporanPenjualan.index', 0);
            } else {
                $dataPenjualans = Penjualan::selectRaw('YEAR(tanggal_penjualan) as tahun, MONTHNAME(tanggal_penjualan) as bulan, SUM(total_penjualan) as total_penjualan')
                ->whereYear('tanggal_penjualan', $request->filter_tahun)
                ->groupBy('tahun', 'bulan')
                ->orderByDesc('tahun', 'bulan')
                ->get();
            }
        }

        return view('backend.laporan-penjualan.index', compact('dataPenjualans', 'tahuns'));
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
        $tanggal_awal = date_create(date("Y-m-d", strtotime($request->tahun . "-" . $request->bulan . +"-01")));
        $tanggal_akhir = date_create(date("Y-m-t", strtotime($request->tahun . "-" . $request->bulan . +"-01")));

        $dataPenjualans = Penjualan::whereBetween('tanggal_penjualan', [$tanggal_awal, $tanggal_akhir])->get();

        return view('backend.laporan-penjualan.show', compact('dataPenjualans'));
    }
}
