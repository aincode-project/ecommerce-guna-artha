<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    use HasFactory;

    protected $table = 'pesanans';

    protected $fillable = [
        'customer_id',
        'pegawai_id',
        'tanggal_pesanan',
        'nama_penerima',
        'alamat',
        'no_telp',
        'keterangan_alamat',
        'total_pesanan',
        'status_pesanan',
    ];

    public function pegawai(){
    	return $this->belongsTo('App\Models\Pegawai');
    }

    public function customer(){
    	return $this->belongsTo('App\Models\Customer');
    }

    public function detail_pesanan(){
    	return $this->hasMany('App\Models\DetailPesanan');
    }
}
