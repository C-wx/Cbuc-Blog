<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cbuc个人博客</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom icon font-->
    <link rel="stylesheet" href="/css/index/fontastic.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- Fancybox-->
    <link rel="stylesheet" href="/vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="/css/index/style.default.css" id="theme-stylesheet">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<header class="header">
    <!-- Main Navbar-->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <div class="navbar-header d-flex align-items-center justify-content-between">
                <a href="index.ftl" class="navbar-brand">Cbuc Blog</a>
            </div>
            <!-- Navbar Menu -->
            <div id="navbarcollapse" class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="/" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item"><a href="/blog" class="nav-link ">Blog</a>
                    </li>
                    <li class="nav-item"><a href="/contact" class="nav-link active">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div id="contact" class="text-center" style="height: 795px">
    <div class="container" id="contactContainer">
        <div class="section-title center">
            <h2>LEAVE A MESSAGE</h2>
            <hr>
        </div>
        <div class="col-md-8" style="margin-left: 190px">
            <form name="sentMessage" id="contactForm" novalidate>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" id="name" class="form-control " placeholder="Name" ">
                            <p class="help-block text-danger" id="Pname"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="email" id="email" class="form-control" placeholder="Email" required="required">
                            <p class="help-block text-danger" id="Pemail"></p>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <textarea name="message" id="message" class="form-control" rows="4" placeholder="Message" required></textarea>
                    <p class="help-block text-danger" id="Pmessage"></p>
                </div>
                <div id="success"></div>
                <button type="button" class="btn btn-default btn-lg" id="submit">Submit</button>
            </form>
        </div>
    </div>
</div>
<!-- Page Footer-->
<footer class="main-footer text-center">
    <div class="container">
        <p>Copyright &copy; 2019 Cbuc.Blog</p>
    </div>
</footer>
<!-- JavaScript files-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/popper.js/umd/popper.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
<script src="/js/index/front.js"></script>
<script src="/js/index/contact.js"></script>
</body>
</html>