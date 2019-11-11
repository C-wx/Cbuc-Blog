<!DOCTYPE html>
<html lang="en">
<#assign base=request.contextPath />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cbuc个人博客</title>

    <!--jquery-->
    <script src="${base}/js/jquery-1.11.2.min.js"></script>
    <script src="${base}/js/base.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${base}/vendor/bootstrap/css/bootstrap.min.css">
    <!--css-->
    <link rel="stylesheet" href="${base}/css/materialize.min.css">
    <link rel="stylesheet" href="${base}/css/tooplate.css">
    <!-- layui -->
    <script src="${base}/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="${base}/plugins/layui/css/layui.css">
    <!--login JS-->
    <script src="${base}/js/login.js"></script>
</head>
<body id="login">
<div class="container">
    <div class="row tm-register-row tm-mb-35">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-l">
            <form action="" method="post" class="tm-bg-black p-5 h-100 layui-form">
                <div class="input-field layui-form-item">
                    <input placeholder="用户名" id="username" name="username" type="text" class="layui-input" lay-verify="required|username" autocomplete="off">
                </div>
                <div class="input-field layui-form-item">
                    <input placeholder="密码" id="password" name="password" type="password" class="layui-input" lay-verify="required|pass">
                </div>
                <div class="input-field layui-form-item">
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-xs7">
                            <input type="text" name="verifyCode" lay-verify="required" placeholder="验证码" class="layui-input" id="verifyCode">
                        </div>
                        <div class="layui-col-xs5">
                            <div>
                                <img src="/image/code" class="layadmin-user-login-codeimg" id="vercode"
                                     onclick="captchaRefresh(this)">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tm-flex-lr">
                    <button type="submit" id="login_btn" lay-submit lay-filter="submit">
                        Login
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>