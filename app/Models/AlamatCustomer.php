<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlamatCustomer extends Model
{
    use HasFactory;

    protected $table = 'alamat_customers';

    protected $fillable = [
        'nama_penerima',
        'alamat',
        'no_telp',
        'keterangan',
        'tipe_alamat',
        'customer_id',
    ];

    public function customer(){
    	return $this->belongsTo('App\Models\Customer');
    }
}
