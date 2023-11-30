<?php

namespace App\Http\Controllers;

use App\Models\StockOpname;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf as PDF;

class LaporanStockOpnameController extends Controller
{
    public function index()
    {
        $dataOpnames = StockOpname::orderBy('tanggal_opname')->get();

        return view('backend.laporan-stock-opname.index', compact('dataOpnames'));
    }

    public function print()
    {
        $dataOpnames = StockOpname::orderBy('tanggal_opname')->get();

        // $pdf = PDF::make();
        $pdf = PDF::loadView('backend.laporan-stock-opname.print', compact('dataOpnames'));

        return $pdf->stream('laporan-stock-opname.pdf');
    }
}
