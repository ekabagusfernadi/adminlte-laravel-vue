<?php

namespace App\Http\Controllers;

use App\Katalog;
use Illuminate\Http\Request;

class KatalogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("admin.katalog.tambah_katalog");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // validasi
        $this->validate($request, [
            "nama_katalog" => ["required"],
        ]);
        
        // insert
        // cara 1
        // Katalog::create($request->all());
        // cara 2
        $katalog = new Katalog;
        $katalog->nama = $request->nama_katalog;
        $katalog->save();

        return redirect("katalog");
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Katalog  $katalog
     * @return \Illuminate\Http\Response
     */
    public function show(Katalog $katalog)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Katalog  $katalog
     * @return \Illuminate\Http\Response
     */
    public function edit(Katalog $katalog)
    {
        return view("admin.katalog.ubah_katalog", compact("katalog"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Katalog  $katalog
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Katalog $katalog)
    {
        // $request = data baru
        // $katalog = data lama
        $this->validate($request, [
            "nama_katalog" => ["required"]
        ]);

        // update
        // $katalog->update($request->all());
        $katalog->update(["nama" => $request->nama_katalog]);
        return redirect("katalog");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Katalog  $katalog
     * @return \Illuminate\Http\Response
     */
    public function destroy(Katalog $katalog)
    {
        $katalog->delete();
        return redirect("katalog");
        // return $katalog;
    }
}
