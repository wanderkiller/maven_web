<%--
  Created by IntelliJ IDEA.
  User: liutianfu
  Date: 6/19/2020
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="com.liutianfu.tools.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    User u = (User) session.getAttribute("user");
%>
<%
    List<Product> products = ProductMgr.getInstance().getRecentProducts(6);
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>项目首页</title>
    <link href="static/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/custom_global.css">
</head>
<body>
<nav class="site-header sticky-top py-1 row">
    <div class="container d-flex flex-column flex-md-row justify-content-between">
        <a class="py-2 d-none d-md-inline-block" href="index.jsp">J2ee项目</a>
        <a class="py-2 d-none d-md-inline-block" href="index.jsp">主页</a>
        <a class="py-2 d-none d-md-inline-block" href="shop.jsp">商店</a>
        <a class="py-2 d-none d-md-inline-block" href="order.jsp">订单通知</a>
        <%
            if (u == null) {
        %>
        <a class="py-2 float-md-left" href="login.jsp">登录</a>
        <a class="py-2 float-md-left" href="register.jsp">注册账号</a>

        <%
        } else {
        %>
        <a class="py-2 d-none d-md-inline-block" href="account.jsp">欢迎您: <%=u.getUsername()%>
        </a><%}%>
    </div>
</nav>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="static/images/index/loop1.jpg" class="d-block w-100" alt="loop1">
        </div>
        <div class="carousel-item">
            <img src="static/images/index/loop2.jpg" class="d-block w-100" alt="loop2">
        </div>
        <div class="carousel-item">
            <img src="static/images/index/loop3.jpg" class="d-block w-100" alt="loop3">
        </div>
        <div class="carousel-item">
            <img src="static/images/index/loop4.jpg" class="d-block w-100" alt="loop4">
        </div>
        <div class="carousel-item">
            <img src="static/images/index/loop5.jpg" class="d-block w-100" alt="loop5">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<footer class="container py-5 item_link text-muted">
    <div class="row">
        <div class="col-6 col-md">
            <ul class="list-unstyled">
                <li class="float-left">Built with <a href="https://getbootstrap.com/">Bootstrap</a>, an open source
                    project
                    by <a href="https://twitter.com">Twitter, Inc.</a></li>
                <li class="float-left">Database: <a href="https://www.mysql.com/">MySQL</a>, a trademark owned by
                    <a href="https://www.oracle.com">Oracle, Corp.</a></li>
                <li class="float-left">Thanks to <a href="https://www.jetbrains.com">JetBrains s.r.o.</a> for the free
                    educational subscription.
                </li>
                <li class="float-left">Boosted by <a href="https://www.jsdelivr.com">Jsdelivr</a> for the fast web browsing experience.
                </li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <p class="text-small float-right">Copyright © 2020 刘天赋 @ <a href="http://www.hbnu.edu.cn/">HBNU</a>. All Rights
                Reserverd. </p>
        </div>
    </div>
</footer>
<script type="text/javascript" src="static/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-hover-dropdown.js"></script>
</body>
</html>
