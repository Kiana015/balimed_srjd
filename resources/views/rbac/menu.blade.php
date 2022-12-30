@extends('layouts.app')
@section('content')
<style>
#form-menu ul li {
    background-color: #e9ecef;
    line-height: 30px;
    margin: 5px;
    border-radius: 5px;
    padding-left: 15px;
    padding-bottom: 5px;
    padding-right: 5px;
}

#form-menu ul li li {
    background-color: #f8f9fa;
    padding-left: 20px;
    padding-bottom: 5px;
    line-height: 30px;
    margin-bottom: 5px;
}

#form-menu ul li span{
    margin-right: 10px;
    cursor: pointer;
}

#form-menu ul li span:hover{
    cursor: pointer;
    color: #448aff;
}

#form-menu ul li li span{
    margin-right: 10px;
    cursor: pointer;
}

#form-menu ul li li span:hover{
    cursor: pointer;
    color: #448aff;
}
</style>
<div id="{{$table_id}}" class="row g-gs">
    <div class="col-md-7" id="block">
        <div class="card card-full">
            <span href="javascript:void(0)" onclick="loadRbacMenu()" class="btn btn-white float-right" style="margin-top:10px"><em class="icon ti-reload"></em><span>Refresh</span></span>
            <div id="form-menu" class="card-body">
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div id="{{$form_id}}" class="card card-full" style="min-height:450px">
            <div class="card-inner border-bottom">
                <h6 class="card-title">Manajemen Menu</h6>
            </div>
            <div class="card-body">
                <div style="display:none" class="msg alert alert-success alert-dismissible fade" role="alert">
                    <div class="msg-data">You should check in on some of those fields below.</div>
                    <button class="close" data-hide="alert"></button>
                </div>
                <form class="form-data">
                <div class="form-group">
                    <label class="form-label">Nama Menu</label>
                    <input type="hidden" id="menu_id" name="menu_id" class="form-control" value="">
                    <input type="text" id="text" name="text" class="form-control" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Icon</label>
                    <select id="icon" name="icon" class="form-control">
                        @foreach ($icons as $icon)
                            <option value="{{$icon->value}}">{{$icon->text}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Deskripsi</label>
                    <input type="text" id="desc" name="desc" class="form-control" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Url</label>
                    <input type="text" id="link" name="link" class="form-control" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Route Name</label>
                    <input type="text" id="route_name" name="route_name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Parent Menu</label>
                    <select id="parent_id" name="parent_id" class="form-control select2">
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Posisi</label>
                    <input type="number" id="weight" name="weight" class="form-control">
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
function icon(item) {
  if (!item.id) {
    return item.text;
  }

  var img = $("<i>", {
    class: item.element.value,
  });
  var span = $("<span>", {
    text: " " + item.text
  });
  span.prepend(img);
  return span;
}
$(document).ready(function(){
    loadRbacMenu();
    getComboParent();
    
    validate = $("#{{$form_id}} .form-data").validate({
        rules: {
            text:"required",
            desc:"required",
            link:"required",
            route_name:"required",
        },
        messages: {
            text:"Nama Menu tidak boleh kosong",
            desc:"Deskripsi Menu tidak boleh kosong",
            link:"Url tidak boleh kosong",
            route_name:"Route name tidak boleh kosong",
        },
        submitHandler: function() {
            if($('#{{$form_id}} #menu_id').val() != ''){
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
        $("#{{$form_id}} #menu_id").val("");
        $("#{{$form_id}} #parent_id").val(0).trigger('change');
        validate.resetForm();
    });

    $("#icon").select2({
		/* minimumResultsForSearch: -1, */
		templateSelection: icon,
		templateResult: function(item) {
			return icon(item);
		}
	});
});

function loadRbacMenu(){
    $.ajax({
        url:"{{route('rbac.menu.load')}}",
        type:"GET",
        dataType:"JSON",
        beforeSend:function(){
            block('#block');
        },success:function(data){
            $('#form-menu').html(data.content);
            unblock('#block');
        }
    });
}

function getComboParent(selected){
    $.ajax({
        /* async:false, */
        url:"{{route('rbac.menu.parent')}}",
        type:"GET",
        dataType:"JSON",
        beforeSend:function(){
            block("#{{$form_id}}");
        },
        success:function(data){
            $('#parent_id').html(data.option);
            $('#parent_id').val(selected);
            $('#parent_id').trigger('change');
            unblock("#{{$form_id}}");
        }
    });
}

function storeData(){
    $("#{{$form_id}} .form-data").ajaxSubmit({
        // url:"{{route('menu.store')}}",
        url:"/rbac/menu",
        data:{
            _token:"{{csrf_token()}}",
        },
        type:"POST",
        dataType:"JSON",
        beforeSubmit:function(){
            block("#{{$form_id}}");
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
                $("#{{$form_id}} #menu_id").val(data.id);
                loadRbacMenu();
                $('#btn-batal').click();
            }else{
                $('#{{$form_id}} .msg').css('display','block');
                $('#{{$form_id}} .msg').addClass('alert-danger show');
            }
            unblock("#{{$form_id}}");
            getComboParent();
        },error:function(error){
            console.log(error.XMLHttpRequest);
            $('#{{$form_id}} .msg').css('display','block');
            $('#{{$form_id}} .msg').addClass('alert-danger show');
            unblock("#{{$form_id}}");
        }
    });
}

function showData(menu_id){
    $.ajax({
        url:"{{url('rbac/menu')}}/"+menu_id,
        beforeSend:function(){
            block("#{{$form_id}}");
        },
        success:function(data){
            getComboParent(data.parent_id);
            $('#{{$form_id}} #menu_id').val(data.id);
            $('#{{$form_id}} #text').val(data.text);
            $('#{{$form_id}} #icon').val(data.icon);
            $('#{{$form_id}} #icon').trigger('change');
            $('#{{$form_id}} #desc').val(data.desc);
            $('#{{$form_id}} #link').val(data.link);
            $('#{{$form_id}} #route_name').val(data.route_name);
            $('#{{$form_id}} #parent_id').val(data.parent_id);
            $('#{{$form_id}} #weight').val(data.weight);
            $('#{{$form_id}} #parent_id').trigger('change');
            unblock("#{{$form_id}}");
        },error:function(error){
            console.log(error.XMLHttpRequest);
            unblock("#{{$form_id}}");
        }
    });
}

function updateData(){
    $("#{{$form_id}} .form-data").ajaxSubmit({
        url:"{{url('rbac/menu')}}/"+$('#{{$form_id}} #menu_id').val(),
        data:{
            _method:"PUT",
            _token:"{{csrf_token()}}"
        },
        type:"PUT",
        dataType:"JSON",
        beforeSubmit:function(){
            block("#{{$form_id}}");
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
                $("#{{$form_id}} #menu_id").val(data.id);
                loadRbacMenu();
                $('#btn-batal').click();
            }else{
                $('#{{$form_id}} .msg').css('display','block');
                $('#{{$form_id}} .msg').addClass('alert-danger show');
            }
            getComboParent();
            unblock("#{{$form_id}}");
        },error:function(error){
            console.log(error.XMLHttpRequest);
            $('#{{$form_id}} .msg').css('display','block');
            $('#{{$form_id}} .msg').addClass('alert-danger show');
            unblock("#{{$form_id}}");
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
                url:"{{url('rbac/menu')}}/"+perm_id,
                data:{
                    _method:"DELETE",
                    _token:"{{csrf_token()}}"
                },
                type:"POST",
                dataType:"JSON",
                beforeSend:function(){
                    block("#{{$table_id}}");
                },
                success:function(data){
                    if(data.success == 1){
                        CustomSwal.fire('Sukses', data.msg, 'success');
                    }else{
                        CustomSwal.fire('Gagal', data.msg, 'error');
                    }
                    unblock("#{{$table_id}}");
                    loadRbacMenu();
                },
                error:function(error){
                    CustomSwal.fire('Gagal', 'terjadi kesalahan sistem', 'error');
                    console.log(error.XMLHttpRequest);
                    unblock("#{{$table_id}}");
                }
            });
        }
    });
}
</script>
@endsection