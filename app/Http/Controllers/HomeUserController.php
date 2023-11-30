<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Keranjang;
use Illuminate\Http\Request;
use App\Models\KategoriBarang;
use Illuminate\Support\Facades\DB as DB;
use Illuminate\Support\Facades\Auth;

class HomeUserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        if ($id == 0) {
            $dataBarangs = Barang::latest()->filter(request(['search', 'category']));
        } else {
            $dataBarangs = Barang::where('kategori_barang_id', $id)->filter(request(['search', 'category']));
        }

        $dataKategoriBarangs = KategoriBarang::all();
        $dataKeranjangs = null;
        $totalKeranjang = 0;
        if (Auth::check()) {
            $dataKeranjangs = Keranjang::where('customer_id', Auth::user()->customer->id)->get();
            $totalKeranjang = 0;
            foreach ($dataKeranjangs as $key => $value) {
                $totalKeranjang = $totalKeranjang + ($value->barang->harga_jual * $value->jumlah);
            }
        }

        return view('landing-page', [
            "dataKategoriBarangs" => $dataKategoriBarangs,
            "dataBarangs" => $dataBarangs->paginate(15),
            "dataKeranjangs" => $dataKeranjangs,
            "totalKeranjang" => $totalKeranjang
        ]);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $dataBarang = Barang::where('id', $id)->first();
        $dataKategoriBarangs = KategoriBarang::all();
        $dataKeranjangs = null;
        $totalKeranjang = 0;
        if (Auth::user()) {
            $dataKeranjangs = Keranjang::where('customer_id', Auth::user()->customer->id)->get();
            foreach ($dataKeranjangs as $key => $value) {
                $totalKeranjang = $totalKeranjang + ($value->barang->harga_jual * $value->jumlah);
            }
        }


        return view('detail-barang', compact('dataBarang', 'dataKategoriBarangs', 'dataKeranjangs', 'totalKeranjang'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
