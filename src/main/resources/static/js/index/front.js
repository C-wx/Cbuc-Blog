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
