<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园营销活动管理系统-登录</title>

    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
</head>
<body>

<div class="container">
    <div class="row" style="margin-bottom: 100px;margin-top: 100px">
        <div class="col-md-6 offset-3" style="text-align: center">
            <h1>校园营销活动管理系统</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-5 offset-4">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-3 control-label">手机号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1 offset-6" style="padding-top: 8px">
            <a style="cursor: pointer;">注册</a>
        </div>
        <div class="col-md-2">
            <button id="submit" class="btn btn-defult btn-primary">登录</button>
        </div>
    </div>
</div>

<script src="js/jquery/jquery-3.3.1.min.js"></script>
<script src="js/jquery/jquery.cookie.min.js"></script>
<script src="js/bootstrap-table/bootstrap-table.js"></script>

<script>
    $(function () {

        var name = $.cookie("name");
        if (name && name !== "") {
            window.location.href = "index"
        }

        $("#submit").click(function () {
            if (!$("#phone").val() || !$("#password").val()) {
                alert("输入不能为空");
                return
            }

            $.ajax({
                url: "user/login",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify({
                    phone: $("#phone").val(),
                    password: $("#password").val()
                }),
                success: function (e) {
                    console.log(e);
                    if (e) {
                        $.cookie("name", e.name, {expires: 1});
                        $.cookie("userId", e.id, {expires: 1});
                        window.location.href = "index"
                    } else {
                        alert("用户/密码错误");
                        $("#password").val("");
                    }
                }
            });

        });
    });
</script>


</body>
</html>