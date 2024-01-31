<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class ProfilCustomerController extends Controller
{
    public function index()
    {
        $dataCustomer = Customer::where('id', Auth::user()->customer->id)->first();

        return view('frontend.profile.index', compact('dataCustomer'));
    }

    public function update(Request $request, $id)
    {
        // $validatedData = $request->validate([
        //     'image' => ['file', 'mimes:jpeg,jpg,png'],
        //     'nama_customer' => 'required|string',
        //     'no_telp' => 'required|numeric',
        // ]);

        if ($request->file('image')) {
            Storage::delete($request->oldFotoCustomer);
            $image = $request->file('image')->store('foto_customer');
        } else {
            $image = $request->oldFotoCustomer;
        }

        User::where('id', Auth::user()->id)->update([
            'name' => $request->name,
        ]);

        Customer::where('id', $id)->update([
            'nama_customer' => $request->name,
            'jenis_kelamin' => $request->jenis_kelamin,
            'no_telp' => $request->no_telp,
            'image' => $image
        ]);

        return redirect()->route('profil-customer.index');
    }

    public function updatePassword(Request $request, $id)
    {
        $request->validate([
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);

        User::where('id', $id)->update([
            'password' => Hash::make($request->password),
        ]);

        return redirect()->route('profil-customer.index');
    }
}
