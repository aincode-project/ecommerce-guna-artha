<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;

    protected $table = 'barangs';

    protected $fillable = [
        'kode_barang',
        'nama_barang',
        'total_stok',
        'harga_jual',
        'jumlah_terjual',
        'keterangan',
        'status',
        'foto_barang',
        'kategori_barang_id',
    ];

    public function kategori_barang(){
    	return $this->belongsTo('App\Models\KategoriBarang');
    }

    public function stok_barang(){
    	return $this->hasMany('App\Models\StokBarang');
    }

    public function keranjang(){
    	return $this->hasMany('App\Models\Keranjang');
    }

    public function detail_stock_opname(){
    	return $this->hasMany('App\Models\DetailStockOpname');
    }
}
