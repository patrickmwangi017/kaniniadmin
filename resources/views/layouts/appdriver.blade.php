<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Kanini Haraka Enterprises</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <script src="{{ asset('js/everythingSangitLesuJS.js')}}"></script>
    <!-- <script src="js/everythingSangitLesuJS.js"></script> -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('styleResource/bower_components/font-awesome/css/font-awesome.min.css')}}">
    <!-- <link href="styleResource/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet"> -->
    <!-- Ionicons -->
    <link rel="stylesheet" href="{{ asset('styleResource/bower_components/Ionicons/css/ionicons.min.css')}}">
    <!-- <link href="styleResource/bower_components/Ionicons/css/ionicons.min.css" rel="stylesheet"> -->
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('css/everythingSangitCSS.css')}}">
    <!-- <link href="css/everythingSangitCSS.css" rel="stylesheet"> -->


    <style>
        #snackbar {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: green;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 15px;
        }

        #snackbar.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        @-webkit-keyframesfadein {
            from {
                bottom: 0;
                opacity: 0;
            }
            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframesfadein {
            from {
                bottom: 0;
                opacity: 0;
            }
            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @-webkit-keyframesfadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }
            to {
                bottom: 0;
                opacity: 0;
            }
        }

        @keyframesfadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }
            to {
                bottom: 0;
                opacity: 0;
            }
        }

        .spinner {
            width: 55px;
            height: 55px;

            z-index: 9999;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            position: fixed;
            display: block;
            margin: auto;
        }

        .double-bounce1,
        .double-bounce2 {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background-color: darkred;
            opacity: 0.6;
            position: absolute;
            top: 0;
            left: 0;

            -webkit-animation: sk-bounce 2.0s infinite ease-in-out;
            animation: sk-bounce 2.0s infinite ease-in-out;
        }

        .double-bounce2 {

            background-color: #0b3e6f;

        }

        .double-bounce2 {
            -webkit-animation-delay: -1.0s;
            animation-delay: -1.0s;
        }

        @-webkit-keyframessk-bounce {
            0%,
            100% {
                -webkit-transform: scale(0.0)
            }
            50% {
                -webkit-transform: scale(1.0)
            }
        }

        @keyframessk-bounce {
            0%,
            100% {
                transform: scale(0.0);
                -webkit-transform: scale(0.0);
            }
            50% {
                transform: scale(1.0);
                -webkit-transform: scale(1.0);
            }
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 54px;
            height: 27px;
        }

        .switch input {
            display: none;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 20px;
            width: 20px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked+.slider {
            background-color: green;
        }

        input:focus+.slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked+.slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */

        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
    </style>

    <!-- Google Font -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="/" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                {{-- <span class="logo-mini"><img src="#" width="50px" height="40px"></span> --}}

                @if (Auth::guest())
           <!-- logo for regular state and mobile devices -->
           <span class="logo-lg">Welcome to Steso Concrete Company mobile app</b></span>
           @else
                 <!-- logo for regular state and mobile devices -->
           <span class="logo-lg">Welcome Dear Driver</b></span>
           @endif
                <!-- <span class="logo-lg">WELCOME</b></span> -->
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            @if (Auth::guest())
           
            @else
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">


                        <li class="dropdown user user-menu">

                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-user-circle-o"> {{ Auth::user()->name }}</i></a>

                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="employee_images/photo_default_emplyee1.png" class="img-circle" alt="User Image">

                                    <p>
                                    {{ Auth::user()->name }}
                                        <small>Customer</small>
                                    </p>
                                </li>
                                <!-- Menu Body -->
                                <li class="user-body">

                                    <!-- /.row -->
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">

                                    <div class="pull-right">
                                        {{-- <a href="{{URL::to('/logout')}}" class="btn btn-default btn-flat">Sign out</a> --}}
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                @endif
            </nav>
        </header>
        @if (Auth::guest())
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="employee_images/photo_default_emplyee1.png" class="img-circle" alt="User Image">
                    </div>
                    <!-- <div class="pull-left info">
                        <p>Stock</p>
                        <small>Demo</small>

                    </div> -->
                </div>
               
                <ul class="sidebar-menu" data-widget="tree">
                <li>
                        <a href="{{URL::to('servicesindex')}}">
                        <i class="fa fa-tint"></i>
                        <span>Services</span>
                        <span class="pull-right-container">
                        </span>
                    </a>
                    </li>
                    <li>
                        <a href="{{URL::to('/')}}">
                        <i class="fa fa-tint"></i>
                        <span>Products</span>
                        <span class="pull-right-container">
                        </span>
                    </a>
                    </li>
                    <li class="treeview">
                        <a href="#">
                        <i class="fa fa-files-o"></i>
                        <span>Sign In</span>
                        <span class="pull-right-container">
                        </span>
                    </a>
                        <ul class="treeview-menu">
                            <li><a href="{{URL::to('user/signin')}}"><i class="fa fa-clone"></i> Customer Signin</a></li>
                            <li><a href="{{URL::to('drivers')}}"><i class="fa fa-clone"></i> Driver Signin</a></li>
                            <li><a href="{{URL::to('accountants')}}"><i class="fa fa-clone"></i> Accountant Signin</a></li>
                            <li><a href="{{URL::to('masons')}}"><i class="fa fa-clone"></i> Mason Signin</a></li>
                            <li><a href="{{URL::to('ordermanager')}}"><i class="fa fa-clone"></i> Order Manager Signin</a></li>
                            <li><a href="{{URL::to('shipmentmanager')}}"><i class="fa fa-clone"></i> Shipment Manager Signin</a></li>
                            <li><a href="{{URL::to('stockmanager')}}"><i class="fa fa-clone"></i> Stock Manager Signin</a></li>
                            <!-- <li><a href="{{URL::to('/stock-manage')}}"><i class="fa fa-leaf"></i> Manage stock</a></li> -->
                        </ul>
                    </li>
</ul>

<!-- <li> <a href="{{ route('user.signin')}}">Sign In as Customer</a></li>
                            <li> <a href="{{ route('drivers.login')}}">Sign In as Driver</a></li>
                            <li> <a href="{{ route('accountants.login')}}">Sign In as Accountant</a></li>
                            <li> <a href="{{ route('masons.login')}}">Sign In as Mason</a></li> -->
@else
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="employee_images/photo_default_emplyee1.png" class="img-circle" alt="User Image">
                    </div>
                    <!-- <div class="pull-left info">
                        <p>Stock</p>
                        <small>Demo</small>

                    </div> -->
                </div>
<ul class="sidebar-menu" data-widget="tree">
                <!-- <li>
                        <a href="{{URL::to('shop.servicesindex')}}">
                        <i class="fa fa-tint"></i>
                        <span>Services</span>
                        <span class="pull-right-container">
                        </span>
                    </a>
                    </li>
                    <li>
                        <a href="{{URL::to('product.index')}}">
                        <i class="fa fa-tint"></i>
                        <span>Products</span>
                        <span class="pull-right-container">
                        </span>
                    </a>
                    </li> -->
                    <li class="treeview">
                        <a href="#">
                        <i class="fa fa-files-o"></i>
                        <span>My Profile</span>
                        <span class="pull-right-container">
                        </span>
                    </a>
                        <ul class="treeview-menu">
                            <li><a href="{{URL::to('driverprofile')}}"><i class="fa fa-clone"></i> Update Profile</a></li>
                            <!-- <li><a href="{{URL::to('/stock-manage')}}"><i class="fa fa-leaf"></i> Manage stock</a></li> -->
                        </ul>
                    </li>

                   
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-tint"></i>
                            <span>Shipments</span>
                            <span class="pull-right-container">
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="{{URL::to('drivers/home')}}"><i class="fa fa-clone"></i> Allocated Shipments</a></li>
                            <li><a href="{{URL::to('drivers/pending')}}"><i class="fa fa-money"></i> Pending Shipments</a></li>
                            <li><a href="{{URL::to('drivers/delivered')}}"><i class="fa fa-money"></i> Delivered Shipments</a></li>
                            <li><a href="{{URL::to('drivers/confirmed')}}"><i class="fa fa-money"></i> Confirmed Deliveries</a></li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="{{URL::to('driverslogout')}}">
                        <i class="fa fa-sign-out"></i>
                        <span>Logout</span>
                        <span class="pull-right-container">
                        </span>
                    </a>
                    </li>
                </ul>

@endif
            </section>
            <!-- /.sidebar -->
        </aside>
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">

                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">{{Request::path()}}</li>

                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
                <br> @yield('content')
            </section>
            <!-- /.content -->
            <div id="snackbar">Data updated successfully.</div>

        </div>



        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0 Beta
            </div>
        </footer>

        <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->



    <script>
        $(function() {
            dinamicMenu();

            $(".spinner").css("display", "none");

        });

        $(document).ready(function() {
            $(document).ajaxStart(function() {
                $(".spinner").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $(".spinner").css("display", "none");
            });

        });

        function showSnakBar() {
            var x = document.getElementById("snackbar")
            x.className = "show";
            setTimeout(function() {
                x.className = x.className.replace("show", "");
            }, 3000);
        }

        function dinamicMenu() {
            var url = window.location;

            $('ul.sidebar-menu a').filter(function() {
                return this.href == url;
            }).parent().addClass('active');

            // Will only work if string in href matches with location
            $('.treeview-menu li a[href="' + url + '"]').parent().addClass('active');
            // Will also work for relative and absolute hrefs
            $('.treeview-menu li a').filter(function() {
                return this.href == url;
            }).parent().parent().parent().addClass('active');
        };
    </script>
</body>

</html>
