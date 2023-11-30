<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\StokBarang;
use Illuminate\Http\Request;
use App\Models\KategoriBarang;
use Illuminate\Support\Facades\Storage;

class BarangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dataBarangs = Barang::all();

        return view('backend.barang.index', compact('dataBarangs'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $dataKategoriBarangs = KategoriBarang::all();

        return view('backend.barang.create', compact('dataKategoriBarangs'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $foto_barang = $request->file('foto_barang')->store('foto_barang');

        Barang::create([
            'kode_barang' => $request->kode_barang,
            'nama_barang' => $request->nama_barang,
            'kategori_barang_id' => $request->kategori_barang_id,
            'harga_jual' => $request->harga_jual,
            'foto_barang' => $foto_barang,
            'keterangan' => $request->keterangan,
        ]);

        return redirect()->route('barang.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Barang  $barang
     * @return \Illuminate\Http\Response
     */
    public function show(Barang $barang)
    {
        $stokBarangs = StokBarang::where('barang_id', $barang->id)->get();

        return view('backend.barang.show', compact('barang', 'stokBarangs'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Barang  $barang
     * @return \Illuminate\Http\Response
     */
    public function edit(Barang $barang)
    {
        $dataKategoriBarangs = KategoriBarang::all();

        return view('backend.barang.edit', compact('barang', 'dataKategoriBarangs'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Barang  $barang
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Barang $barang)
    {
        if ($request->file('foto_barang')) {
            Storage::delete($request->oldFotoBarang);
            $foto_barang = $request->file('foto_barang')->store('foto_barang');
        } else {
            $foto_barang = $request->oldFotoBarang;
        }

        Barang::where('id', $barang->id)->update([
            'kode_barang' => $request->kode_barang,
            'nama_barang' => $request->nama_barang,
            'kategori_barang_id' => $request->kategori_barang_id,
            'harga_jual' => $request->harga_jual,
            'keterangan' => $request->keterangan,
            'foto_barang' => $foto_barang,
        ]);

        return redirect()->route('barang.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Barang  $barang
     * @return \Illuminate\Http\Response
     */
    public function destroy(Barang $barang)
    {
        //
    }

    public function addStock($id)
    {
        $barang = Barang::find($id);
        $stokBarangs = StokBarang::where('barang_id', $id)->get();

        return view('backend.barang.add-stock', compact('barang', 'stokBarangs'));
    }

    public function addStockStore(Request $request, $id)
    {
        Barang::where('id', $id)->update([
            'total_stok' => $request->jumlah_stok + $request->stokLama
        ]);

        StokBarang::create([
            'jumlah_stok' => $request->jumlah_stok,
            'barang_id' => $id,
            'keterangan' => "Tambah Stok",
        ]);

        return redirect()->route('barang.index');
    }

    public function deleteStock($id)
    {
        $barang = Barang::find($id);
        $stokBarangs = StokBarang::where('barang_id', $id)->get();

        return view('backend.barang.delete-stock', compact('barang', 'stokBarangs'));
    }

    public function deleteStockStore(Request $request, $id)
    {
        Barang::where('id', $id)->update([
            'total_stok' => $request->stokLama - $request->jumlah_stok,
        ]);

        StokBarang::create([
            'jumlah_stok' => $request->jumlah_stok,
            'barang_id' => $id,
            'keterangan' => "Hapus Stok",
        ]);

        return redirect()->route('barang.index');
    }
}
