<!DOCTYPE html>
<html lang="en">
<head>
    @include('templates.metadata')
</head>
<body themebg-pattern="theme1">
    <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <form class="md-float-material form-material" method="POST" action="{{ route('login') }}">
                        @csrf
                        <div class="text-center">
                            <img style="max-width:30%" src="{{asset('assets/img/logo-desc.png')}}" alt="logo.png">
                        </div>
                        <div class="auth-box card">
                            <div class="card-block">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h2 class="text-center">{{__('page.login.title')}}</h2>
                                        <p class="text-center">{{__('page.login.desc')}}</p>
                                    </div>
                                </div>
                                <div class="form-group form-primary">
                                    <input id="email" type="text" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autofocus>
                                    <span class="form-bar"></span>
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                    <label class="float-label">{{ __('page.login.username') }}</label>
                                </div>
                                <div class="form-group form-primary">
                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="otp">
                                    <span class="form-bar"></span>
                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                    <label class="float-label">{{ __('Password') }}</label>
                                </div>
                                <div class="row m-t-25 text-left">
                                    <div class="col-12">
                                        <div class="form-check checkbox-fade fade-in-primary d-">
                                            <input class="form-check-input" type="checkbox" {{ old('remember') ? 'checked' : '' }} id="remember" name="remember">
                                            <label class="form-check-label" for="remember">
                                                <span class="text-inverse">{{ __('Remember Me') }}</span>
                                            </label>
                                        </div>
                                        <div class="forgot-phone text-right f-right">
                                            @if (Route::has('password.request'))
                                            <a href="{{ route('password.request') }}" class="text-right f-w-600"> {{ __('Forgot Your Password?') }}</a>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12 d-grid gap-2">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">{{ __('Login') }}</button>
                                    </div>
                                </div>
                                <div class="row m-t-10">
                                    @if (Route::has('register'))
                                        <div style="margin-left: 5%">
                                            <a href="{{ route('register') }}" class="text-right f-w-600"><i class="fa fa-user"></i> {{ __('page.register.title') }}</a>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- end of form -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
@include('templates.script')
</body>

</html>
