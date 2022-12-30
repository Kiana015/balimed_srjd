@extends('layouts.app')
@section('content')
<div class="row">
    <div class="col-md-7">
        <div class="card card-full">
            <div class="card-body table-responsive">
                <table id="{{$table_id}}" class="table small-table" style="width:100%">
                    <thead>
                        <th width="5%">No.</th>
                        <th width="40%">Role</th>
                        <th width="40%">Role Deskripsi</th>
                        <th width="10%">Aksi</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div id="{{$form_id}}" class="card card-full">
            <div class="card-inner border-bottom">
                <h6 class="card-title">Manajemen Role</h6>
            </div>
            <div class="card-body">
                <div style="display:none" class="msg alert alert-success alert-dismissible fade" role="alert">
                    <div class="msg-data">You should check in on some of those fields below.</div>
                    <button class="close" data-hide="alert"></button>   
                </div>
                <form class="form-data">
                    <div class="form-group">
                        <input type="hidden" id="role_id" name="role_id">
                        <label class="form-label">RBAC Role</label>
                        <input type="text" id="role_name" name="role_name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Role Deskripsi</label>
                        <input type="text" name="role_desc" id="role_desc" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="is_default" name="is_default" value="1">
                            <label class="custom-control-label" for="is_default">Set As Default Role</label>
                        </div>
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
@endsection
@section('script')
<script>
var table; var validate;
$(document).ready(function() {
    validate = $("#{{$form_id}} .form-data").validate({
        rules: {
            role_name: "required",
            role_desc: "required",
        },
        messages: {
            role_name: "Role tidak boleh kosong",
            role_desc: "Role Deskripsi tidak boleh kosong",
        },
        submitHandler: function() {
            if($('#role_id').val() != ''){
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
        $("#{{$form_id}} #role_id").val("");
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
            url: '{{url("rbac/role/listData")}}',
            type:"POST",
            data: function(params) {
                params._token = "{{ csrf_token() }}";
            }
        },
        columns: [
            { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },         
            {
                data: 'role_name',
                name: 'role_name',
                orderable: true,
                searchable: true,
                class: 'text-left'
            },
            {
                data: 'role_desc',
                name: 'role_desc',
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
});
function storeData(){
    $("#{{$form_id}} .form-data").ajaxSubmit({
        url:"{{route('role.store')}}",
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
                $("#{{$form_id}} #role_id").val(data.id);
                RefreshTable("{{$table_id}}",true);
                resetForm();
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
        url:"{{url('rbac/role')}}/"+perm_id,
        beforeSend:function(){
            block("#{{$form_id}} .card-body");
        },
        success:function(data){
            $('#{{$form_id}} #role_id').val(data.role_id);
            $('#{{$form_id}} #role_name').val(data.role_name);
            $('#{{$form_id}} #role_desc').val(data.role_desc);
            if(data.is_default == 1){
                $('#{{$form_id}} #is_default').prop('checked',true);
                $('#{{$form_id}} .custom-switch').addClass('checked');
            }else{
                $('#{{$form_id}} #is_default').prop('checked',false);
                $('#{{$form_id}} .custom-switch').removeClass('checked');
            }
            unblock("#{{$form_id}} .card-body");
        },error:function(error){
            console.log(error.XMLHttpRequest);
            unblock("#{{$form_id}} .card-body");
        }
    });
}

function updateData(){
    $("#{{$form_id}} .form-data").ajaxSubmit({
        url:"{{url('rbac/role')}}/"+$('#role_id').val(),
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
                $("#{{$form_id}} #role_id").val(data.id);
                RefreshTable("{{$table_id}}",false);
                resetForm();
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

function deleteData(role_id){
    CustomSwal.fire({
        icon:'question',
        text: 'Hapus Data Role ?',
        showCancelButton: true,
        confirmButtonText: 'Hapus',
        cancelButtonText: 'Batal',
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                url:"{{url('rbac/role')}}/"+role_id,
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

function resetForm(){
    $("#{{$form_id}} #role_id").val("");
    validate.resetForm();
}
</script>
@endsection