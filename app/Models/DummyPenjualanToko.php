<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DummyPenjualanToko extends Model
{
    use HasFactory;

    protected $table = 'dummy_penjualan_tokos';

    protected $fillable = [
        'barang_id',
        'jumlah',
        'subtotal'
    ];

    public function barang(){
    	return $this->belongsTo('App\Models\Barang');
    }
}
