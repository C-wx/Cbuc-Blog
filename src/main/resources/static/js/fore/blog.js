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
                    "<div class=\"post col-xl-6\">\n" +
                    "     <div class=\"post-thumbnail\">\n" +
                    "         <a href=\"post.ftl\">\n" +
                    "             <img src='"+img+"' alt='题图' >" +
                    "         </a>\n" +
                    "     </div>\n" +
                    "     <div class=\"post-details\">\n" +
                    "         <a href=\"post.ftl\">\n" +
                    "             <h3 class=\"h4\" title='"+data.title+"'>"+data.title+"</h3></a>\n" +
                    "         <p class=\"text-muted\">"+data.summary+"</p>\n" +
                    "         <footer class=\"post-footer d-flex align-items-center\">\n" +
                    "             <a href=\"#\" class=\"d-flex align-items-center flex-wrap\">\n" +
                    "                 <div class=\"title\">\n" +
                    "                     <i class=\"fa fa-user\"></i>\n" +
                    "                     Cbuc\n" +
                    "                 </div>\n" +
                    "             </a>\n" +
                    "             <div class=\"date\"><i class=\"fa fa-calendar\"></i>"+Base.formatDate(data.createTime,"yyyy-MM-dd")+"</div>\n" +
                    "             <div class=\"comments meta-last\"><i class=\"fa fa-comments-o\"></i>"+data.commentCount+"</div>\n" +
                    "         </footer>\n" +
                    "     </div>\n" +
                    " </div>";
                $("#blogs").append(html);
            });
        }else{
            layer.msg(result.msg);
        }
    })

}