<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\DetailStockOpname;
use App\Models\StockOpname;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StockOpnameController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dataStockOpnames = StockOpname::all();

        return view('backend.stock-opname.index', compact('dataStockOpnames'));
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
        $dataStockOpname = StockOpname::create([
            'tanggal_opname' => $request->tanggal_opname,
            'pegawai_id' => Auth::user()->pegawai->id,
        ]);

        $dataBarangs = Barang::all();
        foreach ($dataBarangs as $key => $value) {
            DetailStockOpname::create([
                'stock_opname_id' => $dataStockOpname->id,
                'barang_id' => $value->id,
                'stok_sistem' => $value->total_stok,
            ]);
        }

        return redirect()->route('stock-opname.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\StockOpname  $stockOpname
     * @return \Illuminate\Http\Response
     */
    public function show(StockOpname $stockOpname)
    {
        return view('backend.stock-opname.show', compact('stockOpname'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\StockOpname  $stockOpname
     * @return \Illuminate\Http\Response
     */
    public function edit(StockOpname $stockOpname)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\StockOpname  $stockOpname
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StockOpname $stockOpname)
    {
        StockOpname::where('id', $stockOpname->id)->update([
            'tanggal_opname' => $request->tanggal_opname,
        ]);

        return redirect()->route('stock-opname.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\StockOpname  $stockOpname
     * @return \Illuminate\Http\Response
     */
    public function destroy(StockOpname $stockOpname)
    {
        //
    }

    public function updateStockBarang(Request $request, $id)
    {
        $detailStockOpnameTest = DetailStockOpname::where('id', $id)->first();

        $selisih = $request->stok_sistem - $request->stok_fisik;
        if ($selisih < 0) {
            $selisih = $selisih * -1;
        }
        DetailStockOpname::where('id', $id)->update([
            'stok_fisik' => $request->stok_fisik,
            'selisih' => $selisih,
        ]);
        $detailStockOpname = DetailStockOpname::where('id', $id)->first();
        $dataStockOpname = StockOpname::where('id', $detailStockOpname->stock_opname_id)->first();
        if ($detailStockOpnameTest->stok_fisik == 0) {
            if ($selisih != 0) {
                StockOpname::where('id', $detailStockOpname->stock_opname_id)->update([
                    'barang_selisih' => $dataStockOpname->barang_selisih + 1,
                ]);
            }
        }

        return redirect()->back();
    }
}
