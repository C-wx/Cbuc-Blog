<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>Document</title>
    <!--jquery-->
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="/js/fore/menu.js"></script>
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
    <h1 class="logo" style="font-size: 4.5rem;">
        <a href="/">
            <span>MYBLOG</span>
            <img src="/img/logo.png">
        </a>
    </h1>
    <div class="nav">
        <a href="/">首页</a>
        <a href="/blog">博客</a>
        <a href="/contact">留言</a>
        <a href="/blinks" class="active">Blink</a>
        <a href="/bulletin">公告</a>
        <a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="/">首页</a></li>
        <li class="layui-nav-item"><a href="/blog">博客</a></li>
        <li class="layui-nav-item"><a href="/contact">留言</a></li>
        <li class="layui-nav-item"><a href="/blinks" class="active">Blink</a></li>
        <li class="layui-nav-item"><a href="/bulletin">公告</a></li>
        <li class="layui-nav-item"><a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">关于</a>
        </li>
    </ul>
    <p class="access-count"><span class="text">访问量:</span><span
            class="count"><#if Session["accessCount"]?exists> ${Session["accessCount"]}</#if></span></p>
    <p class="blog-count"><span class="text">博文量:</span><span
            class="count"><#if Session["blogCount"]?exists> ${Session["blogCount"]}</#if></span></p>
    <p class="welcome-text"></p>
</div>


<div class="content whisper-content">
    <div class="cont">
        <div class="whisper-list">
            <div class="item-box">
                <div class="item">
                    <div class="whisper-title">
                        <i class="layui-icon layui-icon-date"></i><span class="hour">12:25</span><span class="date">2018/06/08</span>
                    </div>
                    <p class="text-cont">
                        一直听说牛油果吃起来像肥皂、肥肉，虽然很难吃，但是价格却很贵，我还是想尝试一下。今天公司新到了新西兰牛油果，这是新西兰牛油果是第一次在中国上市，个头比普通牛油果大了一倍，被誉为“超牛果”。好奇心驱使我尝了一颗，第一次吃牛油果没有见识，切开牛油果费了好大劲，切成了这样。
                    </p>
                    <div class="img-box">
                        <img src="img/wy_img1.jpg">
                    </div>
                    <div class="op-list">
                        <p class="like"><i class="layui-icon layui-icon-praise"></i><span>1200</span></p>
                        <p class="edit"><i class="layui-icon layui-icon-reply-fill"></i><span>1200</span></p>
                        <p class="off"><span>展开</span><i class="layui-icon layui-icon-down"></i></p>
                    </div>
                </div>
                <div class="review-version layui-hide">
                    <div class="form">
                        <img src="img/header2.png">
                        <form class="layui-form" action="">
                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea name="desc" class="layui-textarea"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="text-align: right;">
                                    <button class="layui-btn definite layui-anim layui-anim-up">確定</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="item-box">
                <div class="item">
                    <div class="whisper-title">
                        <i class="layui-icon layui-icon-date"></i><span class="hour">12:25</span><span class="date">2018/06/08</span>
                    </div>
                    <p class="text-cont">
                        一直听说牛油果吃起来像肥皂、肥肉，虽然很难吃，但是价格却很贵，我还是想尝试一下。今天公司新到了新西兰牛油果，这是新西兰牛油果是第一次在中国上市，个头比普通牛油果大了一倍，被誉为“超牛果”。好奇心驱使我尝了一颗，第一次吃牛油果没有见识，切开牛油果费了好大劲，切成了这样。
                    </p>
                    <div class="img-box">
                        <img src="img/wy_img2.jpg">
                        <img src="img/wy_img3.jpg">
                        <img src="img/wy_img4.jpg">
                    </div>
                    <div class="op-list">
                        <p class="like"><i class="layui-icon layui-icon-praise"></i><span>1200</span></p>
                        <p class="edit"><i class="layui-icon layui-icon-reply-fill"></i><span>1200</span></p>
                        <p class="off"><span>展开</span><i class="layui-icon layui-icon-down"></i></p>
                    </div>
                </div>
                <div class="review-version layui-hide">
                    <div class="form">
                        <img src="img/header2.png">
                        <form class="layui-form" action="">
                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea name="desc" class="layui-textarea"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="text-align: right;">
                                    <button class="layui-btn definite">確定</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="item-box">
                <div class="item">
                    <div class="whisper-title">
                        <i class="layui-icon layui-icon-date"></i><span class="hour">12:25</span><span class="date">2018/06/08</span>
                    </div>
                    <p class="text-cont">
                        一直听说牛油果吃起来像肥皂、肥肉，虽然很难吃，但是价格却很贵，我还是想尝试一下。今天公司新到了新西兰牛油果，这是新西兰牛油果是第一次在中国上市，个头比普通牛油果大了一倍，被誉为“超牛果”。好奇心驱使我尝了一颗，第一次吃牛油果没有见识，切开牛油果费了好大劲，切成了这样。
                    </p>
                    <div class="img-box">
                        <img src="img/wy_img5.jpg">
                    </div>
                    <div class="op-list">
                        <p class="like"><i class="layui-icon layui-icon-praise"></i><span>1200</span></p>
                        <p class="edit"><i class="layui-icon layui-icon-reply-fill"></i><span>1200</span></p>
                        <p class="off" off='true'><span>收起</span><i class="layui-icon layui-icon-up"></i></p>
                    </div>
                </div>
                <div class="review-version">
                    <div class="form">
                        <img src="img/header2.png">
                        <form class="layui-form" action="">
                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea name="desc" class="layui-textarea"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="text-align: right;">
                                    <button class="layui-btn definite">確定</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="list-cont">
                        <div class="cont">
                            <div class="img">
                                <img src="img/header.png" alt="">
                            </div>
                            <div class="text">
                                <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                                <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久
                                    不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                            </div>
                        </div>
                        <div class="cont">
                            <div class="img">
                                <img src="img/header.png" alt="">
                            </div>
                            <div class="text">
                                <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                                <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久
                                    不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                            </div>
                        </div>
                        <div class="cont">
                            <div class="img">
                                <img src="img/header.png" alt="">
                            </div>
                            <div class="text">
                                <p class="tit"><span class="name">吳亦凡</span><span class="data">2018/06/06</span></p>
                                <p class="ct">敢问大师，师从何方？上古高人呐逐一地看完你的作品后，我的心久久
                                    不能平静！这世间怎么可能还有如此精辟的作品？我不敢相信自己的眼睛。自从改革开放以后，我就以为再也不会有任何作品能打动我，没想到今天看到这个如此精妙绝伦的作品好厉害！</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="demo" style="text-align: center;"></div>
    </div>
</div>
<div id="popUp" style="display: none">
    <div class="login-container">
        <div class="login-title">登录</div>
        <p class="login-tip">没有账号？ 请点击<span class="login-tip-click">注册</span></p>
        <div class="login-input-group">
            <div>
                <div class="login-input-row">
                    <div class="login-input-box">
                        <input placeholder="请输入手机号" class="login-input login-input-phone">
                        <i class="input-error-tip" style="display: none;">* </i></div>
                </div>
                <div class="login-input-row">
                    <div class="login-input-box"><input placeholder="请输入6位验证码"
                                                        class="login-input login-input-captcha"><i
                            class="input-error-tip" style="display: none;">* </i></div>
                    <button class="hx-button login-input login-button hx-btn-default"><!----><span>发送验证码</span></button>
                    <div id="geetest-box-login"><!----></div>
                </div>
            </div>
            <div class="login-input-row clearfix"><span class="login-tip-click fr">账号密码登录</span></div>
        </div>
    </div>
</div>
<#--<div class="footer-wrap">
    <#include "../footer.ftl">
</div>-->
<script type="text/javascript">
    $(function () {
        menu.init();
        menu.off();
        $(".definite").click(function () {
            var idx = layer.open({
                type: 1
                , title: false
                , zIndex: layer.zIndex
                , content: $("#popUp").html()
                , anim: 3
            });
            layer.style(idx, {
                "width": '380px'
                , "height": '476px'
                , "top": '200px'
                , "left": '750px'
                , "border-radius": '10px'
                , "background": '#effdff'
            });
            return false;
        });

    })
</script>
<style>
    .login-container {
        padding: 30px;
    }

    .login-title {
        color: #27282d;
        font-size: 22px;
        height: 30px;
        line-height: 30px;
        font-weight: 700;
        margin-bottom: 10px;
    }

    .login-tip {
        font-size: 12px;
        color: #27282d;
        margin-bottom: 50px;
    }

    .login-tip-click {
        color: #27282d;
        font-size: 12px;
        font-weight: 700;
        cursor: pointer;
        padding-left: 4px;
    }
</style>
</body>
</html>