showPay = ()=>{
    $('#pop_img').show();
    $('#pop_img').click(function(){
        $('#pop_img').hide();
    })
};
$(()=>{
    /**点赞特效*/
   $(".heart").click(function () {
       var aiId=$(this).attr("aiId");
       var C=parseInt($("#likeCount").html());
       $(this).css("background-position","");
       var D=$(this).attr("rel");
       if(D === 'like')
       {
           Base.ajax("/doLike",{'type':"1",'count':1,'id':aiId},function (result) {
               if (result.code != Base.status.success) {
                   layer.msg(result.msg);
               }
           });
           $("#likeCount").html(C+1);
           $(this).addClass("heartAnimation").attr("rel","unlike");
       }
       else
       {
           Base.ajax("/doLike",{'type':"1",'count':-1,'id':aiId},function (result) {
               if (result.code != Base.status.success) {
                   layer.msg(result.msg);
               }
           });
           $("#likeCount").html(C-1);
           $(this).removeClass("heartAnimation").attr("rel","like");
           $(this).css("background-position","left");
       }
   });
   /**评论功能*/
    $(".commentBtn").click(function (){
        if ($("#desc").val() == '') {
            Base.openError("评论内容不能为空",'#desc');
            return
        }else{
            Base.ajax("addComment",{'content':$("#desc").val(),'aiId':$(this).attr("aiId")},function (result) {
                if (result.code == Base.status.success) {
                    $("#noneCom").hide();
                    layer.msg("评论成功!");
                    var data = result.data;
                    var commentHtml =
                        "<div class=\"cont\">\n" +
                        "     <div class=\"img\">\n" +
                        "         <img src=\" /img/header.png\" alt=\"\">\n" +
                        "     </div>\n" +
                        "     <div class=\"text\">\n" +
                        "         <p class=\"tit\"><span class=\"name\">"+data.loginIp+"</span><span\n" +
                        "                 class=\"data\">"+Base.formatDate(data.createTime,"yyyy/MM/dd")+"</span></p>\n" +
                        "         <p class=\"ct\">"+data.content+"</p>\n" +
                        "         <div style=\"font-size: 23px;margin: 5px 0px 0px 865px\">\n" +
                        "             <i class=\"fa fa-thumbs-o-up flag\" style=\"margin-right: 10px;cursor: pointer\"\n" +
                        "                onclick=\"addLike("+data.id+")\"></i>\n" +
                        "             <i class=\"fa fa-comment-o flag\" style=\"cursor: pointer;\"></i>\n" +
                        "         </div>\n" +
                        "     </div>\n" +
                        "</div>"
                    $(".list-cont").prepend(commentHtml);
                    $("#desc").val("");
                    $("#commentNum").html(parseInt($("#commentNum").html())+1);
                }
            })
        }
        $("#desc").click(function () {
            layer.close(errorPrompt);
        });
    });
});
var flag = false;
/**评论点赞*/
addLike = function (cid) {
    if (!flag) {
        var count = 1;
    }else {
        count = -1;
    }
    Base.ajax("doLike",{'type':"2",'id':cid,'count':count});
  console.log(cid);
};