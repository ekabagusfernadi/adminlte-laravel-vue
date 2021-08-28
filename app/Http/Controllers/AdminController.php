<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Anggota;
use App\Penerbit;
use App\Pengarang;
use App\Katalog;


class AdminController extends Controller
{
    public function dashboard()
    {    
        return view("admin.dashboard");
    }

    public function katalog()
    {
        $data_katalog = Katalog::all();
        return view("admin.katalog.katalog", compact("data_katalog"));
    }

    public function penerbit()
    {
        $data_penerbit = Penerbit::all();
        return view("admin.penerbit.penerbit", compact("data_penerbit"));
    }

    public function pengarang()
    {
        $data_pengarang = Pengarang::all();
        return view("admin.pengarang.pengarang", compact("data_pengarang"));
    }

    public function anggota()
    {
        return view("admin.anggota");
    }
    
}
