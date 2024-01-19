<div class="sidebar-wrapper" data-simplebar="true">
    <div class="sidebar-header">
        <div>
            <img src="{{ asset('storage/logo_bumdes/logo-2.jpg') }}" class="logo-icon" alt="logo icon">
        </div>
        <div>
            <h4 class="logo-text">BUMDes Guna Artha</h4>
        </div>
        <div class="toggle-icon ms-auto"><i class='bx bx-arrow-to-left'></i>
        </div>
    </div>
    <!--navigation-->
    <ul class="metismenu" id="menu">
        <a href="{{ route('home') }}">
            <div class="parent-icon"><i class='bx bx-home-circle'></i>
            </div>
            <div class="menu-title">Dashboard</div>
        </a>
        <li>
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class="bx bx-category"></i>
                </div>
                <div class="menu-title">Master Data</div>
            </a>
            <ul>
                <li> <a href="{{ route('customer.index') }}"><i class="bx bx-right-arrow-alt"></i>Data Customer</a>
                </li>
                @if (auth()->check() && auth()->user()->hak_akses == "Kepala BUMDes")
                <li> <a href="{{ route('pegawai.index') }}"><i class="bx bx-right-arrow-alt"></i>Data Pegawai</a>
                </li>
                <li> <a href="{{ route('user.index') }}"><i class="bx bx-right-arrow-alt"></i>Data User</a>
                </li>
                @endif
                <li> <a href="{{ route('kategori-barang.index', 0) }}"><i class="bx bx-right-arrow-alt"></i>Data Kategori Barang</a>
                </li>
                <li> <a href="{{ route('barang.index') }}"><i class="bx bx-right-arrow-alt"></i>Data Barang</a>
                </li>
                {{-- <li> <a href="{{ route('bumdes.index') }}"><i class="bx bx-right-arrow-alt"></i>Data BUMDes</a>
                </li> --}}
            </ul>
        </li>
        <li>
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class='bx bx-cart'></i>
                </div>
                <div class="menu-title">Transaksi Website</div>
            </a>
            <ul>
                <li> <a href="{{ route('pesanan.index') }}"><i class="bx bx-right-arrow-alt"></i>Pemesanan</a>
                </li>
                <li> <a href="{{ route('penjualan.index') }}"><i class="bx bx-right-arrow-alt"></i>Penjualan Website</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class='bx bx-cart'></i>
                </div>
                <div class="menu-title">Transaksi Toko</div>
            </a>
            <ul>
                <li> <a href="{{ route('kasir.index') }}"><i class="bx bx-right-arrow-alt"></i>Kasir</a>
                </li>
                <li> <a href="{{ route('penjualan-toko.index') }}"><i class="bx bx-right-arrow-alt"></i>Penjualan Toko</a>
                </li>
            </ul>
        </li>
        <a href="{{ route('stock-opname.index') }}">
            <div class="parent-icon"><i class="bx bx-folder"></i>
            </div>
            <div class="menu-title">Stock Opname</div>
        </a>
        <li>
            <a href="javascript:;" class="has-arrow">
                <div class="parent-icon"><i class="bx bx-line-chart"></i>
                </div>
                <div class="menu-title">Laporan</div>
            </a>
            <ul>
                <li> <a href="{{ route('laporanStockOpname.index') }}"><i class="bx bx-right-arrow-alt"></i>Laporan Stock Opname</a>
                </li>
                <li> <a href="{{ route('laporanPenjualan.index', 0) }}"><i class="bx bx-right-arrow-alt"></i>Laporan Penjualan</a>
                </li>
            </ul>
        </li>
    </ul>
    <!--end navigation-->
</div>
