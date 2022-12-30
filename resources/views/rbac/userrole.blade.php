@extends('layouts.app')
@section('content')
<div class="row g-gs">
    <div class="col-md-7">
        <div class="card card-full">
            <div class="card-body table-responsive">
                <table id="{{$table_id}}" class="table small-table" style="width:100%">
                    <thead>
                        <th width="5%">No.</th>
                        <th width="40%">User</th>
                        <th width="40%">Role</th>
                        <th width="10%">Aksi</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="{{$form_id}}" class="col-md-5">
        <div class="card card-full">
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
                        <input type="hidden" id="user_id" name="user_id">
                        <label class="form-label">Nama</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Email</label>
                        <input type="text" id="email" name="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Phone</label>
                        <input type="text" id="phone" name="phone" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Role Deskripsi</label>
                        <select name="roles[]" id="roles" class="form-control select2" required="" multiple="multiple">
                            <option value=""></option>
                            @foreach ($roles as $role)
                            <option value="{{$role->role_id}}">{{$role->role_name}}</option>                                                
                            @endforeach
                        </select>
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
<!-- Modal -->
<div class="modal fade" id="modal-change-pass" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal-change-pass">Change Password</h5>
                <a href="#" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <em class="icon ni ni-cross"></em>
                </a>
            </div>
            <div class="modal-body">
                <form id="form-pass">
                    <div class="form-group">
                    <input type="hidden" id="user_id" name="user_id" class="form-control">
                    <label class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                    <span class="form-bar"></span>
                </div>
                <div class="form-group">
                    <label class="form-label">Confirm Password</label>
                    <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" required>
                    <span class="form-bar"></span>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btn-save-pass" class="btn btn-primary btn-sm"><em class='icon fas fa-save'></em><span>Confirm</span></button>
                <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
@endsection
@section('script')
<script>
var table; var validate; var formpass;
$(document).ready(function(){
    validate = $("#{{$form_id}} .form-data").validate({
        rules: {
            name: "required",
            email: {
                required: true,
                /* email: true */
            },
            phone: "required",
            /* password: {
                required:true,
                minlength: 9,
            },
            confirm_password:{
                equalTo:"#password",
            }, */
            'roles[]':{
                required:true,
                minlength:1
            }
        },
        ignore: ':hidden:not(".select2")',
        messages: {
            role_name: "Role tidak boleh kosong",
            role_desc: "Role Deskripsi tidak boleh kosong",
        },
        submitHandler: function() {
            if($('#user_id').val() != ''){
                updateData();
            }else{
                storeData();
            }
        }
    });

    formpass = $("#form-pass").validate({
        rules: {
            password: {
                required:true,
                minlength: 9,
            },
            password_confirmation:{
                equalTo:"#password",
            }
        },
        messages: {
            role_name: "Password tidak boleh kosong",
            confirm_password: "Confirm password tidak sesuai",
        },
        submitHandler: function() {
            if($('#form-pass #user_id').val() != ''){
                updatePassword();
            }
        }
    });

    $('#btn-save-pass').click(function(e){
        e.preventDefault;
        $('#form-pass').submit();
    });

    $('#roles').change(function(){
        validate.form();
    })
    
    $('#btn-simpan').click(function(e){
        e.preventDefault;
        $('#{{$form_id}} .form-data').submit();
    });
    
    $('#btn-batal').click(function(e){
        e.preventDefault;
        $("#{{$form_id}} #user_id").val("");
        $("#roles").val([]);
        $('#roles').trigger('change');
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
            url: '{{url("rbac/userrole/listData")}}',
            type:"POST",
            data: function(params) {
                params._token = "{{ csrf_token() }}";
            }
        },
        columns: [
            { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },         
            {
                data: 'user',
                name: 'user',
                orderable: true,
                searchable: true,
                class: 'text-left'
            },
            {
                data: 'role_name',
                name: 'role_name',
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

function showData(user_id){
    var selectedValues = new Array();
    $.ajax({
        url:"{{url('rbac/userrole')}}/"+user_id,
        beforeSend:function(){
            block("#{{$form_id}} .card-body");
        },
        success:function(data){
            $('#{{$form_id}} #user_id').val(data.id);
            $('#{{$form_id}} #name').val(data.name);
            $('#{{$form_id}} #email').val(data.email);
            $('#{{$form_id}} #phone').val(data.phone);
            $.each(data.roles,function(i,v){
                selectedValues[i] = v.role_id;
            });
            $("#roles").val(selectedValues);
            $("#roles").trigger('change');
            unblock("#{{$form_id}} .card-body");
        },error:function(error){
            console.log(error.XMLHttpRequest);
            unblock("#{{$form_id}} .card-body");
        }
    });
}

function storeData(){
    $("#{{$form_id}} .form-data").ajaxSubmit({
        url:"{{url('rbac/userrole')}}",
        data:{
            _method:"POST",
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
                $("#{{$form_id}} #user_id").val(data.id);
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

function updateData(){
    $("#{{$form_id}} .form-data").ajaxSubmit({
        url:"{{url('rbac/userrole')}}/"+$('#user_id').val(),
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
                //$("#{{$form_id}} #role_id").val(data.id);
                RefreshTable("{{$table_id}}",false);
                //resetForm();
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

function deleteData(user){
    CustomSwal.fire({
        icon:'question',
        title: 'Hapus Data User',
        showCancelButton: true,
        confirmButtonText: 'Confirm',
        cancelButtonText: 'Cancel',
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                url:"{{url('rbac/userrole')}}/"+user,
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

function changePassword(user_id){
    $('#form-pass #user_id').val(user_id);
    $('#modal-change-pass').modal('show');
}

function updatePassword(){
    $("#form-pass").ajaxSubmit({
        url:"{{route('rbac.userrole.password')}}",
        data:{
            _token:"{{csrf_token()}}"
        },
        type:"POST",
        dataType:"JSON",
        beforeSubmit:function(){
            block('#modal-change-pass .modal-body');
        },
        success:function(data){
            var msg = '';
            $.each(data.msg,function(i,v){
                msg += v;
            });
            if(data.success == 1){
                CustomSwal.fire('Sukses', msg, 'success');
            }else{
                CustomSwal.fire('Gagal', msg, 'error');
            }
            RefreshTable("{{$table_id}}",false);
            unblock('#modal-change-pass .modal-body');
            $('#modal-change-pass').modal('hide');
        }
    });
}

function resetForm(){
    $("#{{$form_id}} #user_id").val("");
    $("#roles").val([]);
    $('#roles').trigger('change');
    validate.resetForm();
}
</script>
@endsection