<?php

namespace App\Http\Controllers;

use App\Models\DetailPenjualan;
use App\Models\DetailPesanan;
use App\Models\Penjualan;
use App\Models\Pesanan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PesananController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Auth::user()->hak_akses == "Kepala BUMDes") {
            $dataPesanans = Pesanan::all();
        } else {
            $dataPesanans = Pesanan::where('pegawai_id', Auth::user()->pegawai->id)->orWhere('status_pesanan', 'Dipesan')->get();
        }

        return view('backend.pesanan.index', compact('dataPesanans'));
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
    public function show(Pesanan $pesanan)
    {
        return view('backend.pesanan.show', compact('pesanan'));
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
    public function update(Request $request, Pesanan $pesanan)
    {
        //
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

    public function kirimPesanan($id)
    {
        Pesanan::where('id', $id)->update([
            'pegawai_id' => Auth::user()->pegawai->id,
            'status_pesanan' => "Dikirim",
        ]);

        return redirect()->route('pesanan.show', $id);
    }

    public function konfirmasiPesanan($id)
    {
        $dataPesanan = Pesanan::where('id', $id)->first();

        if ($dataPesanan->status_pesanan == "Dikonfirmasi") {
            Pesanan::where('id', $id)->update([
                'konfirmasi_admin' => "Dikonfirmasi",
            ]);
        } else {
            Pesanan::where('id', $id)->update([
                'status_pesanan' => "Dikonfirmasi",
                'konfirmasi_admin' => "Dikonfirmasi",
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

        return redirect()->route('pesanan.show', $id);
    }
}
