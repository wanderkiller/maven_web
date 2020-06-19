<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 6/19/2020
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出成功</title>
</head>
<body>
<% session.invalidate(); %>
<script>alert("您已经成功退出")</script>
<script>window.location.replace("index.jsp");
</script>
</body>
</html>
