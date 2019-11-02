<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cbuc个人博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
    <!-- 主css -->
    <link rel="stylesheet" href="/css/index/style.default.css" id="theme-stylesheet">
    <!-- layui -->
    <script src="/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
</head>
<body>
<header class="header">
    <!-- 导航栏 -->
    <nav class="navbar navbar-expand-lg" style="height: 64px">
        <div class="container">
            <div class="navbar-header ">
                <a href="/" class="navbar-brand icons"><i class="fa fa-soundcloud"></i> Cbuc Blog</a>
            </div>
            <div class="collapse navbar-collapse">
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
<div id="contact" class="text-center" style="height: 600px">
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
                            <input type="text" name="name" id="name" class="form-control " placeholder="Name" ">
                            <p class="help-block text-danger" id="Pname"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="email" name="email" id="email" class="form-control" placeholder="Email" required="required" onkeyup="verifyEmail()">
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
</body>
</html>