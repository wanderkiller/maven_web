<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 6/20/2020
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.Timestamp" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.liutianfu.tools.*" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ include file="sessionCheck.jsp" %>
<%
    //    String productID = request.getParameter("productID");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
    int flag = 0;
    String addr = null;
    String productId = null;
    String productName_demo = null;
    String productName = null;
    try {
        addr = request.getParameter("addr");
        productId = request.getParameter("productId");
        productName_demo = request.getParameter("productName");
        productName = new String(productName_demo.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        SalesOrder so = new SalesOrder();
        so.setUser(u);
        so.setAddr(addr);
        so.setOdate(new Timestamp(System.currentTimeMillis()));
        so.setStatus(0);
        so.save();
        flag = 1;
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>商店 - J2ee项目 by 刘天赋</title>

    <link href="static/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/custom_global.css">
    <link rel="stylesheet" href="static/css/custom_shop.css">

</head>
<body>
<nav class="site-header sticky-top py-1 row">
    <div class="container d-flex flex-column flex-md-row justify-content-between">
        <a class="py-2 d-none d-md-inline-block" href="index.jsp">J2ee项目</a>
        <a class="py-2 d-none d-md-inline-block" href="index.jsp">主页</a>
        <a class="py-2 d-none d-md-inline-block" href="shop.jsp">商店</a>
        <%
            if (u == null) {
        %>
        <a class="py-2 float-md-left" href="login.jsp">登录</a>
        <%
        } else {
        %>
        <a class="py-2 d-none d-md-inline-block" href="account.jsp">欢迎您: <%=u.getUsername()%>
        </a><%}%>
    </div>
</nav>

<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
        <% if (flag == 1) {%>
        <h1 class="display-4 font-weight-normal">下单成功</h1>
        <p class="lead font-weight-normal">您购买的商品为：<%=productId%>，<%=productName%>
        </p>
        <p class="lead font-weight-normal">感谢您的支持，您的订单正在处理中。</p>
        <p class="lead font-weight-normal">我们将免费为您配送到以下地址:</p>
        <p class="lead font-weight-bold"><%=u.getAddr()%>
        </p>
        <a class="btn btn-outline-secondary" href="shop.jsp">继续购物</a>

        <%} else {%>
        <h1 class="display-4 font-weight-normal">您并未下单</h1>
        <p class="lead font-weight-normal">很抱歉，我们没有检查到您的订单。</p>
        <p class="lead font-weight-normal">如果您确实下单了也不要担心，系统可能遇到了故障，但您的订单会在恢复后被正常处理。</p>
        <a class="btn btn-outline-secondary" href="shop.jsp">去下个单</a><%}%>
    </div>
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
                <li class="float-left">Boosted by <a href="https://www.jsdelivr.com">Jsdelivr</a> for the fast web
                    browsing experience.
                </li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <p class="text-small float-right">Copyright © 2020 刘天赋 @ <a href="http://www.hbnu.edu.cn/">HBNU</a>. All
                Rights
                Reserverd. </p>
        </div>
    </div>
</footer>
</body>