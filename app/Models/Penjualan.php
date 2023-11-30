<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penjualan extends Model
{
    use HasFactory;

    protected $table = 'penjualans';

    protected $fillable = [
        'customer_id',
        'pegawai_id',
        'tanggal_penjualan',
        'nama_penerima',
        'alamat',
        'no_telp',
        'keterangan_alamat',
        'total_penjualan',
    ];

    public function pegawai(){
    	return $this->belongsTo('App\Models\Pegawai');
    }

    public function customer(){
    	return $this->belongsTo('App\Models\Customer');
    }

    public function detail_penjualan(){
    	return $this->hasMany('App\Models\DetailPenjualan');
    }
}
