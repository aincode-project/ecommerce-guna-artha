<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailPenjualan extends Model
{
    use HasFactory;

    protected $table = 'detail_penjualans';

    protected $fillable = [
        'penjualan_id',
        'barang_id',
        'harga_barang',
        'jumlah',
    ];

    public function barang(){
    	return $this->belongsTo('App\Models\Barang');
    }

    public function penjualan(){
    	return $this->belongsTo('App\Models\Penjualan');
    }
}
