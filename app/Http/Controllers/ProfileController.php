<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Pegawai;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $dataUser = User::find($id);
        $dataPegawai = Pegawai::where('user_id', $dataUser->id)->first();

        return view('backend.profil.index', compact('dataPegawai', 'dataUser'));
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pegawai = Pegawai::find($id);

        return view('backend.profil.edit', compact('pegawai'));
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
        $validatedData = $request->validate([
            'image' => ['file', 'mimes:jpeg,jpg,png'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);

        if ($request->file('image')) {
            Storage::delete($request->oldFotoPegawai);
            $image = $request->file('image')->store('foto_pegawai');
        } else {
            $image = $request->oldFotoPegawai;
        }

        $dataPegawai = Pegawai::find($id);
        Pegawai::where('id', $id)->update([
            'image' => $image,
        ]);

        if ($request->password) {
            User::where('id', $dataPegawai->user_id)->update([
                'password' => Hash::make($request->password),
            ]);
        }

        return redirect()->route('profile.index', $dataPegawai->user_id);
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
