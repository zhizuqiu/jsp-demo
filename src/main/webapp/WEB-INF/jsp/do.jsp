<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园营销活动管理系统-发号</title>

    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-1">
            <a style="cursor: pointer;" id="back">返回</a>
        </div>
        <div class="col-md-3 offset-8">
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">脳
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">goalName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="goalName"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button id="submitUpdate" type="button" class="btn btn-primary">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script src="js/jquery/jquery-3.3.1.min.js"></script>
<script src="js/jquery/jquery.cookie.min.js"></script>
<script src="js/bootstrap/js/bootstrap.js"></script>
<script src="js/bootstrap-table/bootstrap-table.js"></script>

<script>
    $(function () {

        var packId;

        var name = $.cookie("name");
        var userId = $.cookie("userId");
        var jobId = $.cookie("jobId");
        if (!name || name === "") {
            window.location.href = "login";
        } else {
            $("#name").html(name);
        }

        $("#back").click(function () {
            window.location.href = "index";
        });

        $("#logout").click(function () {
            $.cookie("name", "", {expires: 0});
            window.location.href = "login";
        });

        $("#submitUpdate").click(function () {
            if (!$('#goalName').val()) {
                alert('不能为空');
                return
            }

            $.ajax({
                url: "pack/update",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify({
                    "id": packId,
                    "goalName": $('#goalName').val()
                }),
                success: function (e) {
                    if (e > 0) {
                        alert("提交成功");
                        $("#table").bootstrapTable("refresh");
                        $('#myModal').modal('hide');
                    }
                }
            });
        });


        function operateFormatter(value, row, index) {
            return [
                '<a style="cursor:pointer" id="edit">发号</a> ',
                '<a style="cursor:pointer" id="delete">删除</a>'
            ].join('');
        }

        window.operateEvents = {
            'click #edit': function (e, value, row, index) {
                packId = row.packId;
                $('#myModal').modal('show');
            },
            'click #delete': function (e, value, row, index) {
                $.ajax({
                    url: "pack/delete",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify({
                        "id": row.packId
                    }),
                    success: function (e) {
                        if (e > 0) {
                            alert("删除成功");
                            $("#table").bootstrapTable("refresh");
                            $('#myModal').modal('hide');
                        }
                    }
                });
            }
        };

        $("#table").bootstrapTable({
            url: "job/getPack?jobId=" + jobId,
            columns: [
                {
                    field: 'name',
                    title: '活动名',
                    sortable: true
                }, {
                    field: 'startTime',
                    title: '开始日期'
                }, {
                    field: 'endTime',
                    title: '结束日期'
                }, {
                    field: 'region',
                    title: '地市'
                }, {
                    field: 'school',
                    title: '学校'
                }, {
                    field: 'goalName',
                    title: '发号目标'
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