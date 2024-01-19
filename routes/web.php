<?php

use App\Http\Controllers\AlamatCustomerController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\BumdesController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\PegawaiController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\HomeUserController;
use App\Http\Controllers\KeranjangController;
use App\Http\Controllers\KategoriBarangController;
use App\Http\Controllers\DashboardCustomerController;
use App\Http\Controllers\DummyPenjualanTokoController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LaporanPenjualanController;
use App\Http\Controllers\LaporanStockOpnameController;
use App\Http\Controllers\PenjualanController;
use App\Http\Controllers\PenjualanTokoController;
use App\Http\Controllers\PesananController;
use App\Http\Controllers\ProfilCustomerController;
use App\Http\Controllers\StockOpnameController;
use App\Http\Controllers\TransaksiCustomerController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Test aja
Route::middleware('auth')->group(function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    Route::get('/barang/create', [BarangController::class, 'create'])->name('barang.create');

    Route::middleware(['is_customer'])->group(function () {
        Route::put('/keranjang', [KeranjangController::class, 'store'])->name('keranjang.store');
        Route::get('/keranjang', [KeranjangController::class, 'index'])->name('keranjang.index');
        Route::delete('/keranjang/{id}', [KeranjangController::class, 'destroy'])->name('keranjang.destroy');
        Route::delete('/keranjang/{id}/delete', [KeranjangController::class, 'destroyAll'])->name('keranjang.destroyAll');
        Route::put('/keranjang/{id}/update', [KeranjangController::class, 'updateJumlah'])->name('keranjang.updateJumlah');

        Route::get('/dahsboard-customer', [DashboardCustomerController::class, 'index'])->name('dashboard-customer.index');

        Route::get('/dashboard-customer/profile', [ProfilCustomerController::class, 'index'])->name('profil-customer.index');
        Route::put('/dashboard-customer/profile/{id}', [ProfilCustomerController::class, 'update'])->name('profil-customer.update');
        Route::put('/dashboard-customer/password/{id}', [ProfilCustomerController::class, 'updatePassword'])->name('profil-customer.updatePassword');

        Route::resource('/dashboard-customer/alamat-customer', AlamatCustomerController::class);

        Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
        Route::post('/checkout', [CheckoutController::class, 'checkout'])->name('checkout.checkout');
        Route::post('/checkout/add-new-address', [CheckoutController::class, 'addNewAddress'])->name('checkout.addNewAddress');

        Route::resource('dashboard-customer/transaksi', TransaksiCustomerController::class);
        Route::put('/dashboard-customer/transaksi/{id}/ubahJumlah', [TransaksiCustomerController::class, 'ubahJumlah'])->name('transaksi-customer.ubahJumlah');
        Route::delete('/dashboard-customer/transaksi/{id}/hapusPesanan', [TransaksiCustomerController::class, 'hapusPesanan'])->name('transaksi-customer.hapusPesanan');
        Route::put('/dashboard-customer/transaksi/{id}/cancelPesanan', [TransaksiCustomerController::class, 'cancelPesanan'])->name('transaksi-customer.cancelPesanan');
    });

    Route::middleware(['is_admin_kepala'])->group(function () {
        Route::get('/get-monthly-sales-data', [HomeController::class, 'getMonthlySalesData']);
        Route::get('/get-monthly-sales-data-toko', [HomeController::class, 'getMonthlySalesDataToko']);

        Route::resource('/customer', CustomerController::class);

        Route::get('/barang', [BarangController::class, 'index'])->name('barang.index');
        Route::get('/barang/{barang}', [BarangController::class, 'show'])->name('barang.show');


        Route::get('/kategori-barang/{id}', [KategoriBarangController::class, 'index'])->name('kategori-barang.index');

        Route::get('/profile/{id}', [ProfileController::class, 'index'])->name('profile.index');
        Route::get('/profile/edit/{id}', [ProfileController::class, 'edit'])->name('profile.edit');
        Route::put('/profile/{id}', [ProfileController::class, 'update'])->name('profile.update');

        Route::resource('/pesanan', PesananController::class)->only(['index', 'show']);

        Route::resource('/penjualan', PenjualanController::class);

        Route::resource('/stock-opname', StockOpnameController::class)->only(['index', 'show']);

        Route::get('/laporanPenjualan/{id}', [LaporanPenjualanController::class, 'index'])->name('laporanPenjualan.index');
        Route::post('/laporanPenjualan/{id}', [LaporanPenjualanController::class, 'index'])->name('laporanPenjualan.filter');
        Route::post('/laporanPenjualan/detail/{id}', [LaporanPenjualanController::class, 'detail'])->name('laporanPenjualan.detail');

        Route::get('/laporanStockOpname', [LaporanStockOpnameController::class, 'index'])->name('laporanStockOpname.index');

        Route::get('/penjualan-toko', [PenjualanTokoController::class, 'index'])->name('penjualan-toko.index');
        Route::get('/penjualan-toko/{id}', [PenjualanTokoController::class, 'show'])->name('penjualan-toko.show');
    });

    Route::middleware(['is_admin'])->group(function () {
        Route::put('/pesanan/kirim/{id}', [PesananController::class, 'kirimPesanan'])->name('pesanan.kirim');
        Route::put('/pesanan/proses/{id}', [PesananController::class, 'prosesPesanan'])->name('pesanan.proses');
        Route::put('/pesanan/konfirmasi/{id}', [PesananController::class, 'konfirmasiPesanan'])->name('pesanan.konfirmasi');

        Route::post('/barang', [BarangController::class, 'store'])->name('barang.store');
        Route::get('/barang/{barang}/edit', [BarangController::class, 'edit'])->name('barang.edit');
        Route::put('/barang/{barang}', [BarangController::class, 'update'])->name('barang.update');
        Route::delete('/barang/{barang}', [BarangController::class, 'destroy'])->name('barang.destroy');
        Route::get('/barang/tambah-stok/{id}', [BarangController::class, 'addStock'])->name('barang.addStock');
        Route::put('/barang/tambah-stok/{id}', [BarangController::class, 'addStockStore'])->name('barang.addStockStore');
        Route::get('/barang/hapus-stok/{id}', [BarangController::class, 'deleteStock'])->name('barang.deleteStock');
        Route::put('/barang/hapus-stok/{id}', [BarangController::class, 'deleteStockStore'])->name('barang.deleteStockStore');

        Route::post('/kategori-barang', [KategoriBarangController::class, 'store'])->name('kategori-barang.store');
        Route::put('/kategori-barang/{id}', [KategoriBarangController::class, 'update'])->name('kategori-barang.update');

        Route::resource('/stock-opname', StockOpnameController::class)->except(['index', 'show']);
        Route::put('/stock-opname/updateStock/{id}', [StockOpnameController::class, 'updateStockBarang'])->name('stock-opname.updateStock');

        Route::resource('/kasir', DummyPenjualanTokoController::class);
        Route::delete('/kasir', [DummyPenjualanTokoController::class, 'destroyAll'])->name('kasir.deleteAll');
        Route::post('/kasir/proses-transaksi', [DummyPenjualanTokoController::class, 'prosesTransaksi'])->name('kasir.prosesTransaksi');
    });

    Route::middleware(['is_kepala'])->group(function () {
        Route::resource('/pegawai', PegawaiController::class);

        Route::resource('/user', UserController::class);

        Route::get('/laporan-penjualan/print', [LaporanPenjualanController::class, 'print'])->name('laporanPenjualan.print');
        Route::get('/laporan-stock-opname/print', [LaporanStockOpnameController::class, 'print'])->name('laporanStockOpname.print');
    });
});

Route::get('/', function () {
    return redirect()->route('home-user.index', 0);
})->name('landing-page');

Auth::routes();

Route::get('/home-user/{id}', [HomeUserController::class, 'index'])->name('home-user.index');
Route::get('/detail-barang/{id}', [HomeUserController::class, 'show'])->name('home-user.show');

Route::resource('/bumdes', BumdesController::class);

// Route::resource('/barang', BarangController::class);

// Route::resource('/laporanPenjualan', LaporanPenjualanController::class);

