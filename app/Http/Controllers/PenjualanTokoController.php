<?php

namespace App\Http\Controllers;

use App\Models\PenjualanToko;
use App\Http\Requests\StorePenjualanTokoRequest;
use App\Http\Requests\UpdatePenjualanTokoRequest;
use App\Models\DetailPenjualanToko;

class PenjualanTokoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dataPenjualans = PenjualanToko::all();

        return view('backend.penjualan-toko.index', compact('dataPenjualans'));
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
     * @param  \App\Http\Requests\StorePenjualanTokoRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePenjualanTokoRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PenjualanToko  $penjualanToko
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $penjualan = PenjualanToko::where('id', $id)->first();
        $detailPenjualan = DetailPenjualanToko::where('penjualan_toko_id', $penjualan->id)->get();

        return view('backend.penjualan-toko.show', compact('penjualan', 'detailPenjualan'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PenjualanToko  $penjualanToko
     * @return \Illuminate\Http\Response
     */
    public function edit(PenjualanToko $penjualanToko)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdatePenjualanTokoRequest  $request
     * @param  \App\Models\PenjualanToko  $penjualanToko
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePenjualanTokoRequest $request, PenjualanToko $penjualanToko)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PenjualanToko  $penjualanToko
     * @return \Illuminate\Http\Response
     */
    public function destroy(PenjualanToko $penjualanToko)
    {
        //
    }
}
