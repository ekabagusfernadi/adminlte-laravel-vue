@extends('layouts.admin')

@section("title", "Katalog")
@section("header", "Katalog")
@section('content')

<div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <a href="{{ url('data/katalog/create') }}" class="btn btn-sm btn-primary pull-right">Tambah Katalog</a>
            </div>
            <div class="card-body p-0">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style="width: 10px;">No.</th>
                            <th>Nama Katalog</th>
                            <th class="text-right" style="padding-right: 65px;">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($data_katalog as $index => $value)
                            <tr>
                                <td>{{ ++$index }}.</td>
                                <td>{{ $value->nama }}</td>
                                <td class="text-right">
                                    <a href="{{ url('data/katalog/' . $value->id . '/edit') }}" class="btn btn-warning btn-sm">Ubah</a>
                                    
                                    <!-- <form action="{{ url('data/katalog' , ['id' => $value->id]) }}" method="POST" style="display: inline"> -->
                                    <form action="{{ url('data/katalog/' . $value->id) }}" method="POST" style="display: inline">
                                        <input type="submit" class="btn btn-danger btn-sm" value="Hapus" onclick="return confirm('Yakin kawan?');">
                                        @csrf
                                        @method("DELETE")
                                    </form>

                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

@endsection