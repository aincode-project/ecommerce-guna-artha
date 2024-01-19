<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pegawai extends Model
{
    use HasFactory;

    protected $table = 'pegawais';

    protected $fillable = [
        'user_id',
        'nama_pegawai',
        'NIK',
        'alamat',
        'posisi',
        'email',
        'no_telp',
        'jenis_kelamin',
        'image',
    ];

    public function user()
    {
    	return $this->belongsTo('App\Models\User');
    }

    public function pesanan(){
    	return $this->hasMany('App\Models\Pesanan');
    }

    public function stock_opname(){
    	return $this->hasMany('App\Models\StockOpname');
    }

    public function penjualan_toko(){
    	return $this->hasMany('App\Models\PenjualanToko');
    }
}
