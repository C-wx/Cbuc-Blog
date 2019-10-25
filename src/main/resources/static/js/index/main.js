function main() {
    (function () {
        'use strict';
        $('a.page-scroll').click(function () {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top - 40
                    }, 900);
                    return false;
                }
            }
        });
        // affix the navbar after scroll below header
        $('#nav').affix({
            offset: {
                top: $('header').height()
            }
        });
        // Portfolio isotope filter
        $(window).load(function () {
            var $container = $('.portfolio-items');
            $container.isotope({
                filter: '*',
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });
            $('.cat a').click(function () {
                $('.cat .active').removeClass('active');
                $(this).addClass('active');
                var selector = $(this).attr('data-filter');
                $container.isotope({
                    filter: selector,
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false
                    }
                });
                return false;
            });
        });
        // Nivo Lightbox
        $('.portfolio-item a').nivoLightbox({
            effect: 'slideDown',
            keyboardNav: true
        });
    }());
}
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
        case 7:
            week = "Sunday";
            break;
    }
    var years = d.getFullYear();
    var month = add_zero(d.getMonth() + 1);
    var days = add_zero(d.getDate());
    var hours = add_zero(d.getHours());
    var minutes = add_zero(d.getMinutes());
    var seconds = add_zero(d.getSeconds());
    var nowDate = years + "-" + month + "-" + days + "   " + hours + " : " + minutes + " : " + seconds + "   " + week;
    $("#time").text(nowDate) ;
}
function add_zero(temp) {
    if (temp < 10) {
        return "0" + temp;
    } else {
        return temp;
    }
}
setInterval('getCurDate()', 100);
main();