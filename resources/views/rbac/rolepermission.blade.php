@extends('layouts.app')
@section('action')
<div class="toggle-wrap nk-block-tools-toggle">
    <a href="#" class="btn btn-icon btn-trigger toggle-expand mr-n1" data-target="pageMenu"><em class="icon ni ni-more-v"></em></a>
    <div class="toggle-expand-content" data-content="pageMenu">
        <ul class="nk-block-tools g-3">
            <li><a href="javascript:void(0)" id="btn-simpan" class="btn btn-primary"><em class="icon far fa-save"></em><span>Save</span></a></li>
        </ul>
    </div>
</div>
@endsection
@section('content')
<div id="{{$form_id}}" class="card card-full" style="min-height: 300px;">
        <div class="card-body">
            <div style="display:none" class="msg alert alert-primary alert-dismissible fade" role="alert">
                <div class="msg-data">Pilih role untuk setting role permission</div>
                <button class="close" data-hide="alert"></button>  
            </div>
            <form class="form-data">
                @csrf
                @method('POST')
                <div class="form-group">
                    <label class="form-label">Role Access</label>
                    <select id="role_" name="role_" class="form-control select2">
                        <option value=""></option>
                        @foreach ($roles as $role)
                            <option value="{{$role->role_id}}">{{$role->role_name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="grant-all-perm" value="1">
                        <label class="custom-control-label" for="grant-all-perm">Grant all Permission</label>
                    </div>
                </div>
                <div id="form-menu" class="row col-md-12">
                </div>
            </form>
        </div>
</div>
@endsection
@section('script')
<script>
$(document).ready(function(){
    $('#role_').change(function(){
        getRolePermission($(this).val());
    });

    $('#btn-simpan').click(function(){
        $("#{{$form_id}} .form-data").ajaxSubmit({
            url:"{{route('rolepermission.store')}}",
            data:{
                _token:"{{csrf_token()}}",
                _method:"POST",
            },
            type:"POST",
            dataType:"JSON",
            beforeSubmit:function(){
                block("#{{$form_id}}");
            },success:function(data){
                displayMsg("#{{$form_id}} .msg",data);
                unblock("#{{$form_id}}");
            },error:function(error){
                console.log(error.XMLHttpRequest);
                data = {success:2,msg:['Terjadi kesalahan sistem']};
                displayMsg("#{{$form_id}} .msg",data);
                unblock("#{{$form_id}}");
            }
        });
    });

    $('#grant-all-perm').change(function(){
        if($(this).prop('checked')){
            $('.custom-control-input').each(function(i, obj) {
                $(this).prop('checked',true);
            });
        }else{
            $('.custom-control-input').each(function(i, obj) {
                $(this).prop('checked',false);
            });
        }
    });
});

function getRolePermission(role_id){
    $.ajax({
        url:"{{url('rbac/rolepermission')}}/"+role_id,
        dataType:"JSON",
        beforeSend:function(){
            block("#{{$form_id}}");
        },success:function(data){
            $("#{{$form_id}} #form-menu").html(data.html);
            unblock("#{{$form_id}}");
        },error:function(error){
            unblock("#{{$form_id}}");
            console.log(error.XMLHttpRequest);
        }
    });
}

function displayMsg(content,data){
    $(content+' .msg-data').html("");
    $.each(data.msg,function(i,v){
        $(content+' .msg-data').append(v);
    });

    $(content).removeClass('alert-success alert-danger alert-primary alert-warning alert-info');
    if(data.success == 1){
        $(content).addClass('alert-success show');
    }else if(data.success == 0){
        $(content).addClass('alert-primary show');
    }else{
        $(content).addClass('alert-danger show');
    }
    $(content).css('display','block');
}
</script>
@endsection