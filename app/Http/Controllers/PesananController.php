<?php

namespace App\Http\Controllers;

use App\Models\Pesanan;
use App\Models\Penjualan;
use App\Traits\WablasTrait;
use Illuminate\Http\Request;
use App\Models\DetailPesanan;
use App\Models\PenjualanToko;
use App\Models\DetailPenjualan;
use Carbon\Carbon;
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
        $totalDipesan = Pesanan::where('status_pesanan', 'Dipesan')->count();
        $totalCancel = Pesanan::where('status_pesanan', 'Cancel')->count();

        if (Auth::user()->hak_akses == "Kepala BUMDes") {
            $dataPesanans = Pesanan::orderByRaw("FIELD(status_pesanan, 'Dipesan', 'Diproses', 'Dikirim', 'Dikonfirmasi', 'Cancel')")->get();
            $totalDiproses = Pesanan::where('status_pesanan', 'Diproses')->count();
            $totalDikirim = Pesanan::where('status_pesanan', 'Dikirim')->count();
            $totalDikonfirmasi = Pesanan::where('status_pesanan', 'Dikonfirmasi')->count();
        } else {
            $dataPesanans = Pesanan::where('pegawai_id', Auth::user()->pegawai->id)
                ->orWhere('status_pesanan', 'Dipesan')
                ->orWhere('status_pesanan', 'Cancel')
                ->orderByRaw("FIELD(status_pesanan, 'Dipesan', 'Diproses', 'Dikirim', 'Dikonfirmasi', 'Cancel')")
                ->get();

            $totalDiproses = Pesanan::where('pegawai_id', Auth::user()->pegawai->id)->where('status_pesanan', 'Diproses')->count();
            $totalDikirim = Pesanan::where('pegawai_id', Auth::user()->pegawai->id)->where('status_pesanan', 'Dikirim')->count();
            $totalDikonfirmasi = Pesanan::where('pegawai_id', Auth::user()->pegawai->id)->where('status_pesanan', 'Dikonfirmasi')->count();
        }

        return view('backend.pesanan.index', compact('dataPesanans', 'totalDipesan', 'totalDiproses', 'totalDikirim', 'totalCancel', 'totalDikonfirmasi'));
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

    public function prosesPesanan($id)
    {
        Pesanan::where('id', $id)->update([
            'pegawai_id' => Auth::user()->pegawai->id,
            'status_pesanan' => "Diproses",
        ]);

        return redirect()->route('pesanan.show', $id);
    }

    public function kirimPesanan($id)
    {
        $pesanan = Pesanan::where('id', $id)->first();
        Pesanan::where('id', $id)->update([
            'pegawai_id' => Auth::user()->pegawai->id,
            'status_pesanan' => "Dikirim",
        ]);



        $kumpulan_data = [];

        $data['phone'] = $pesanan->no_telp;
        $data['message'] = "Pesanan atas nama " . $pesanan->nama_penerima . " pada tanggal " . Carbon::parse($pesanan->tanggal_penjualan)->format('d F Y') . " telah dikirim! <br>Mohon ditunggu.";
        $data['secret'] = false;
        $data['retry'] = false;
        $data['isGroup'] = false;
        array_push($kumpulan_data, $data);

        $data['phone'] = $pesanan->customer->no_telp;
        $data['message'] = "Pesanan atas nama " . $pesanan->nama_penerima . " pada tanggal " . Carbon::parse($pesanan->tanggal_penjualan)->format('d F Y') . " telah dikirim! <br>Mohon ditunggu.";
        $data['secret'] = false;
        $data['retry'] = false;
        $data['isGroup'] = false;
        array_push($kumpulan_data, $data);

        WablasTrait::sendText($kumpulan_data);

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
