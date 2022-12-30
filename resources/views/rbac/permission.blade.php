@extends('layouts.app')
@section('content')
<div class="row">
    <div class="col-md-7">
        <div class="card card-full">
            <div class="card-body table-responsive">
                <table id="{{$table_id}}" class="small-table table" style="width:100%">
                    <thead>
                        <th width="5%">No.</th>
                        <th width="30%">Permission</th>
                        <th width="30%">Menu</th>
                        <th width="10%">Group</th>
                        <th width="10%">Aksi</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div id="{{$form_id}}" class="card card-full" style="min-height:450px">
            <div class="card-inner border-bottom">
                <h6 class="card-title">Manajemen Permission</h6>
            </div>
            <div class="card-body">
                <div style="display:none" class="msg alert alert-success alert-dismissible fade" role="alert">
                    <div class="msg-data">You should check in on some of those fields below.</div>
                        <button class="close" data-hide="alert"></button>
                </div>
                <form class="form-data">
                    <div class="form-group">
                        <label class="form-label">RBAC Menu</label>
                        <select type="text" id="menu_id" name="menu_id" class="form-control select2 mt-2">
                            <option value="0">-</option>
                            @foreach ($menus as $menu)
                            <option value="{{$menu->id}}"><i class="{{$menu->icon}}"></i>{{$menu->text}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="hidden" id="perm_id" name="perm_id" class="form-control" value="">
                        <label class="form-label">Nama Permission</label>
                        <input type="text" name="perm_desc" id="perm_desc" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Group Permission</label>
                        <input type="text" name="group" id="group" class="form-control" required="">
                    </div>
                    <div class="btn-group float-right">
                        <button type="button" id="btn-batal" class="btn btn-danger btn-sm float-right"><em class="icon fas fa-reply"></em><span>Reset</span></button>
                        <button type="button" id="btn-simpan" class="btn btn-primary btn-sm float-right"><em class="icon fas fa-save"></em><span>Save</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="card card-preview">
    
</div>
<div class="row">
    
</div>
@endsection
@section('script')
<script>
var table; var validate;
$(document).ready(function() {
    validate = $("#{{$form_id}} .form-data").validate({
        rules: {
            perm_desc: "required",
            group: "required",
        },
        messages: {
            perm_desc: "Nama Permission tidak boleh kosong",
            group: "Group Permission tidak boleh kosong",
        },
        submitHandler: function() {
            if($('#perm_id').val() != ''){
                updateData();
            }else{
                storeData();
            }
        }
    });
    
    $('#btn-simpan').click(function(e){
        e.preventDefault;
        $('#{{$form_id}} .form-data').submit();
    });
    
    $('#btn-batal').click(function(e){
        e.preventDefault;
        $("#{{$form_id}} #perm_id").val("");
        $("#{{$form_id}} #menu_id").val("").trigger('change');
        validate.resetForm();
    });
    
    table = $('#{{$table_id}}').DataTable({
        "language": {
            "lengthMenu": "_MENU_",
            /* 'loadingRecords': '&nbsp;',
            'processing': '<img src="{{asset('assets/img/loader-sm.gif')}}"/>' */
        },
        processing:true,
        autoWidth: true,
        ordering: true,
        serverSide: true,
        ajax: {
            url: '{{url("rbac/permission/listData")}}',
            type:"POST",
            data: function(params) {
                params._token = "{{ csrf_token() }}";
            }
        },
        columns: [
            { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },         
            {
                data: 'perm_desc',
                name: 'perm_desc',
                orderable: true,
                searchable: true,
                class: 'text-left'
            },
            {
                data: 'menu',
                name: 'menu',
                orderable: true,
                searchable: true,
                class: 'text-left'
            },
            {
                data: 'group',
                name: 'group',
                orderable: true,
                searchable: true,
                class: 'text-left'
            },
            {
                data: 'aksi',
                name: 'id',
                orderable: false,
                searchable: false,
                class: 'text-center'
            }
        ]
    });
    
    $("#{{$table_id}}").DataTable().processing(true);
    $('#{{$table_id}}_filter input').unbind();
    $('#{{$table_id}}_filter input').bind('keyup', function(e) {
        if(e.keyCode == 13) {
            table.search(this.value).draw();   
        }
    });

});
function storeData(){
    $("#{{$form_id}} .form-data").ajaxSubmit({
        url:"{{route('permission.store')}}",
        data:{
            _token:"{{csrf_token()}}"
        },
        type:"POST",
        dataType:"JSON",
        beforeSubmit:function(){
            block("#{{$form_id}} .card-body");
        },
        success:function(data){
            $('#{{$form_id}} .msg').removeClass('alert-success alert-danger');
            $("#{{$form_id}} .msg-data").html("");
            $.each(data.msg,function(i,v){
                $("#{{$form_id}} .msg-data").append(v);
            });
            if(data.success == 1){
                $('#{{$form_id}} .msg').css('display','block');
                $('#{{$form_id}} .msg').addClass('alert-success show');
                $("#{{$form_id}}#perm_id").val(data.id);
                RefreshTable("{{$table_id}}",true);
                $('#btn-batal').click();
            }else{
                $('#{{$form_id}} .msg').css('display','block');
                $('#{{$form_id}} .msg').addClass('alert-danger show');
            }
            unblock("#{{$form_id}} .card-body");
        },error:function(error){
            console.log(error.XMLHttpRequest);
            $('#{{$form_id}} .msg').css('display','block');
            $('#{{$form_id}} .msg').addClass('alert-danger show');
            unblock("#{{$form_id}} .card-body");
        }
    });
}

function showData(perm_id){
    $.ajax({
        url:"{{url('rbac/permission')}}/"+perm_id,
        beforeSend:function(){
            block("#{{$form_id}} .card-body");
        },
        success:function(data){
            $('#{{$form_id}} #perm_id').val(data.perm_id);
            $('#{{$form_id}} #menu_id').val(data.menu_id).trigger('change');
            $('#{{$form_id}} #perm_desc').val(data.perm_desc);
            $('#{{$form_id}} #group').val(data.group);
            unblock("#{{$form_id}} .card-body");
        },error:function(error){
            console.log(error.XMLHttpRequest);
            unblock("#{{$form_id}} .card-body");
        }
    });
}

function updateData(){
    $("#{{$form_id}} .form-data").ajaxSubmit({
        url:"{{url('rbac/permission')}}/"+$('#perm_id').val(),
        data:{
            _method:"PUT",
            _token:"{{csrf_token()}}"
        },
        type:"POST",
        dataType:"JSON",
        beforeSubmit:function(){
            block("#{{$form_id}} .card-body");
        },
        success:function(data){
            $('#{{$form_id}} .msg').removeClass('alert-success alert-danger');
            $("#{{$form_id}} .msg-data").html("");
            $.each(data.msg,function(i,v){
                $("#{{$form_id}} .msg-data").append(v);
            });
            if(data.success == 1){
                $('#{{$form_id}} .msg').css('display','block');
                $('#{{$form_id}} .msg').addClass('alert-success show');
                $("#{{$form_id}}#perm_id").val(data.id);
                RefreshTable("{{$table_id}}",false);
                $('#btn-batal').click();
            }else{
                $('#{{$form_id}} .msg').css('display','block');
                $('#{{$form_id}} .msg').addClass('alert-danger show');
            }
            unblock("#{{$form_id}} .card-body");
        },error:function(error){
            console.log(error.XMLHttpRequest);
            $('#{{$form_id}} .msg').css('display','block');
            $('#{{$form_id}} .msg').addClass('alert-danger show');
            unblock("#{{$form_id}} .card-body");
        }
    });
}

function deleteData(perm_id){
    CustomSwal.fire({
        icon:'question',
        text: 'Hapus Data Permission ?',
        showCancelButton: true,
        confirmButtonText: 'Hapus',
        cancelButtonText: 'Batal',
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                url:"{{url('rbac/permission')}}/"+perm_id,
                data:{
                    _method:"DELETE",
                    _token:"{{csrf_token()}}"
                },
                type:"POST",
                dataType:"JSON",
                beforeSend:function(){
                    $("#{{$table_id}}").DataTable().processing(true);
                },
                success:function(data){
                    if(data.success == 1){
                        CustomSwal.fire('Sukses', data.msg, 'success');
                    }else{
                        CustomSwal.fire('Gagal', data.msg, 'error');
                    }
                    RefreshTable("{{$table_id}}",false);
                },
                error:function(error){
                    CustomSwal.fire('Gagal', 'terjadi kesalahan sistem', 'error');
                    console.log(error.XMLHttpRequest);
                }
            });
        }
    });
}
</script>
@endsection