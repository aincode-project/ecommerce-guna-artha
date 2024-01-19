<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Pesanan;
use App\Models\Penjualan;
use Illuminate\Http\Request;
use App\Models\DetailPesanan;
use App\Models\DetailPenjualan;
use Illuminate\Support\Facades\Auth;

class TransaksiCustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dataPesanans = Pesanan::where('customer_id', Auth::user()->customer->id)
            ->orderByRaw("FIELD(status_pesanan, 'Dipesan', 'Diproses', 'Dikirim', 'Dikonfirmasi', 'Cancel')")
            ->get();

        return view('frontend.transaksi.index', compact('dataPesanans'));
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
     * @param  \App\Models\Pesanan  $pesanan
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pesanan = Pesanan::where('id', $id)->first();
        return view('frontend.transaksi.show', compact('pesanan'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Pesanan  $pesanan
     * @return \Illuminate\Http\Response
     */
    public function edit(Pesanan $pesanan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pesanan  $pesanan
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $dataPesanan = Pesanan::where('id', $id)->first();

        if ($dataPesanan->status_pesanan == "Dikonfirmasi") {
            Pesanan::where('id', $id)->update([
                'konfirmasi_customer' => "Dikonfirmasi",
            ]);
        } else {
            Pesanan::where('id', $id)->update([
                'status_pesanan' => "Dikonfirmasi",
                'konfirmasi_customer' => "Dikonfirmasi",
            ]);

            $dataPenjualan = Penjualan::create([
               'customer_id' => $dataPesanan->customer_id,
               'pegawai_id' => $dataPesanan->pegawai_id,
               'nama_penerima' => $dataPesanan->nama_penerima,
               'alamat' => $dataPesanan->alamat,
               'no_telp' => $dataPesanan->no_telp,
               'keterangan_alamat' => $dataPesanan->keterangan_alamat,
               'total_penjualan' => $dataPesanan->total_pesanan,
            ]);

            $dataDetailPesanan = DetailPesanan::where('pesanan_id', $id)->get();
            foreach ($dataDetailPesanan as $key => $value) {
                DetailPenjualan::create([
                    'penjualan_id' => $dataPenjualan->id,
                    'barang_id' => $value->barang_id,
                    'harga_barang' => $value->barang->harga_jual,
                    'jumlah' => $value->jumlah
                ]);
            }
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pesanan  $pesanan
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pesanan $pesanan)
    {
        //
    }

    public function ubahJumlah(Request $request, $id)
    {
        $detailTransaksi = DetailPesanan::where('id', $id)->first();
        $dataTransaksi = Pesanan::where('id', $detailTransaksi->pesanan_id)->first();
        $dataBarang = Barang::where('id', $detailTransaksi->barang_id)->first();

        DetailPesanan::where('id', $id)->update([
            'jumlah' => $request->jumlah,
        ]);

        Barang::where('id', $detailTransaksi->barang_id)->update([
            'total_stok' => ($dataBarang->total_stok + $detailTransaksi->jumlah) - $request->jumlah,
            'jumlah_terjual' => ($dataBarang->jumlah_terjual - $detailTransaksi->jumlah) + $request->jumlah
        ]);

        $newDetailTransaksi = DetailPesanan::where('pesanan_id', $detailTransaksi->pesanan_id)->get();
        $total_pesanan = 0;
        foreach ($newDetailTransaksi as $key => $value) {
            $total_pesanan = $total_pesanan + ($value->jumlah * $value->harga_barang);
        }

        Pesanan::where('id', $detailTransaksi->pesanan_id)->update([
            'total_pesanan' => $total_pesanan,
        ]);

        return redirect()->back();
    }

    public function hapusPesanan($id)
    {
        $detailTransaksi = DetailPesanan::where('id', $id)->first();
        $dataBarang = Barang::where('id', $detailTransaksi->barang_id)->first();

        Barang::where('id', $detailTransaksi->barang_id)->update([
            'total_stok' => $dataBarang->total_stok + $detailTransaksi->jumlah,
            'jumlah_terjual' => $dataBarang->jumlah_terjual - $detailTransaksi->jumlah
        ]);

        DetailPesanan::where('id', $id)->delete();

        $newDetailTransaksi = DetailPesanan::where('pesanan_id', $detailTransaksi->pesanan_id)->get();
        $total_pesanan = 0;
        foreach ($newDetailTransaksi as $key => $value) {
            $total_pesanan = $total_pesanan + ($value->jumlah * $value->harga_barang);
        }

        Pesanan::where('id', $detailTransaksi->pesanan_id)->update([
            'total_pesanan' => $total_pesanan,
        ]);

        return redirect()->back();
    }

    public function cancelPesanan($id)
    {
        $dataPesanan = Pesanan::where('id', $id)->first();

        Pesanan::where('id', $id)->update([
            'status_pesanan' => 'Cancel',
        ]);

        $detailPesanan = DetailPesanan::where('pesanan_id', $id)->get();
        foreach ($detailPesanan as $key => $value) {
            $dataBarang = Barang::where('id', $value->barang_id)->first();

            Barang::where('id', $value->barang_id)->update([
                'total_stok' => $dataBarang->total_stok + $value->jumlah,
                'jumlah_terjual' => $dataBarang->jumlah_terjual - $value->jumlah
            ]);
        }

        return redirect()->back();
    }
}
