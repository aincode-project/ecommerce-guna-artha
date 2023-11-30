<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailPesanan extends Model
{
    use HasFactory;

    protected $table = 'detail_pesanans';

    protected $fillable = [
        'pesanan_id',
        'barang_id',
        'harga_barang',
        'jumlah',
    ];

    public function barang(){
    	return $this->belongsTo('App\Models\Barang');
    }

    public function pesanan(){
    	return $this->belongsTo('App\Models\Pesanan');
    }
}
