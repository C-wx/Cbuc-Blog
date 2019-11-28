<!DOCTYPE html>
<html>
<#assign base=request.contextPath />
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>${articleInfo.title}</title>
    <!--jquery-->
    <script src="${base}/js/jquery-1.11.2.min.js"></script>
    <script src="${base}/js/base.js"></script>
    <script src="${base}/js/fore/blogDetail.js"></script>
    <script src="${base}/plugins/editormd/editormd.js"></script>
    <script src="${base}/plugins/editormd/lib/marked.min.js"></script>
    <script src="${base}/plugins/editormd/lib/prettify.min.js"></script>
    <!-- layui -->
    <script src="${base}/plugins/layui/layui.all.js" type="application/javascript"></script>
    <link rel="stylesheet" href="${base}/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${base}/vendor/font-awesome/css/font-awesome.min.css">
    <!--主css-->
    <link rel="stylesheet" type="text/css" href="${base}/css/fore/main.css">
    <link rel="stylesheet" type="text/css" href="${base}/plugins/editormd/css/editormd.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/plugins/editormd/css/editormd.preview.css">
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
        <a href="/blog" class="active">博客</a>
        <a href="/contact">留言</a>
        <a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">Blink</a>
        <a onclick="layer.msg('暂未开发,敬请等待!');location.reload()" href="javascript:;">关于</a>
    </div>
    <ul class="layui-nav header-down-nav">
        <li class="layui-nav-item"><a href="/">首页</a></li>
        <li class="layui-nav-item"><a href="/blog" class="active">博客</a></li>
        <li class="layui-nav-item"><a href="/contact">留言</a></li>
        <li class="layui-nav-item"><a href="album.ftl">Blink</a></li>
        <li class="layui-nav-item"><a href="about.ftl">关于</a></li>
    </ul>
    <p class="access-count"><span class="text">访问量:&nbsp;</span><span
            class="count"><#if Session["accessCount"]?exists> ${Session["accessCount"]}</#if></span></p>
    <p class="blog-count"><span class="text">博文量:&nbsp;</span><span
            class="count"><#if Session["blogCount"]?exists> ${Session["blogCount"]}</#if></span></p>
    <p class="welcome-text"></p>
</div>
<div class="content whisper-content leacots-content details-content">
    <div class="cont w1000">
        <div class="whisper-list">
            <div class="item-box">
                <div class="review-version">
                    <div class="form-box">
                        <div class="article-cont">
                            <a href="/blog" style="position: relative;top: 30px;"><i class="fa fa-arrow-left"
                                                                                     style="font-size: 30px;"></i></a>
                            <!--头部-->
                            <div class="title">
                                <h3>${articleInfo.title}</h3>
                                <p class="cont-info">
                                    <span class="data types"><i class="fa fa-user"></i>&nbsp;&nbsp;Cbuc</span>
                                    <span class="data types"><i
                                            class="fa fa-calendar"></i>&nbsp;&nbsp;${articleInfo.createTime?string('yyyy/MM/dd')}</span>
                                    <span class="data types"><i
                                            class="fa fa-eye"></i>&nbsp;&nbsp;${articleInfo.accessCount}</span>
                                    <#list tags as tag>
                                         <span class="layui-badge layui-bg-cyan">${tag}&nbsp;&nbsp;
                                             <i class="fa fa-pencil" style="font-size:16px;color: #bcb69e;"></i></span>
                                    </#list>

                                </p>
                            </div>
                            <br>
                            <br>
                            <!--内容-->
                            <#if articleInfo.editor == 'markdown'>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="blog-view">
                                    <textarea style="display:none;">${articleContent.content}</textarea>
                                </div>
                            </#if>
                            <#if articleInfo.editor == 'html'>${articleContent.content}</#if>
                            <script type="text/javascript">
                                $(function () {
                                    editormd.markdownToHTML("blog-view", {
                                        htmlDecode: "style,script,iframe", //可以过滤标签解码
                                        emoji: true,
                                        taskList: true
                                    })
                                });
                            </script>
                            <!-- 图片弹窗 -->
                            <div id="pop_img" class="pop-modal">
                                <div class="pop-img">
                                    <div class="pop-img-box">
                                        <img src="/static/img/alipay2wei.jpg">
                                    </div>
                                </div>
                            </div>
                            <!--底部-->
                            <div class="btn-box">
                                <i onclick="showPay()" class="fa fa-money"
                                   style="font-size: 40px;cursor: pointer;color: #ffe184;"></i>
                                </button>
                                <div class="feed" id="feed1">
                                    <div class="heart " id="like" rel="like" aiId="${articleInfo.id}"></div>
                                    <div class="likeCount" id="likeCount">${articleInfo.likeCount}</div>
                                </div>
                            </div>
                        </div>
                        <div class="form">
                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea id="desc" placeholder="既然来了，就说几句" class="layui-textarea"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block" style="text-align: right;">
                                    <button class="layui-btn commentBtn" aiId="${articleInfo.id}">评论</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="volume">
                        全部留言 <span id="commentNum">${commentNum}</span>
                    </div>
                    <div class="list-cont">
                        <#if commentNum == 0>
                            <div style="text-align: center" id="noneCom">
                                暂无留言！
                            </div>
                        </#if>
                        <#list articleInfo.comments as comment>
                            <div class="cont">
                                <div class="img">
                                    <img src=" /img/header.png" alt="">
                                </div>
                                <div class="text">
                                    <p class="tit"><span class="name">${comment.loginIp}</span><span
                                            class="data">${comment.createTime?string('yyyy/MM/dd')}</span></p>
                                    <p class="ct">${comment.content}</p>
                                    <div style="font-size: 23px;margin: 5px 0px 0px 862px">
                                        <i class="fa fa-thumbs-o-up flag" style="margin-right: 18px;cursor: pointer"
                                           onclick="addLike(${comment.id},this)"></i>
                                        <i class="fa fa-comment-o flag" onclick="slideSec(${comment.id},this)" style="cursor: pointer;"></i>
                                    </div>
                                </div>
                                <div class="secondary" cid="${comment.id}" style="display: none">
                                    <#list comment.secondComments as secComment>
                                        <div class="content">
                                            <div class="img">
                                                <img src=" /img/header.png" alt="">
                                            </div>
                                            <div class="text">
                                                <p class="tit"><span class="name">${secComment.loginIp}</span><span
                                                        class="data">${secComment.createTime?string('yyyy/MM/dd')}</span></p>
                                                <p class="ct">${secComment.content}</p>
                                            </div>
                                        </div>
                                    </#list>
                                    <div style="padding: 20px" class="secTxt">
                                        <textarea cid="${comment.id}" placeholder="对此评论有何见解" class="layui-textarea secCon"></textarea>
                                        <div style="text-align: right;padding-top: 8px" >
                                            <button class="layui-btn" onclick="addSec(${comment.id},this)">评论</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>
        </div>
        <div id="demo" style="text-align: center;"></div>
    </div>
</div>
<script type="text/javascript">
    layui.config({
        base: '/static/js/fore/'
    }).use(['element', 'laypage', 'jquery', 'menu', 'mm'], function () {
        menu = layui.menu;
        menu.init();
    })
</script>
</body>
</html>