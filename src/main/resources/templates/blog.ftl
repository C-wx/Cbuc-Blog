<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cbuc个人博客</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css">
    <!-- 主css -->
    <link rel="stylesheet" href="/css/index/style.default.css" id="theme-stylesheet">
    <!-- layui -->
    <script src="/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
</head>
<body>
<header class="header">
    <!-- 导航栏 -->
    <nav class="navbar navbar-expand-lg" style="height: 64px">
        <div class="container">
            <div class="navbar-header">
                <a href="/" class="navbar-brand icons"><i class="fa fa-soundcloud"></i> Cbuc Blog</a>
            </div>
            <!-- Navbar Menu -->
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="/" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item"><a href="/blog" class="nav-link active ">Blog</a>
                    </li>
                    <li class="nav-item"><a href="/contact" class="nav-link ">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="row">
        <!-- Latest Posts -->
        <main class="posts-listing col-lg-8">
            <div class="container">
                <div class="row">
                    <!-- post -->
                    <div class="post col-xl-6">
                        <div class="post-thumbnail">
                            <a href="post.ftl">
                                <img src="img/user.svg" alt="题图" >
                            </a>
                        </div>
                        <div class="post-details">
                            <a href="post.ftl">
                                <h3 class="h4">Alberto Savoia Can Teach You About Interior</h3></a>
                            <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                eiusmod tempor incididunt ut labore.</p>
                            <footer class="post-footer d-flex align-items-center">
                                <a href="#" class="d-flex align-items-center flex-wrap">
                                    <div class="title">
                                        <i class="fa fa-user"></i>
                                        John Doe
                                    </div>
                                </a>
                                <div class="date"><i class="fa fa-calendar"></i>20 May | 2016</div>
                                <div class="comments meta-last"><i class="fa fa-comments-o"></i>12</div>
                            </footer>
                        </div>
                    </div>
                    <!-- post -->
                    <div class="post col-xl-6">
                        <div class="post-thumbnail">
                            <a href="post.ftl">
                                <img src="img/user.svg" alt="题图" >
                            </a>
                        </div>
                        <div class="post-details">
                            <a href="post.ftl">
                                <h3 class="h4">Alberto Savoia Can Teach You About Interior</h3>
                            </a>
                            <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                eiusmod tempor incididunt ut labore.</p>
                            <div class="post-footer d-flex align-items-center">
                                <a href="#" class="d-flex align-items-center flex-wrap">
                                    <div class="title">
                                        <i class="fa fa-user"></i>
                                        John Doe
                                    </div>
                                </a>
                                <div class="date"><i class="fa fa-calendar"></i>20 May | 2016</div>
                                <div class="comments meta-last"><i class="fa fa-comments-o"></i>6</div>
                            </div>
                        </div>
                    </div>
                    <!-- 翻页 -->
                    <nav aria-label="Page navigation example" style="position: relative; left: 250px">
                        <ul class="pagination pagination-template d-flex justify-content-center">
                            <li class="page-item"><a href="#" class="page-link"> <i class="fa fa-angle-left"></i></a>
                            </li>
                            <li class="page-item"><a href="#" class="page-link active">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link"> <i class="fa fa-angle-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                </div>
        </main>
        <aside class="col-lg-4">
            <!-- 搜索栏-->
            <div class="widget search">
                <header>
                    <h3 class="h6">Search the blog</h3>
                </header>
                <form action="#" class="search-form">
                    <div class="form-group">
                        <input type="search" placeholder="What are you looking for?">
                        <button type="submit" class="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
            <!-- 最热博客 -->
            <div class="widget latest-posts">
                <header>
                    <h3 class="h6">Latest Posts</h3>
                </header>
                <div class="blog-posts">
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="img/user.svg" alt="..." class="img-fluid"></div>
                            <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                                <div class="d-flex align-items-center">
                                    <div class="views"><i class="fa fa-eye"></i> 500</div>
                                    <div class="comments"><i class="fa fa-comments-o"></i>12</div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="img/user.svg" alt="..." class="img-fluid"></div>
                            <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                                <div class="d-flex align-items-center">
                                    <div class="views"><i class="fa fa-eye"></i> 500</div>
                                    <div class="comments"><i class="fa fa-comments-o"></i>12</div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="item d-flex align-items-center">
                            <div class="image"><img src="img/user.svg" alt="..." class="img-fluid"></div>
                            <div class="title"><strong>Alberto Savoia Can Teach You About</strong>
                                <div class="d-flex align-items-center">
                                    <div class="views"><i class="fa fa-eye"></i> 500</div>
                                    <div class="comments"><i class="fa fa-comments-o"></i>12</div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <!-- 标签栏-->
            <div class="widget categories">
                <header>
                    <h3 class="h6">Categories</h3>
                </header>
                <div class="item d-flex justify-content-between"><a href="#">Growth</a><span>12</span></div>
                <div class="item d-flex justify-content-between"><a href="#">Local</a><span>25</span></div>
                <div class="item d-flex justify-content-between"><a href="#">Sales</a><span>8</span></div>
                <div class="item d-flex justify-content-between"><a href="#">Tips</a><span>17</span></div>
                <div class="item d-flex justify-content-between"><a href="#">Local</a><span>25</span></div>
            </div>
        </aside>
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