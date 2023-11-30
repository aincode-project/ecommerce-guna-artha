<?php

namespace App\Http\Controllers;

use App\Models\Keranjang;
use Illuminate\Http\Request;
use App\Models\KategoriBarang;
use Illuminate\Support\Facades\Auth;

class KeranjangController extends Controller
{
    public function index()
    {
        $dataKategoriBarangs = KategoriBarang::all();
        $dataKeranjangs = Keranjang::where('customer_id', Auth::user()->customer->id)->get();

        foreach ($dataKeranjangs as $key => $value) {
            if ($value->jumlah > $value->barang->total_stok) {
                $value->update([
                    'jumlah' => $value->barang->total_stok,
                ]);
            }
        }

        $dataKeranjangs = Keranjang::where('customer_id', Auth::user()->customer->id)->get();
        $totalKeranjang = 0;
        foreach ($dataKeranjangs as $key => $value) {
            if ($value->jumlah <= $value->barang->total_stok) {
                $totalKeranjang = $totalKeranjang + ($value->barang->harga_jual * $value->jumlah);
            }
        }

        return view('frontend.keranjang.index', compact('dataKategoriBarangs', 'dataKeranjangs', 'totalKeranjang'));
    }

    public function store(Request $request)
    {
        $dataKeranjang = Keranjang::where('customer_id', Auth::user()->customer->id)->get();
        // dd($dataKeranjang->where('barang_id', $request->barang_id));
        if ( $dataKeranjang->where('barang_id', $request->barang_id)->first() != null) {
            $jumlahLama = $dataKeranjang->where('barang_id', $request->barang_id)->first();

            Keranjang::where('id', $jumlahLama->id)->update([
                'jumlah' => $jumlahLama->jumlah + $request->jumlah,
            ]);
        } else {
            Keranjang::create([
                'barang_id' => $request->barang_id,
                'customer_id' => $request->customer_id,
                'jumlah' => $request->jumlah,
            ]);
        }

        return redirect()->route('home-user.index', 0);
    }

    public function destroy($id)
    {
        Keranjang::where('id', $id)->delete();

        return redirect()->route('keranjang.index');
    }

    public function destroyAll($id)
    {
        Keranjang::where('customer_id', $id)->delete();

        return redirect()->route('keranjang.index');
    }

    public function updateJumlah(Request $request, $id)
    {
        Keranjang::where('id', $id)->update([
            'jumlah' => $request->jumlahBaru,
        ]);

        return redirect()->route('keranjang.index');
    }
}
