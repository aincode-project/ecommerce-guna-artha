<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\StokBarang;
use Illuminate\Http\Request;

class StokController extends Controller
{
    public function addStock($id)
    {
        $barang = Barang::find($id);
        $stokBarangs = StokBarang::where('barang_id', $id)->get();

        return view('backend.barang.add-stock', compact('barang', 'stokBarangs'));
    }

    public function addStockStore(Request $request, $id)
    {

    }

    public function deleteStock($id)
    {

    }

    public function deleteStockStore(Request $request, $id)
    {

    }
}
