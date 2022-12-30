<!DOCTYPE html>
<html lang="zxx" class="js">

<head>
    @include('templates.metadata')
</head>
<body class="nk-body bg-lighter ">
    <div class="nk-app-root">
        <!-- wrap @s -->
        <div class="nk-wrap ">
            <!-- main header @s -->
            @include('templates.navbar')
            <!-- main header @e -->
            <!-- content @s -->
            <div class="nk-content">
                <div class="container-fluid">
                    <div class="nk-content-inner">
                        <div class="nk-content-body">
                            <div class="nk-block-head nk-block-head-sm">
                                <div class="nk-block-between">
                                    <div class="nk-block-head-content">
                                        <h5 class="nk-block-title page-title">{{$title}}</h5>
                                        <div class="nk-block-des text-soft"><p>{{$desc}}</p>
                                        </div>
                                    </div><!-- .nk-block-head-content -->
                                    <div class="nk-block-head-content">
                                        @yield('action')
                                    </div><!-- .nk-block-head-content -->
                                </div><!-- .nk-block-between -->
                            </div>
                            <div class="nk-block">
                                @yield('content')
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content @e -->
            <!-- footer @s -->
            @include('templates.footer')
            <!-- footer @e -->
        </div>
        <!-- wrap @e -->
    </div>
    <!-- app-root @e -->
    @include('templates.metascript')
    @include('templates.script')
    @yield('script')
    <script>
    $(document).ready(function(){
        $('.dataTables_length select').addClass('select2');
        $('.dataTables_length select').removeClass('form-select form-select-sm');
        $('#{{@$table_id}}_filter input').unbind();
        $('#{{@$table_id}}_filter input').bind('keyup', function(e) {
            if(e.keyCode == 13) {
                table.search(this.value).draw();   
            }
        });
    });
    </script>
</body>

</html>