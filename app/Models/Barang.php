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

    public function scopeFilter($query, array $filters)
    {
        // if (isset($filters['search']) ? $filters['search'] : false) {
        //     return $query->where('nama_barang', 'like', '%' . $filters['search'] . '%');
        // }

        $query->when($filters['search'] ?? false, function($query, $search) {
            return $query->where('nama_barang', 'like', '%' . $search . '%');
        });

        $query->when($filters['category'] ?? false, function($query, $category) {
            return $query->whereHas('kategori_barang', function($query) use ($category) {
                $query->where('nama_kategori', $category);
            });
        });
    }

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
