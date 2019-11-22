$(function () {
    getCategory();
    getBlogs();
});
function getCategory() {
    Base.ajax("getCategories",null,function (result) {
        if (result.code == Base.status.success) {
            result.data.forEach((data)=>{
               var item = "<div class=\"item d-flex justify-content-between\"><a href=\"#\">"+data.name+"</a><span>"+data.articleNum+"</span></div>"
                $(".widget.categories header").append(item);
            });
        }else{
            layer.msg(result.msg);
        }
    })
}
function getBlogs() {
    Base.ajax("getBlogs",null,function (result) {
        if (result.code == Base.status.success) {
            console.log(result.data);
            result.data.list.forEach((data)=>{
                var img = data.articleContent.image==null?'/img/wy_img5.jpg':data.articleContent.image;
                var html =
                    "<div class=\"item\">\n" +
                    "     <div class=\"container-fluid\">\n" +
                    "         <div class=\"row\">\n" +
                    "             <div class=\" col-lg-5\">\n" +
                    "                 <div class=\"img\"><img src='"+img+"' alt=\"\"></div>\n" +
                    "             </div>\n" +
                    "             <div class=\"col-lg-7\">\n" +
                    "                 <div class=\"item-cont\">\n" +
                    "                     <h3>"+data.title+"" +
                    "                         <#if "+Base.formatDate(data.createTime,'yyyy-MM-dd'+")><button class=\"layui-btn layui-btn-danger new-icon\">new</button>\n" +
                    "                     </h3>\n" +
                    "                     <h5>" +
                    "             <i class=\"fa fa-calendar\">&nbsp;&nbsp;&nbsp;</i>"+Base.formatDate(data.createTime,"yyyy-MM-dd")+" &nbsp;&nbsp;|&nbsp;&nbsp; \n" +
                    "             <i class=\"fa fa-comments-o\">&nbsp;&nbsp;&nbsp;</i>"+data.commentCount+"\n" +
                    "</h5>\n" +
                    "                     <p>\n" +
                    "                         "+data.summary+"</p>\n" +
                    "                     <a href=\"details.html\" class=\"go-icon\"></a>\n" +
                    "                 </div>\n" +
                    "             </div>\n" +
                    "         </div>\n" +
                    "     </div>\n" +
                    " </div>";
                $(".list-item").append(html);
            });
        }else{
            layer.msg(result.msg);
        }
    })

}