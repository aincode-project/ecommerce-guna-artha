<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\KategoriBarang;
use App\Http\Requests\StoreKategoriBarangRequest;
use App\Http\Requests\UpdateKategoriBarangRequest;

class KategoriBarangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $kategoriBarangs = KategoriBarang::all();
        $editKategoriBarang = KategoriBarang::find($id);

        if ($id == 0) {
            return view('backend.kategori-barang.index', compact('kategoriBarangs', 'id'));
        } else {
            return view('backend.kategori-barang.index', compact('kategoriBarangs', 'editKategoriBarang', 'id'));
        }
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
     * @param  \App\Http\Requests\StoreKategoriBarangRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'nama_kategori' => ['required', 'string', 'unique:kategori_barangs'],
        ]);

        KategoriBarang::create([
            'nama_kategori' => $request->nama_kategori
        ]);

        return redirect()->route('kategori-barang.index', 0);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\KategoriBarang  $kategoriBarang
     * @return \Illuminate\Http\Response
     */
    public function show(KategoriBarang $kategoriBarang)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\KategoriBarang  $kategoriBarang
     * @return \Illuminate\Http\Response
     */
    public function edit(KategoriBarang $kategoriBarang)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateKategoriBarangRequest  $request
     * @param  \App\Models\KategoriBarang  $kategoriBarang
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'nama_kategori' => 'required|string|unique:kategori_barangs,nama_kategori,' . $id,
        ]);

        KategoriBarang::where('id', $id)->update([
            'nama_kategori' => $request->nama_kategori
        ]);

        return redirect()->route('kategori-barang.index', 0);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\KategoriBarang  $kategoriBarang
     * @return \Illuminate\Http\Response
     */
    public function destroy(KategoriBarang $kategoriBarang)
    {
        //
    }
}
