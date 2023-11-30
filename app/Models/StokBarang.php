<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StokBarang extends Model
{
    use HasFactory;

    protected $table = 'stok_barangs';

    protected $fillable = [
        'tanggal_catat',
        'jumlah_stok',
        'barang_id',
        'keterangan',
    ];

    public function barang(){
    	return $this->belongsTo('App\Models\Barang');
    }
}
