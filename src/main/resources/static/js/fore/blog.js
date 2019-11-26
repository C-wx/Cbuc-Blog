$(function () {
    getCategory();
    getBlogs(1);
});

function getCategory() {
    Base.ajax("getCategories", null, function (result) {
        if (result.code == Base.status.success) {
            result.data.forEach((data) => {
                var item = "<div class=\"item d-flex justify-content-between\"><a href=\"#\">" + data.name + "</a><span>" + data.articleNum + "</span></div>"
                $(".widget.categories header").append(item);
            });
        } else {
            layer.msg(result.msg);
        }
    })
}

function getBlogs(pn) {
    $(".list-item").empty();
    $(".pagination-template").empty();
    Base.ajax("getBlogs", {'current': pn}, function (result) {
        if (result.code == Base.status.success) {
            console.log(result.data);
            if (result.data.hasPreviousPage) {
                var prePage = result.data.pageNum-1;
                $(".pagination-template").prepend("<li class=\"page-item\"><a onclick='getBlogs("+prePage+")' class=\"page-link\"> <i class=\"fa fa-angle-left\"></i></a></li>");
            }
            if (result.data.pageNum >= 4 && result.data.pages > 5) {
                $(".pagination-template").append("<li class=\"page-item\"><a onclick='getBlogs(1)' class=\"page-link\"> <i class=\"fa fa-angle-left\"></i><i class=\"fa fa-angle-left\"></i></a></li>");
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
                    "                     <a href='/gotoArticle/"+data.id+"' class=\"go-icon\"></a>\n" +
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
                var naviPageHtml = "<li class=\"page-item\" page='" + data + "'><a onclick='getBlogs("+data+")'  class=\"page-link \">" + data + "</a></li>\n";
                $(".pagination-template").append(naviPageHtml);
                if (data == result.data.pageNum) {
                    $(".page-item[page=" + data + "]").addClass("active");
                }
            });
            if (result.data.pageNum <= result.data.pages-3 && result.data.pages > 5) {
                $(".pagination-template").append("<li class=\"page-item\"><a onclick='getBlogs("+result.data.pages+")' class=\"page-link\"> <i class=\"fa fa-angle-right\"></i><i class=\"fa fa-angle-right\"></i></a></li>");
            }
            if (result.data.hasNextPage) {
                var nextPage = result.data.pageNum+1;
                $(".pagination-template").append("<li class=\"page-item\"><a onclick='getBlogs("+nextPage+")' class=\"page-link\"> <i class=\"fa fa-angle-right\"></i></a></li>");
            }
        } else {
            layer.msg(result.msg);
        }
    });

}