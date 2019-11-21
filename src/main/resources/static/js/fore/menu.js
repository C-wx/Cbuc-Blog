layui.define(['mm','jquery'],function(exports){
  var $ = layui.$,mm = layui.mm;
  var menu = {
    init: function(){
      $('.menu').on('click',function(){
        if($(this).hasClass('on')){
          $(this).removeClass('on')
          $('.header-down-nav').removeClass('layui-show');
        }else{
          $(this).addClass('on')
          $('.header-down-nav').addClass('layui-show');
        }
      })
      window.onresize = function () {
        var curwidth = document.documentElement.clientWidth;
        if(curwidth > 760){
          $('.header-down-nav').removeClass('layui-show');
          $('.menu').removeClass('on');
        }
      };
    var count = $('.list-cont .cont').length;
    $('.volume span').text(count);
    $('.op-list .like').on('click',function(){
      var oSpan =  $(this).children('span');
      var num = parseInt($(oSpan).text())
      var off = $(this).attr('off')
        if(off){
          $(this).removeClass('active');
          off = true;
          $(oSpan).text(num-1)
          $(this).attr('off','')
        }else{
          $(this).addClass('active');
          off = false;
          $(oSpan).text(num+1)
          $(this).attr('off','true')
        }
      })
    },
    off:function(){
      $('.off').on('click',function(){
        var off = $(this).attr('off');
        var chi = $(this).children('i');
        var text = $(this).children('span');
        var cont = $(this).parents('.item').siblings('.review-version');
        if(off){
          $(text).text('展开');
          $(chi).attr('class','layui-icon layui-icon-down');
          $(this).attr('off','');
          $(cont).addClass('layui-hide');
        }else{
          $(text).text('收起');
          $(chi).attr('class','layui-icon layui-icon-up')
          $(this).attr('off','true')
          $(cont).removeClass('layui-hide')
        }
      })
    },
    submit: function(){
      $('.definite').on('click',function(e){
        var event = e || event;
        debugger
        event.preventDefault();
        var $listcont = $(this).parents('.form').siblings('.list-cont').length ? $(this).parents('.form').siblings('.list-cont') : $(this).parents('.form-box').siblings('.list-cont');
        console.log($listcont)
        var img = $(this).parents('form').siblings('img').attr('src');
        var textarea = $(this).parents('.layui-form-item').siblings('.layui-form-text').children('.layui-input-block').children('textarea');
        var name = $(textarea).val();
        var html = laytplCont.innerHTML;
        var data = {
          avatar : img,
          name : '吴亦凡',
          cont : name,
        };
        if(name){
          var cont = mm.renderHtml(html,data);
          $listcont.prepend(cont);
          var cunt = $(this).parents('.form-box').siblings('.volume').children('span');
          var cunts = $(this).parents('.form-box').siblings('.list-cont').children('.cont').length;
          textarea.val('')
        }else{
          layer.msg('请输入内容')
        } 
        cunt.text(cunts);
      })
    }
  };
  exports('menu',menu)
});
function getCurDate() {
    var d = new Date();
    var week;
    switch (d.getDay()) {
        case 1:
            week = "Monday";
            break;
        case 2:
            week = "Tuesday";
            break;
        case 3:
            week = "Wednesday";
            break;
        case 4:
            week = "Thursday";
            break;
        case 5:
            week = "Friday";
            break;
        case 6:
            week = "Saturday";
            break;
        case 0:
            week = "Sunday";
            break;
    }
    var years = d.getFullYear();
    var month = add_zero(d.getMonth() + 1);
    var days = add_zero(d.getDate());
    var hours = add_zero(d.getHours());
    var minutes = add_zero(d.getMinutes());
    var seconds = add_zero(d.getSeconds());
    var nowDate = years + "-" + month + "-" + days + " / " + hours + " : " + minutes + " : " + seconds + " / " + week;
    $(".welcome-text").text(nowDate) ;
}
function add_zero(temp) {
    if (temp < 10) {
        return "0" + temp;
    } else {
        return temp;
    }
}
setInterval('getCurDate()', 100);
showweixin = function () {
  layer.open({
      type: 1
      , offset: 'auto'
      , id: 'layerDemo'
      , content: '<div style="padding: 20px;">' + "17689400062" + '</div>'
      , anim: 5
  })
};
$(".fa-weixin").hover(function() {
    openMsg("WX: 17689400062",".fa-weixin");
}, function() {
    layer.close(message);
});
$(".fa-qq").hover(function() {
    openMsg("QQ: 1404668149",".fa-qq");
}, function() {
    layer.close(message);
});
$(".fa-github").hover(function() {
    openMsg("GitHub: https://github.com/C-wx",".fa-github");
}, function() {
    layer.close(message);
});
function openMsg(msg,target) {
    message = layer.tips('<span style="font-size: 14px">'+msg+'</span>', target,{tips:[1,'#a1a5ff'],time: 30000});
}