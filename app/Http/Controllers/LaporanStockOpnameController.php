<?php

namespace App\Http\Controllers;

use App\Models\StockOpname;
use Illuminate\Http\Request;

class LaporanStockOpnameController extends Controller
{
    public function index()
    {
        $dataOpnames = StockOpname::orderBy('tanggal_opname')->get();

        return view('backend.laporan-stock-opname.index', compact('dataOpnames'));
    }
}
