<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailStockOpname extends Model
{
    use HasFactory;

    protected $table = 'detail_stock_opnames';

    protected $fillable = [
        'stock_opname_id',
        'barang_id',
        'stok_sistem',
        'stok_fisik',
        'selisih',
        'keterangan',
    ];

    public function barang(){
    	return $this->belongsTo('App\Models\Barang');
    }

    public function stock_opname(){
    	return $this->belongsTo('App\Models\StockOpname');
    }
}
