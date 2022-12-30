@extends('layouts.app')
@section('content')
<div class="section-title">
    <h2>{{__('page.register.title')}}</h2>
    <p class="fst-italic">{{__('page.register.desc')}}</p>
</div>               
<form method="POST" action="{{ route('register') }}">
    @csrf
    <div class="row mb-3">
        <label for="name" class="col-md-4 col-form-label text-md-end">{{ __('Name') }}</label>
        <div class="col-md-6">
            <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>
            @error('name')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
        </div>
    </div>
    <div class="row mb-3">
        <label for="email" class="col-md-4 col-form-label text-md-end">{{ __('Email Address') }}</label>
        <div class="col-md-6">
            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">
            @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
        </div>
    </div>
    <div class="row mb-3">
        <label for="phone" class="col-md-4 col-form-label text-md-end">{{ __('No. HP') }}</label>
        <div class="col-md-6">
            <input id="phone" type="text" class="form-control @error('phone') is-invalid @enderror" name="phone" value="{{ old('phone') }}" required autocomplete="phone">
            @error('phone')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror
        </div>
    </div>
    <div class="row mb-0">
        <div class="col-md-8 offset-md-4">
            @if (Route::has('register'))
            <button type="submit" class="btn btn-primary" href="{{ route('register') }}">
                {{ __('Register') }}
            </button>
            @endif
            @if (Route::has('login'))
            <p style="margin-top:5%">Email / No. HP sudah terdaftar ? 
                <a class="btn btn-link" href="{{ route('login') }}">
                    {{ __('Login') }}
                </a>
            </p>
        @endif
        </div>
    </div>
</form>
@endsection
