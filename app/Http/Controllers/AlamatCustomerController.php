<?php

namespace App\Http\Controllers;

use App\Models\AlamatCustomer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AlamatCustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dataAlamats = AlamatCustomer::where('customer_id', Auth::user()->customer->id)->get();

        return view('frontend.alamat.index', compact('dataAlamats'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('frontend.alamat.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'nama_penerima' => 'required|string',
            'alamat' => 'required|string',
            'no_telp' => 'required|numeric',
            'tipe_alamat' => 'required|string',
            'keterangan' => 'string',
        ]);

        AlamatCustomer::create([
            'nama_penerima' => $request->nama_penerima,
            'alamat' => $request->alamat,
            'no_telp' => $request->no_telp,
            'tipe_alamat' => $request->tipe_alamat,
            'keterangan' => $request->keterangan,
            'customer_id' => Auth::user()->customer->id,
        ]);

        return redirect()->route('alamat-customer.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AlamatCustomer  $alamatCustomer
     * @return \Illuminate\Http\Response
     */
    public function show(AlamatCustomer $alamatCustomer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AlamatCustomer  $alamatCustomer
     * @return \Illuminate\Http\Response
     */
    public function edit(AlamatCustomer $alamatCustomer)
    {
        return view('frontend.alamat.edit', compact('alamatCustomer'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AlamatCustomer  $alamatCustomer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AlamatCustomer $alamatCustomer)
    {
        $validatedData = $request->validate([
            'nama_penerima' => 'required|string',
            'alamat' => 'required',
            'no_telp' => 'required|numeric',
            'tipe_alamat' => 'required|string',
        ]);

        $alamatCustomer->update([
            'nama_penerima' => $request->nama_penerima,
            'alamat' => $request->alamat,
            'no_telp' => $request->no_telp,
            'tipe_alamat' => $request->tipe_alamat,
            'keterangan' => $request->keterangan,
        ]);

        return redirect()->route('alamat-customer.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AlamatCustomer  $alamatCustomer
     * @return \Illuminate\Http\Response
     */
    public function destroy(AlamatCustomer $alamatCustomer)
    {
        $alamatCustomer->delete();

        return redirect()->route('alamat-customer.index');
    }
}
