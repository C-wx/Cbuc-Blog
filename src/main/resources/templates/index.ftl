<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Magnum</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicons
        ================================================== -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">

    <!-- Stylesheet
        ================================================== -->
    <link rel="stylesheet" type="text/css"  href="css/index/style.css">
    <link rel="stylesheet" type="text/css" href="css/index/nivo-lightbox/nivo-lightbox.css">
    <link rel="stylesheet" type="text/css" href="css/index/nivo-lightbox/default.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/modernizr.custom.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via fiwle:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

<!-- Header -->
<header id="header">
    <div class="intro">
        <div class="container">
            <div class="row">
                <div class="intro-text">
                    <h1>Cbuc博客主页</h1>
                    <hr>
                    <strong style="font-size: 20px" id="time"></strong>
                    <br>
                    <a href="#about" class="btn btn-default btn-lg page-scroll">Learn More</a> </div>
            </div>
        </div>
    </div>
</header>
<!-- Navigation -->
<div id="nav">
    <nav class="navbar navbar-custom">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse"> <i class="fa fa-bars"></i> </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden"> <a href="#page-top"></a> </li>
                    <li> <a class="page-scroll" href="#about">关于</a> </li>
                    <li> <a class="page-scroll" href="#portfolio">博客</a> </li>
                    <li> <a class="page-scroll" href="#contact">Contact</a> </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<!-- About Section -->
<div id="about">
    <div class="container">
        <div class="section-title text-center center">
            <h2>About Me</h2>
            <hr>
        </div>
        <div class="row">
            <div class="col-md-12 text-center"><img src="img/109.jpg" class="img-responsive"></div>
            <div class="col-md-8 col-md-offset-2">
                <div class="about-text">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante facilisis bibendum dolor feugiat at. Duis sed dapibus leo nec ornare diam commodo nibh.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante facilisis bibendum dolor feugiat at. Duis sed dapibus leo nec ornare.</p>
                    <a href="#portfolio" class="btn btn-default btn-lg page-scroll">My Portfolio</a> </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Section -->
<div id="portfolio">
    <div class="container">
        <div class="section-title text-center center">
            <h2>Portfolio</h2>
            <hr>
        </div>
        <div class="categories">
            <ul class="cat">
                <li>
                    <ol class="type">
                        <li><a href="#" data-filter="*" class="active">All</a></li>
                        <li><a href="#" data-filter=".graphic">Graphic Design</a></li>
                        <li><a href="#" data-filter=".illustration">Illustration</a></li>
                        <li><a href="#" data-filter=".photography">Photography</a></li>
                    </ol>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="row">
            <div class="portfolio-items">
                <div class="col-sm-6 col-md-3 col-lg-3 graphic">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/01-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/01-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 illustration">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/02-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/02-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 graphic">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/03-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/03-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 graphic">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/04-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/04-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 illustration">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/05-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/05-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 photography">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/06-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/06-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 photography">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/07-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/07-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 graphic">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/08-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/08-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 illustration">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/09-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/09-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 photography">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/10-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/10-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 photography">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/11-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/11-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3 graphic">
                    <div class="portfolio-item">
                        <div class="hover-bg"> <a href="img/portfolio/12-large.jpg" title="Project Title" data-lightbox-gallery="gallery1">
                            <div class="hover-text">
                                <h4>Project Title</h4>
                            </div>
                            <img src="img/portfolio/12-small.jpg" class="img-responsive" alt="Project Title"> </a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
<!-- Contact Section -->
<div id="contact" class="text-center">
    <div class="container">
        <div class="section-title center">
            <h2>Get In Touch</h2>
            <hr>
        </div>
        <div class="col-md-8 col-md-offset-2">
            <form name="sentMessage" id="contactForm" novalidate>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" id="name" class="form-control" placeholder="Name" required="required">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="email" id="email" class="form-control" placeholder="Email" required="required">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <textarea name="message" id="message" class="form-control" rows="4" placeholder="Message" required></textarea>
                    <p class="help-block text-danger"></p>
                </div>
                <div id="success"></div>
                <button type="submit" class="btn btn-default btn-lg">Send Message</button>
            </form>
            <div class="social">
                <ul>
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                    <li><a href="#"><i class="fa fa-behance"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="footer">
    <div class="container text-center">
        <div class="fnav">
            <p>Copyright &copy; 2016 Magnum. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/index/SmoothScroll.js"></script>
<script type="text/javascript" src="js/index/nivo-lightbox.js"></script>
<script type="text/javascript" src="js/jquery.isotope.js"></script>
<script type="text/javascript" src="js/jqBootstrapValidation.js"></script>
<script type="text/javascript" src="js/index/contact_me.js"></script>
<script type="text/javascript" src="js/index/main.js"></script>
</body>
</html>