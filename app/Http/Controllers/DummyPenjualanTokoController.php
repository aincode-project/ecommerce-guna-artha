<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use Illuminate\Http\Request;
use App\Models\DummyPenjualanToko;
use Illuminate\Support\Facades\Session;
use App\Http\Requests\StoreDummyPenjualanTokoRequest;
use App\Http\Requests\UpdateDummyPenjualanTokoRequest;
use App\Models\DetailPenjualanToko;
use App\Models\PenjualanToko;
use App\Models\StokBarang;
use Illuminate\Support\Facades\Auth;

class DummyPenjualanTokoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dataDummys = DummyPenjualanToko::all();
        $dataBarangs = Barang::all();
        return view('backend.kasir.index', compact('dataBarangs', 'dataDummys'));
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
     * @param  \App\Http\Requests\StoreDummyPenjualanTokoRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $barangId = $request->input('barang_id');
        $barang = Barang::where('id', $barangId)->first();
        $cekBarang = DummyPenjualanToko::where('barang_id', $barangId)->first();

        if ($cekBarang) {
            DummyPenjualanToko::where('barang_id', $barangId)->update([
                'jumlah' => $cekBarang->jumlah + 1,
                'subtotal' => $barang->harga_jual * ($cekBarang->jumlah + 1)
            ]);
        } else {
            DummyPenjualanToko::create([
                'barang_id' => $barangId,
                'jumlah' => 1,
                'subtotal' => $barang->harga_jual,
            ]);
        }

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DummyPenjualanToko  $dummyPenjualanToko
     * @return \Illuminate\Http\Response
     */
    public function show(DummyPenjualanToko $dummyPenjualanToko)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DummyPenjualanToko  $dummyPenjualanToko
     * @return \Illuminate\Http\Response
     */
    public function edit(DummyPenjualanToko $dummyPenjualanToko)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateDummyPenjualanTokoRequest  $request
     * @param  \App\Models\DummyPenjualanToko  $dummyPenjualanToko
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $dataKasir = DummyPenjualanToko::where('id', $id)->first();
        DummyPenjualanToko::where('id', $id)->update([
            'jumlah' => $request->jumlah,
            'subtotal' => $request->jumlah * $dataKasir->barang->harga_jual,
        ]);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DummyPenjualanToko  $dummyPenjualanToko
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DummyPenjualanToko::where('id', $id)->delete();

        return redirect()->back();
    }

    public function destroyAll()
    {
        $dataKasir = DummyPenjualanToko::all();
        foreach ($dataKasir as $key => $value) {
            $value->delete();
        }

        return redirect()->back();
    }

    public function prosesTransaksi(Request $request)
    {
        $dataPenjualan = PenjualanToko::create([
            'pegawai_id' => Auth::user()->pegawai->id,
            'total_penjualan' => DummyPenjualanToko::all()->sum('subtotal'),
        ]);

        $dataKasir = DummyPenjualanToko::all();
        foreach ($dataKasir as $key => $value) {
            DetailPenjualanToko::create([
                'penjualan_toko_id' => $dataPenjualan->id,
                'barang_id' => $value->barang_id,
                'jumlah' => $value->jumlah,
                'subtotal' => $value->subtotal,
            ]);

            $dataBarang = Barang::where('id', $value->barang_id)->first();
            Barang::where('id', $value->barang_id)->update([
                'total_stok' => $dataBarang->total_stok - $value->jumlah,
                'jumlah_terjual' => $dataBarang->jumlah_terjual + $value->jumlah,
            ]);

            StokBarang::create([
                'jumlah_stok' => $value->jumlah,
                'barang_id' => $value->barang_id,
                'keterangan' => "Terjual di Toko",
            ]);

            $value->delete();

        }

        return redirect()->back();
    }
}


