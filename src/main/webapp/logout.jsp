<%--
  Created by IntelliJ IDEA.
  User: liutianfu
  Date: 6/19/2020
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>退出成功</title>
</head>
<body>
<% session.invalidate(); %>
<script>alert("您已经成功退出")</script>
<script>window.location.replace("index.jsp");
</script>
</body>
</html>
