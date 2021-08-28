@extends('layouts.admin')

@section("title", "Penerbit")
@section("header", "Penerbit")
@section('content')

@push("css")
<style>
    .pr-60px {
        padding-right: 60px !important;
    }
</style>
@endpush

<component id="controller">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <a href="" v-on:click.prevent="tambahData()" class="btn bn-sm btn-primary pull-right">Tambah Penerbit</a>
                </div>
                <div class="card-body p-0">
                    <table id="tableNich" class="table table-striped">
                        <thead>
                            <tr>
                                <th width="30px">No.</th>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>Telp</th>
                                <th>Alamat</th>
                                <th class="text-right pr-60px">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach( $data_penerbit as $index => $value )
                            <tr>
                                <td>{{ ++$index }}</td>
                                <td>{{ $value->nama_penerbit }}</td>
                                <td>{{ $value->email }}</td>
                                <td>{{ $value->telp }}</td>
                                <td>{{ $value->alamat }}</td>
                                <td class="text-right">
                                    <a href="" class="btn btn-warning btn-sm" v-on:click.prevent="ubahData({{ $value }})">Ubah</a>
                                    <a href="" v-on:click.prevent="hapusData({{ $value->id }})" class="btn btn-danger btn-sm">Hapus</a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- modal box -->
    <div class="modal fade" id="modal-nich">
        <div class="modal-dialog">
            <div class="modal-content">
                <form v-bind:action="actionUrl" method="POST" autocomplete="off">
                <input type="hidden" name="_method" value="PUT" v-if="editStatus">
                    <div class="modal-header">
                        <h4 class="modal-title" v-if="!editStatus">Tambah Penerbit</h4>
                        <h4 class="modal-title" v-if="editStatus">Ubah Penerbit</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        @csrf
                        <div class="form-group">
                            <label for="nama_penerbit">Nama Penerbit</label>
                            <input type="text" class="form-control" name="nama_penerbit" id="nama_penerbit" v-bind:value="dataPenerbit.nama_penerbit" required>
                            @error('nama_penerbit')
                                <p class="text-danger">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" id="email" v-bind:value="dataPenerbit.email" required>
                            @error('email')
                                <p class="text-danger">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="telp">Telepon</label>
                            <input type="text" class="form-control" name="telp" id="telp" v-bind:value="dataPenerbit.telp" required>
                            @error('telp')
                                <p class="text-danger">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="alamat">Alamat</label>
                            <input type="text" class="form-control" name="alamat" id="alamat" v-bind:value="dataPenerbit.alamat" required>
                            @error('alamat')
                                <p class="text-danger">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- akhir modal box -->
</component>

@endsection

@push("js")
<script>
    const controller = new Vue({
        el: "#controller",
        data: {
            editStatus: false,
            dataPenerbit: {},
            actionUrl: "",
        },
        methods: {
            tambahData: function() {
                this.editStatus = false;
                this.dataPenerbit = {};
                this.actionUrl = "{{ url('data/penerbit') }}";

                $("#modal-nich").modal();
               
            },
            ubahData: function(penerbit) {
                this.editStatus = true;
                this.dataPenerbit = penerbit;
                this.actionUrl = "{{ url('data/penerbit') }}" + "/" + penerbit.id;

                $("#modal-nich").modal();
            },
            hapusData: function(idPenerbit) {
                this.actionUrl = `{{ url('data/penerbit/${idPenerbit}') }}`
                if( confirm("Yakin kawan?") ) {
                    axios.post(this.actionUrl, {_method: "DELETE"})
                    .then( (respon) => location.reload() );
                }
            }
        }
    });
</script>
@endpush