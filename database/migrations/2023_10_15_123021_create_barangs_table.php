<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('barangs', function (Blueprint $table) {
            $table->id();
            $table->string('kode_barang')->unique();
            $table->string('nama_barang')->unique();
            $table->integer('total_stok')->default(0);
            $table->integer('harga_jual');
            $table->integer('jumlah_terjual')->default(0);
            $table->string('keterangan')->nullable();
            $table->string('status')->nullable();
            $table->string('foto_barang')->nullable();
            $table->unsignedBigInteger('kategori_barang_id');
            $table->foreign('kategori_barang_id')->references('id')->on('kategori_barangs');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('barangs');
    }
};
