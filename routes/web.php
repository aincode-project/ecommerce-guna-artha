<?php

use App\Http\Controllers\AlamatCustomerController;
use App\Models\KategoriBarang;
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
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LaporanPenjualanController;
use App\Http\Controllers\LaporanStockOpnameController;
use App\Http\Controllers\PenjualanController;
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

Route::get('/', function () {
    return redirect()->route('home-user.index', 0);
})->name('landing-page');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::resource('/user', UserController::class);

Route::resource('/customer', CustomerController::class);

Route::resource('/pegawai', PegawaiController::class);

// Route::resource('/home-user', HomeUserController::class);
Route::get('/home-user/{id}', [HomeUserController::class, 'index'])->name('home-user.index');
Route::get('/detail-barang/{id}', [HomeUserController::class, 'show'])->name('home-user.show');

Route::resource('/barang', BarangController::class);
Route::get('/barang/tambah-stok/{id}', [BarangController::class, 'addStock'])->name('barang.addStock');
Route::put('/barang/tambah-stok/{id}', [BarangController::class, 'addStockStore'])->name('barang.addStockStore');
Route::get('/barang/hapus-stok/{id}', [BarangController::class, 'deleteStock'])->name('barang.deleteStock');
Route::put('/barang/hapus-stok/{id}', [BarangController::class, 'deleteStockStore'])->name('barang.deleteStockStore');

Route::resource('/bumdes', BumdesController::class);

// Route::resource('/kategori-barang', KategoriBarangController::class);
Route::get('/kategori-barang/{id}', [KategoriBarangController::class, 'index'])->name('kategori-barang.index');
Route::post('/kategori-barang', [KategoriBarangController::class, 'store'])->name('kategori-barang.store');
Route::put('/kategori-barang/{id}', [KategoriBarangController::class, 'update'])->name('kategori-barang.update');

Route::get('/profile/{id}', [ProfileController::class, 'index'])->name('profile.index');
Route::get('/profile/edit/{id}', [ProfileController::class, 'edit'])->name('profile.edit');
Route::put('/profile/{id}', [ProfileController::class, 'update'])->name('profile.update');

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

Route::resource('/pesanan', PesananController::class);
Route::put('/pesanan/kirim/{id}', [PesananController::class, 'kirimPesanan'])->name('pesanan.kirim');
Route::put('/pesanan/konfirmasi/{id}', [PesananController::class, 'konfirmasiPesanan'])->name('pesanan.konfirmasi');

Route::resource('/penjualan', PenjualanController::class);

Route::resource('/stock-opname', StockOpnameController::class);
Route::put('/stock-opname/updateStock/{id}', [StockOpnameController::class, 'updateStockBarang'])->name('stock-opname.updateStock');
Route::get('/get-monthly-sales-data', [HomeController::class, 'getMonthlySalesData']);

// Route::resource('/laporanPenjualan', LaporanPenjualanController::class);
Route::get('/laporanPenjualan/{id}', [LaporanPenjualanController::class, 'index'])->name('laporanPenjualan.index');
Route::post('/laporanPenjualan/{id}', [LaporanPenjualanController::class, 'index'])->name('laporanPenjualan.filter');
Route::post('/laporanPenjualan/detail/{id}', [LaporanPenjualanController::class, 'detail'])->name('laporanPenjualan.detail');

Route::get('/laporanStockOpname', [LaporanStockOpnameController::class, 'index'])->name('laporanStockOpname.index');
