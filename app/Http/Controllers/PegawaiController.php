<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Pegawai;
use Illuminate\Contracts\Support\ValidatedData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class PegawaiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dataPegawais = Pegawai::all();

        return view('backend.pegawai.index', compact('dataPegawais'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.pegawai.create');
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
            'nama_pegawai' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'NIK' => ['required', 'min:16'],
            'alamat' => ['required', 'string'],
            'no_telp' => ['required', 'min:10'],
            'image' => ['image', 'file', 'max:1024'],
        ]);

        $image = $request->file('image')->store('foto_pegawai');

        $dataUser = User::create([
            'name' => $request->nama_pegawai,
            'email' => $request->email,
            'password' => Hash::make("password"),
            'hak_akses' => $request->posisi,
        ]);

        Pegawai::create([
            'NIK' => $request->NIK,
            'nama_pegawai' => $request->nama_pegawai,
            'jenis_kelamin' => $request->jenis_kelamin,
            'email' => $request->email,
            'alamat' => $request->alamat,
            'no_telp' => $request->no_telp,
            'posisi' => $request->posisi,
            'user_id' => $dataUser->id,
            'image' => $image
        ]);

        return redirect()->route('pegawai.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Pegawai  $pegawai
     * @return \Illuminate\Http\Response
     */
    public function show(Pegawai $pegawai)
    {
        return view('backend.pegawai.show', compact('pegawai'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Pegawai  $pegawai
     * @return \Illuminate\Http\Response
     */
    public function edit(Pegawai $pegawai)
    {
        return view('backend.pegawai.edit', compact('pegawai'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Pegawai  $pegawai
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pegawai $pegawai)
    {
        $validatedData = $request->validate([
            'nama_pegawai' => ['required', 'string', 'max:255'],
            'NIK' => ['required', 'min:16'],
            'alamat' => ['required', 'string'],
            'no_telp' => ['required', 'min:10'],
            'image' => ['image', 'file', 'max:1024'],
        ]);

        if ($request->file('image')) {
            Storage::delete($request->oldFotoPegawai);
            $image = $request->file('image')->store('foto_pegawai');
        } else {
            $image = $request->oldFotoPegawai;
        }

        User::where('id', $pegawai->user_id)->update([
            'name' => $request->nama_pegawai,
            'hak_akses' => $request->posisi,
        ]);

        Pegawai::where('id', $pegawai->id)->update([
            'NIK' => $request->NIK,
            'nama_pegawai' => $request->nama_pegawai,
            'jenis_kelamin' => $request->jenis_kelamin,
            'alamat' => $request->alamat,
            'no_telp' => $request->no_telp,
            'posisi' => $request->posisi,
            'image' => $image
        ]);

        return redirect()->route('pegawai.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Pegawai  $pegawai
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pegawai $pegawai)
    {
        //
    }
}
