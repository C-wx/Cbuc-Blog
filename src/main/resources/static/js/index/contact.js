$(function () {
    $("#submit").click(function () {
        var name = $("#name").val();
        var email = $("#email").val();
        var message = $("#message").val();
        if (!name) {
            $("#name").addClass("border-warning");
            $("#Pname").text("名称不能为空");
        }
        if (!email) {
            $("#email").addClass("border-warning");
            $("#Pemail").text("邮箱不能为空");
        }
        if (!message) {
            $("#message").addClass("border-warning");
            $("#Pmessage").text("内容不能为空");
        }
    });
    $("#name").click(function () {
        $("#name").removeClass("border-warning");
        $("#Pname").text("");
    });
    $("#email").click(function () {
        $("#email").removeClass("border-warning");
        $("#Pemail").text("");
    });
    $("#message").click(function () {
        $("#message").removeClass("border-warning");
        $("#Pmessage").text("");
    });
});