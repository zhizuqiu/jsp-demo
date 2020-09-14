<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园营销活动管理系统-任务</title>

    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
</head>
<body>

<sql:setDataSource var="snapshot"
                   driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/jsp-demo?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC"
                   user="root" password="123456"/>

<c:set var="id" value="${param.id}"/>

<sql:query dataSource="${snapshot}" var="result">
    select * from job where agentId = ?
    <sql:param value="${id}"/>
</sql:query>
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
            <table border="1" width="100%">
                <tr>
                    <th>ID</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>学校</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.name}"/></td>
                        <td><c:out value="${row.startTime}"/></td>
                        <td><c:out value="${row.endTime}"/></td>
                        <td><c:out value="${row.school}"/></td>
                        <td><c:out value=""/> <a style="cursor: pointer" onclick="jumpDo(${row.id})">查看</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</div>

<script src="js/jquery/jquery-3.3.1.min.js"></script>
<script src="js/jquery/jquery.cookie.min.js"></script>
<script src="js/bootstrap/js/bootstrap.js"></script>
<script src="js/bootstrap-table/bootstrap-table.js"></script>

<script>
    function jumpDo(id) {
        $.cookie("jobId", id);
        window.location.href = 'do2';
    }

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

    });

</script>


</body>
</html>