<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>Document</title>
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <!-- layui -->
    <script src="/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
    <!--主css-->
    <link rel="stylesheet" type="text/css" href="/css/fore/main.css">
    <!--加载meta IE兼容文件-->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="header">
    <div class="menu-btn">
        <div class="menu"></div>
    </div>
    <h1 class="logo">
        <a href="index.html">
            <span>MYBLOG</span>
            <img src="../res/img/logo.png">
        </a>
    </h1>
    <div class="nav">
        <a href="index.html">文章</a>
        <a href="blinks.ftl">微语</a>
        <a href="contact.ftl">留言</a>
        <a href="album.ftl" class="active">相册</a>
        <a href="about.ftl">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="index.html">文章</a></li>
        <li class="layui-nav-item"><a href="blinks.ftl">微语</a></li>
        <li class="layui-nav-item"><a href="contact.ftl">留言</a></li>
        <li class="layui-nav-item"><a href="album.ftl" class="active">相册</a></li>
        <li class="layui-nav-item"><a href="about.ftl">关于</a></li>
    </ul>
    <#if Session["loginUser"]?exists>
        <p class="welcome-user">
            欢迎您: ${Session["loginUser"].userName}
        </p>
    <#else>
        <p class="welcome-text"></p>
    </#if>
</div>

<div class="album-content w1000" id="layer-photos-demo" class="layer-photos-demo">
    <div class="img-info">
        <img src="../res/img/xc_img1.jpg" alt="">
        <div class="title">
            <p class="data">今日上传<span>2018/10/10</span></p>
            <p class="text">观赏最美的土耳其的日</p>
        </div>
    </div>
    <div class="img-list">
        <div class="layui-fluid" style="padding:0">
            <div class="layui-row layui-col-space30 space">
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img3.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img4.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img5.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img3.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img4.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img5.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img3.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img4.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img5.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img3.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img4.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img5.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img3.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 layui-col-sm4 layui-col-md4">
                    <div class="item">
                        <img src="../res/img/xc_img4.jpg">
                        <div class="cont-text">
                            <div class="data">2018/08/08</div>
                            <p class="address"><i class="layui-icon layui-icon-location"></i><span>江西九江</span></p>
                            <p class="briefly">今日天气晴朗,庐山一日游</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="demo"></div>
    </div>
</div>


<div class="footer-wrap">
    <div class="footer w1000">
        <div class="qrcode">
            <img src="../res/img/erweima.jpg">
        </div>
        <div class="practice-mode">
            <img src="../res/img/down_img.jpg">
            <div class="text">
                <h4 class="title">我的联系方式</h4>
                <p>微信<span class="WeChat">1234567890</span></p>
                <p>手机<span class="iphone">1234567890</span></p>
                <p>邮箱<span class="email">1234567890@qq.com</span></p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../res/layui/layui.js"></script>
<script type="text/javascript">
    layui.config({
        base: '../res/js/util/'
    }).use(['element', 'laypage', 'form', 'layer' ], function () {
        element = layui.element, laypage = layui.laypage, form = layui.form, layer = layui.layer ;
        laypage.render({
            elem: 'demo'
            , count: 70 //数据总数，从服务端得到
        });
        layer.photos({
            photos: '#layer-photos-demo'
            , anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
            , tab: function (pic, layero) {
                console.log(pic, layero)
            }
        });
    })
</script>
</body>
</html>