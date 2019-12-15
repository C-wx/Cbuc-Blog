<!DOCTYPE html>
<#assign base=request.contextPath />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>Blinks</title>
    <!--jquery-->
    <script src="${base}/js/jquery-1.11.2.min.js"></script>
    <script src="${base}/js/base.js"></script>
    <script src="${base}/js/fore/menu.js"></script>
    <script src="${base}/js/fore/blinks.js"></script>
    <!-- layui -->
    <script src="${base}/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="${base}/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${base}/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${base}/vendor/bootstrap/css/bootstrap.min.css">
    <!--主css-->
    <link rel="stylesheet" type="text/css" href="${base}/css/fore/main.css">
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
    <#if Session["loginUser"]?exists>
        <p class="welcome-user">
            欢迎您: ${Session["loginUser"].userName}
        </p>
    <#else>
        <p class="welcome-text"></p>
    </#if>
</div>
<style>
    #textarea {
        border-radius: 10px 10px 0px 0px;
        background-color: rgba(241, 241, 241, .98);
        width: 840px;
        height: 180px;
        padding: 10px;
        resize: none;
        border: none;
        font-size: 20px;
        font-family: '楷体';
    }
    #addImg{
        border-radius: 0px 0px 10px 10px;
        background-color: rgba(241, 241, 241, .98);
        width: 840px;
        height: 180px;
        padding: 10px;
    }
    .hide{
        display: none;
    }
    .delete-btn{
        position:relative;
        top: -57px;
        left: -41px;
        z-index: 999;
        font-size:25px;
    }
    .content-img-list-item{
        float: left;
        margin-right: 45px;
    }
    .content-img-list-item img {
        width: 200px;
        height: 150px;
        margin-right: 20px;
    }
    .file{
        height: 150px;
        text-align: center;
        font-size: 26px;
    }
    .max{
        width: 100%;
        height: auto;
    }
</style>
<div id="addBlink" style="display: none;">
    <div style="padding: 30px 50px 0px 50px">
        <h2 style="font-family: 'kaiti'"><b>内容编辑 </b><i class="fa fa-paint-brush"></i></h2>
        <div style="border: 1px darkcyan dashed"></div>
        <form enctype="multipart/form-data" method="post" id="pubForm">
            <div id="editor" style="margin: 20px 0 50px 0;width: 840px;height: 100px">
                <textarea id="textarea"></textarea>
            </div>
            <div class="layui-input-inline" id="addImg">
                <div class="content-img">
                    <ul class="content-img-list"></ul>
                    <div class="file" style="cursor:pointer;">
                        <i class="fa fa-plus" style="line-height: 150px"></i>
                        <span style="line-height: 150px" onclick="clickImage()">上传图片</span>
                        <input type="file" name="files" accept="image/*" id="upload" style="display: none">
                    </div>
                </div>
            </div>
            <div>
                <button type="button" class="layui-btn layui-btn-warm" style="float: right;margin-top: 20px;" id="publish">发布</button>
            </div>
        </form>
    </div>
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
                                    <button class="layui-btn definite layui-anim layui-anim-up" type="button">確定
                                    </button>
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
    </div>
    <div class="addBlinks">
        <i class="fa fa-pencil" style="font-size: 40px; color: #9e9880;margin:10px 0px 0px 15px;"></i>
    </div>
</div>
<div id="popUp" style="display: none">
    <div class="login-container">
        <div class="login-title">登录</div>
        <p class="login-tip">没有账号？ 请点击<span class="login-tip-click">注册</span></p>
        <form id="login-form">
            <div>
                <input placeholder="输入用户名" class="login-input" name="username" id="logName" onfocus="inputOnfocus(this)"
                       onblur="inputOnblur(this)">
            </div>
            <br><br>
            <div>
                <input placeholder="输入密码" class="login-input" name="password" id="logPwd" onfocus="inputOnfocus(this)"
                       onblur="inputOnblur(this)">
            </div>
            <div class="login-forget">忘记密码</div>
            <div style="clear: both;"/>
            <div>
                <button class="login-button" type="button" onclick="doLogin()">登录</button>
            </div>
            <div class="login-others">使用其他方式登录</div>
            <hr>
            <div class="other-icon" style="margin:22px 0px 13px 108px">
                <i class="fa fa-qq"></i>
                <i class="fa fa-github"></i>
            </div>
            <div class="protocol">
                登陆即代表您已同意
                <a href="javascript:;" class="protocol-tip">Cbuc博客用户注册协议与隐私政策</a>
            </div>
        </form>
    </div>
</div>
<div class="register-container" style="display: none">
    <div class="login-title">注册</div>
    <p class="login-tip" style="margin-bottom: 30px">已有账号，请点击<span class="register-tip-click">登录</span></p>
    <form class="layui-form" id="register-form">
        <div>
            <input placeholder="输入用户名" class="login-input" id="registerName" name="username"
                   onfocus="inputOnfocus(this)"
                   onblur="inputOnblur(this)">
        </div>
        <br>
        <div>
            <input placeholder="输入手机号" class="login-input" id="registerPhone" name="phone" onfocus="inputOnfocus(this)"
                   onblur="inputOnblur(this)">
        </div>
        <br>
        <div>
            <input placeholder="输入密码" class="login-input" id="registerPwd" name="password" onfocus="inputOnfocus(this)"
                   onblur="inputOnblur(this)">
        </div>
        <br>
        <div class="layui-form-item" style="margin-bottom: 10px">
            <div class="layui-inline">
                <label class="layui-form-label">密保：</label>
                <div class="layui-input-inline">
                    <select name="question" id="registerQuestion">
                        <option value="">请选择问题</option>
                        <optgroup label="城市记忆">
                            <option value="你的出生城市">你的出生城市</option>
                        </optgroup>
                        <optgroup label="学生时代">
                            <option value="你的工号">你的工号</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">答案：</label>
                <div class="layui-input-inline">
                    <input placeholder="输入答案" class="login-input" id="registerAnswer" style="width: 191px" name="answer"
                           onfocus="inputOnfocus(this)" onblur="inputOnblur(this)">
                </div>
            </div>
        </div>
        <div>
            <button class="login-button" onclick="register()" type="button" style="margin-top: 0px">注册</button>
        </div>
    </form>
</div>
<div class="forget-container" style="display: none">
    <div class="login-title">忘记密码</div>
    <p class="login-tip">找回密码， 请点击<span class="register-tip-click">登录</span></p>
    <form class="layui-form">
        <div>
            <input placeholder="输入手机号/用户名" class="login-input" name="username" id="savName" onfocus="inputOnfocus(this)"
                   onblur="inputOnblur(this)">
        </div>
        <br>
        <div>
            <input placeholder="输入密码" class="login-input" name="password" id="savPwd" onfocus="inputOnfocus(this)"
                   onblur="inputOnblur(this)">
        </div>
        <br>
        <div class="layui-form-item" style="margin-bottom: 10px">
            <div class="layui-inline">
                <label class="layui-form-label">密保：</label>
                <div class="layui-input-inline">
                    <select name="question" id="savQuestion">
                        <option value="">请选择问题</option>
                        <optgroup label="城市记忆">
                            <option value="你的出生城市">你的出生城市</option>
                        </optgroup>
                        <optgroup label="学生时代">
                            <option value="你的工号">你的工号</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">答案：</label>
                <div class="layui-input-inline">
                    <input placeholder="输入答案" class="login-input" style="width: 191px" name="answer" id="savAnswer"
                           onfocus="inputOnfocus(this)" onblur="inputOnblur(this)">
                </div>
            </div>
        </div>
        <div>
            <button class="login-button" type="button" style="margin-top: 0px" onclick="savePwd()">保存</button>
        </div>
    </form>
</div>
</body>
<script>
    layui.use(['form'], function () {
        var form = layui.form
        form.render();
    })
</script>
</html>