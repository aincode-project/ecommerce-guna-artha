<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockOpname extends Model
{
    use HasFactory;

    protected $table = 'stock_opnames';

    protected $fillable = [
        'pegawai_id',
        'tanggal_opname',
        'barang_selisih',
        'status_opname',
    ];

    public function pegawai(){
    	return $this->belongsTo('App\Models\Pegawai');
    }

    public function detail_stock_opname(){
    	return $this->hasMany('App\Models\DetailStockOpname');
    }
}
