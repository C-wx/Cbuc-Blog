$(function () {
    getCategory();
    getBlogs(1);
    getHotBlogs();
    $(".submit").on("click",function () {
        var keyword = $("#keyword").val();
        if (keyword == null || keyword == '') {
            return
        }else{
            getBlogs(null,null,keyword);
        }
    })
});

/**展示分类列表*/
function getCategory() {
    Base.ajax("getCategories", null, function (result) {
        if (result.code == Base.status.success) {
            result.data.forEach((data) => {
                var item = "<div class=\"item d-flex justify-content-between\"><a href=\"#\" onclick='getBlogs(null," + data.id + ")'><i class='fa fa-pencil'></i>&nbsp;&nbsp;&nbsp;" + data.name + "</a><span>" + data.articleNum + "</span></div>"
                $(".widget.categories header").append(item);
            });
        } else {
            layer.msg(result.msg);
        }
    })
}

/**展示博文列表*/
function getBlogs(pn,cgid,keyword) {
    $(".list-item").empty();
    $(".pagination-template").empty();
    Base.ajax("getBlogs", {'current': pn,'cgid':cgid,'keyword':keyword}, function (result) {
        if (result.code == Base.status.success) {
            if (result.data.list.length == 0) {
                var nullHtml = "<h1 style='color: #C2BE9E;text-align: center'><i class='fa fa-frown-o'></i>&nbsp;&nbsp;未搜索到内容!</h1>"
                $(".list-item").append(nullHtml);
                return;
            }
            if (result.data.hasPreviousPage) {
                var prePage = result.data.pageNum - 1;
                $(".pagination-template").prepend("<li class=\"page-item\"><a onclick='getBlogs(" + prePage + ","+ cgid + ",\""+keyword+ "\")' class=\"page-link\"> <i class=\"fa fa-angle-left\"></i></a></li>");
            }
            if (result.data.pageNum >= 4 && result.data.pages > 5) {
                $(".pagination-template").append("<li class=\"page-item\"><a onclick='getBlogs(1,"+ cgid + ",\""+keyword+ "\")' class=\"page-link\"> <i class=\"fa fa-angle-left\"></i><i class=\"fa fa-angle-left\"></i></a></li>");
            }
            result.data.list.forEach((data) => {
                var img = data.articleContent.image == "" ? '/img/wy_img5.jpg' : data.articleContent.image;
                var html =
                    "<div class=\"item\">\n" +
                    "     <div class=\"container-fluid\">\n" +
                    "         <div class=\"row\">\n" +
                    "             <div class=\" col-lg-5\">\n" +
                    "                 <div class=\"img\"><img src='" + img + "' alt=\"\"></div>\n" +
                    "             </div>\n" +
                    "             <div class=\"col-lg-7\">\n" +
                    "                 <div class=\"item-cont\">\n" +
                    "                     <h3 class='h3' acId='" + data.id + "'>" + data.title + " " +
                    "                     </h3>\n" +
                    "                     <h5>" +
                    "             <i class=\"fa fa-user\">&nbsp;&nbsp;&nbsp;</i>Cbuc\n" + " &nbsp;&nbsp;|&nbsp;&nbsp; \n" +
                    "             <i class=\"fa fa-calendar\">&nbsp;&nbsp;&nbsp;</i>" + Base.formatDate(data.createTime, "yyyy-MM-dd") + " &nbsp;&nbsp;|&nbsp;&nbsp; \n" +
                    "             <i class=\"fa fa-comments-o\">&nbsp;&nbsp;&nbsp;</i>" + data.commentCount + "\n" +
                    "</h5>\n" +
                    "                     <p>\n" +
                    "                         " + data.summary + "</p>\n" +
                    "                     <a href='/gotoArticle/" + data.id + "' class=\"go-icon\"></a>\n" +
                    "                 </div>\n" +
                    "             </div>\n" +
                    "         </div>\n" +
                    "     </div>\n" +
                    " </div>";
                $(".list-item").append(html);
                var isNew = "<span class=\"layui-btn layui-btn-danger new-icon\">new</span>"
                var isTop = "<span class=\"layui-btn new-icon\">置顶</span>"
                if (data.isNew) {
                    $(".h3[acId=" + data.id + "]").append(isNew);
                }
                if (data.istop == '1') {
                    $(".h3[acId=" + data.id + "]").append(isTop);
                }
            });
            result.data.navigatepageNums.forEach((data) => {
                var naviPageHtml = "<li class=\"page-item\" page='" + data + "'><a onclick='getBlogs(" + data + ","+ cgid +",\""+keyword+ "\")'  class=\"page-link \">" + data + "</a></li>\n";
                $(".pagination-template").append(naviPageHtml);
                if (data == result.data.pageNum) {
                    $(".page-item[page=" + data + "]").addClass("active");
                }
            });
            if (result.data.pageNum <= result.data.pages - 3 && result.data.pages > 5) {
                $(".pagination-template").append("<li class=\"page-item\"><a onclick='getBlogs(" + result.data.pages+","+ cgid + ",\""+keyword+ "\")' class=\"page-link\"> <i class=\"fa fa-angle-right\"></i><i class=\"fa fa-angle-right\"></i></a></li>");
            }
            if (result.data.hasNextPage) {
                var nextPage = result.data.pageNum + 1;
                $(".pagination-template").append("<li class=\"page-item\"><a onclick='getBlogs(" + nextPage + ","+ cgid + ",\""+keyword+ "\")' class=\"page-link\"> <i class=\"fa fa-angle-right\"></i></a></li>");
            }
        } else {
            layer.msg(result.msg);
        }
    });
}

/**展示热文列表*/
getHotBlogs = () => {
    $(".blog-posts").empty();
    Base.ajax("getHotBlogs", null, function (result) {
        if (result.code == Base.status.success) {
            var data = result.data;
            data.forEach(function (data) {
                var hotBlogHtml =
                    "<a href=\"#\">\n" +
                    "   <div class=\"item d-flex align-items-center\">\n" +
                    "       <div class=\"image\"><img src=\"img/github.jpg\" alt=\"...\" class=\"img-fluid\"></div>\n" +
                    "       <div class=\"title\"><strong>" + data.title + "</strong>\n" +
                    "           <div class=\"d-flex align-items-center\">\n" +
                    "               <div class=\"views\"><i class=\"fa fa-eye\"></i> " + data.accessCount + "</div>\n" +
                    "               <div class=\"comments\"><i class=\"fa fa-comments-o\"></i>" + data.commentCount + "</div>\n" +
                    "           </div>\n" +
                    "       </div>\n" +
                    "   </div>\n" +
                    "</a>";
                $(".blog-posts").append(hotBlogHtml);
            })
        }
    });
}