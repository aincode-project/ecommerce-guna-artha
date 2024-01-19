<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailPenjualanToko extends Model
{
    use HasFactory;

    protected $table = 'detail_penjualan_tokos';

    protected $fillable = [
        'penjualan_toko_id',
        'barang_id',
        'jumlah',
        'subtotal'
    ];

    public function penjualan_toko(){
    	return $this->belongsTo('App\Models\PenjualanToko');
    }

    public function barang(){
    	return $this->belongsTo('App\Models\Barang');
    }
}
