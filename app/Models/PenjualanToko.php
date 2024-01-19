<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenjualanToko extends Model
{
    use HasFactory;

    protected $table = 'penjualan_tokos';

    protected $fillable = [
        'pegawai_id',
        'total_penjualan'
    ];

    public function pegawai(){
    	return $this->belongsTo('App\Models\Pegawai');
    }

    public function detail_penjulan_toko(){
    	return $this->hasMany('App\Models\DetailPenjualanToko');
    }
}
