@extends('layouts.app')
@section('content')
<style>
.digit-group .input {
    width: 50px !important;
    height: 50px !important;
    line-height: 50px !important;
    text-align: center !important;
    font-size: 24px !important;
    font-weight: 700 !important;
    margin: 0 5px !important;
}
</style>
<div class="section-title">
    <h2>{{__('page.appointment.title')}}</h2>
    <p>{{__('page.appointment.desc')}}</p>
</div>
<div class="row">
    @if(!empty(session()->get('success')))
    <div class="section-title">
        <div class="alert alert-info" role="alert">
            {!!session()->get('success')!!}
        </div>
    </div>
    @endif
<form method="POST" action="{{ route('verify.otp') }}" class="digit-group"  data-group-name="digits" data-autosubmit="false" autocomplete="off">
    @csrf
    <div class="row mb-3 col-md-12 section-title">
        <div class="col-md-12 col-sm-12">
            <input id="user" type="hidden" name="user" value="{{Request::segment(3)}}">
            {{-- <input id="otp" type="text" class="form-control @error('otp') is-invalid @enderror" name="otp_token" required autocomplete="otp"> --}}
            <input type="text" id="digit-1" class="input" name="digit-1" data-next="digit-2" />
            <input type="text" id="digit-2" class="input" name="digit-2" data-next="digit-3" data-previous="digit-1" />
            <input type="text" id="digit-3" class="input" name="digit-3" data-next="digit-4" data-previous="digit-2" />
            <input type="text" id="digit-4" class="input" name="digit-4" data-next="digit-5" data-previous="digit-3" />
            <input type="text" id="digit-5" class="input @error('otp') is-invalid @enderror" name="digit-5" data-next="digit-5" data-previous="digit-4" />
            @error('otp')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
        </div>
    </div>
    <div class="row mb-0 section-title">
        <div class="col-md-12">
            @if (Route::has('password.otp'))
                <button type="submit" class="btn btn-primary">
                    {{ __('Verifikasi Akun') }}
                </button>
            @endif
        </div>
    </div>
</form>
<div class="row mb-0 section-title">
    <div class="col-md-12">
        @if (Route::has('request.otp'))
            <a class="btn btn-link" href="{{ route('request.otp',Request::segment(3)) }}">
                {{ __('Kirim ulang kode OTP') }}
            </a>
         @endif
    </div>
</div>
@endsection
@section('script')
<script>
    $(document).ready(function(){
        $('.digit-group').find('input').each(function() {
            $(this).attr('maxlength', 1);
            $(this).on('keyup', function(e) {
                var parent = $($(this).parent());
                
                if(e.keyCode === 8 || e.keyCode === 37) {
                    var prev = parent.find('input#' + $(this).data('previous'));
                    
                    if(prev.length) {
                        $(prev).select();
                    }
                } else if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) {
                    var next = parent.find('input#' + $(this).data('next'));
                    
                    if(next.length) {
                        $(next).select();
                    } else {
                        if(parent.data('autosubmit')) {
                            parent.submit();
                        }
                    }
                }
            });
        });
    });
</script>
@endsection
