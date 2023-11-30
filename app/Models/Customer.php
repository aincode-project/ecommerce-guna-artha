<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    protected $table = 'customers';

    protected $fillable = [
        'user_id',
        'nama_customer',
        'email',
        'no_telp',
        'jenis_kelamin',
        'image',
    ];

    public function user()
    {
    	return $this->belongsTo('App\Models\User');
    }

    public function keranjang(){
    	return $this->hasMany('App\Models\Keranjang');
    }

    public function alamat(){
    	return $this->hasMany('App\Models\AlamatCustomer');
    }

    public function pesanan(){
    	return $this->hasMany('App\Models\Pesanan');
    }
}
