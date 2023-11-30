<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bumdes extends Model
{
    use HasFactory;

    protected $table = 'bumdes';

    protected $fillable = [
        'nama_perusahaan',
        'email',
        'link_facebook',
        'link_instagram',
        'link_twitter',
        'no_telp',
        'logo',
    ];
}
