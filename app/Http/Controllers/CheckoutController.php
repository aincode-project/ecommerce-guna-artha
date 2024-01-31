<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Pesanan;
use App\Models\Keranjang;
use App\Models\StokBarang;
use App\Traits\WablasTrait;
use Illuminate\Http\Request;
use App\Models\DetailPesanan;
use App\Models\AlamatCustomer;
use App\Models\KategoriBarang;
use Illuminate\Support\Facades\Auth;

class CheckoutController extends Controller
{
    public function index(Request $request)
    {
        $dataKategoriBarangs = KategoriBarang::all();

        $dataAlamats = AlamatCustomer::where('customer_id', Auth::user()->customer->id)->get();

        $dataKeranjangs = Keranjang::where('customer_id', Auth::user()->customer->id)->get();
        $totalProduk = Keranjang::where('customer_id', Auth::user()->customer->id)->count();
        $totalKeranjang = 0;
        foreach ($dataKeranjangs as $key => $value) {
            if ($value->jumlah <= $value->barang->total_stok) {
                $totalKeranjang = $totalKeranjang + ($value->barang->harga_jual * $value->jumlah);
            }
        }

        return view('frontend.checkout.index', compact('dataKategoriBarangs', 'dataAlamats', 'totalKeranjang', 'totalProduk'));
    }

    public function checkout(Request $request)
    {
        $dataAlamat = AlamatCustomer::where('id', $request->alamat_pengiriman)->first();

        $dataPesanan = Pesanan::create([
           'customer_id' => Auth::user()->customer->id,
           'nama_penerima' => $dataAlamat->nama_penerima,
           'alamat' => $dataAlamat->alamat,
           'no_telp' => $dataAlamat->no_telp,
           'keterangan_alamat' => $dataAlamat->keterangan,
           'total_pesanan' => $request->total_pesanan,
           'status_pesanan' => "Dipesan"
        ]);

        $dataKeranjangs = Keranjang::where('customer_id', Auth::user()->customer->id)->get();
        foreach ($dataKeranjangs as $key => $value) {
            DetailPesanan::create([
                'pesanan_id' => $dataPesanan->id,
                'barang_id' => $value->barang_id,
                'harga_barang' => $value->barang->harga_jual,
                'jumlah' => $value->jumlah
            ]);

            $dataBarang = Barang::where('id', $value->barang_id)->first();
            Barang::where('id', $value->barang_id)->update([
                'total_stok' => $dataBarang->total_stok - $value->jumlah,
                'jumlah_terjual' => $dataBarang->jumlah_terjual + $value->jumlah
            ]);

            StokBarang::create([
                'jumlah_stok' => $value->jumlah,
                'barang_id' => $value->barang_id,
                'keterangan' => "Terjual"
            ]);
        }

        Keranjang::where('customer_id', Auth::user()->customer->id)->delete();

        $kumpulan_data = [];

        $data['phone'] = $dataAlamat->no_telp;
        $data['message'] = "Pesanan anda telah berhasil dibuat. Mohon ditunggu untuk proses pengiriman.";
        $data['secret'] = false;
        $data['retry'] = false;
        $data['isGroup'] = false;
        array_push($kumpulan_data, $data);

        $data['phone'] = $dataPesanan->customer->no_telp;
        $data['message'] = "Pesanan anda telah berhasil dibuat. Mohon ditunggu untuk proses pengiriman.";
        $data['secret'] = false;
        $data['retry'] = false;
        $data['isGroup'] = false;
        array_push($kumpulan_data, $data);

        WablasTrait::sendText($kumpulan_data);

        return redirect()->route('dashboard-customer.index');
    }

    public function addNewAddress(Request $request)
    {
        AlamatCustomer::create([
            'nama_penerima' => $request->nama_penerima,
            'alamat' => $request->alamat,
            'no_telp' => $request->no_telp,
            'tipe_alamat' => $request->tipe_alamat,
            'keterangan' => $request->keterangan,
            'customer_id' => Auth::user()->customer->id,
        ]);

        return redirect()->back();
    }
}
