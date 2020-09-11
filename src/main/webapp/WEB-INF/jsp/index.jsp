<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园营销活动管理系统-任务</title>

    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-3 offset-9">
            <a>欢迎：</a>
            <a id="name"></a>
            <a id="logout" style="cursor: pointer;">！退出</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12" style="padding-top: 50px">
            <table id="table"></table>

        </div>
    </div>
</div>

<script src="js/jquery/jquery-3.3.1.min.js"></script>
<script src="js/jquery/jquery.cookie.min.js"></script>
<script src="js/bootstrap/js/bootstrap.js"></script>
<script src="js/bootstrap-table/bootstrap-table.js"></script>

<script>
    $(function () {

        var name = $.cookie("name");
        var userId = $.cookie("userId");
        if (!name || name === "") {
            window.location.href = "login";
        } else {
            $("#name").html(name);
        }

        $("#logout").click(function () {
            $.cookie("name", "", {expires: 0});
            window.location.href = "login";
        });

        function operateFormatter(value, row, index) {
            return [
                '<a style="cursor:pointer" id="edit">查看</a> '
            ].join('');
        }

        window.operateEvents = {
            'click #edit': function (e, value, row, index) {
                $.cookie("jobId", row.id);
                window.location.href = 'do';
            }
        };

        $("#table").bootstrapTable({
            url: "job/sel?id=" + userId,
            columns: [
                {
                    field: 'name',
                    title: '营销任务名',
                    sortable: true
                }, {
                    field: 'startTime',
                    title: '开始日期'
                }, {
                    field: 'endTime',
                    title: '结束日期'
                }, {
                    field: 'school',
                    title: '学校'
                }, {
                    field: 'num',
                    title: '发号数'
                }, {
                    field: 'action',
                    title: '操作',
                    width: 100,
                    events: operateEvents,
                    formatter: operateFormatter
                }
            ],
            sortable: true,
            sidePagination: "client",
            pageNumber: 1,
            pageSize: 5,
            search: true,
            uniqueId: "id",
            pagination: true
        });

    });

</script>


</body>
</html>