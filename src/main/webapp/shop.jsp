<%--
  Created by IntelliJ IDEA.
  User: xxxav
  Date: 6/19/2020
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.liutianfu.tools.*" %>
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
        <a class="py-2 d-none d-md-inline-block" href="#">活动</a>
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

<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
        <h1 class="display-4 font-weight-normal">神秘新品</h1>
        <p class="lead font-weight-normal">相对于水果电商，我们更喜欢味觉贩子这个称呼。致力于搜罗全球的好水果，为顾客提供最新鲜优质的使用体验。</p>
        <a class="btn btn-outline-secondary" href="#">立即查看</a>
    </div>
</div>
<%
    for (Iterator<Product> iterator = products.iterator(); iterator.hasNext(); ) {
%>
<div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
    <% Product p = iterator.next();%>
    <div class="bg-dark text-center text-white overflow-hidden product">
        <div class="overlay">
            <form action="order.jsp" method="post">
                <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                <input type="hidden" name="productName" value="<%=p.getName()%>"/>
                <button type="submit" class="overlay_button btn btn-outline-secondary">立即购买</button>
            </form>
        </div>
        <div class="my-3 py-3">
            <h2 class="display-5"><%= p.getName()%>
            </h2>
            <p class="lead"><%=p.getNormalprice()%>元 / 500克
            </p>
        </div>
        <div class="bd-placeholder-img" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;">
            <img
                    src="static/images/shop/<%=p.getId()%>.jpg" alt="product_img"></div>
    </div>
    <div class="bg-light text-center overflow-hidden product">
        <% p = iterator.next();%>
        <div class="overlay">
            <form action="order.jsp" method="post">
                <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                <input type="hidden" name="productName" value="<%=p.getName()%>"/>
                <button type="submit" class="overlay_button btn btn-outline-secondary">立即购买</button>
            </form>
        </div>
        <div class="my-3 p-3">
            <h2 class="display-5"><%= p.getName()%>
            </h2>
            <p class="lead"><%=p.getNormalprice()%>元 / 500克
            </p>
        </div>
        <div class="bd-placeholder-img" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"><img
                src="static/images/shop/<%=p.getId()%>.jpg" alt="product_img"></div>
    </div>
</div>

<div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
    <div class="bg-light text-center overflow-hidden product">
        <% p = iterator.next();%>
        <div class="overlay">
            <form action="order.jsp" method="post">
                <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                <input type="hidden" name="productName" value="<%=p.getName()%>"/>
                <button type="submit" class="overlay_button btn btn-outline-secondary">立即购买</button>
            </form>
        </div>
        <div class="my-3 p-3">
            <h2 class="display-5"><%= p.getName()%>
            </h2>
            <p class="lead"><%=p.getNormalprice()%>元 / 500克
            </p>
        </div>
        <div class="bd-placeholder-img" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"><img
                src="static/images/shop/<%=p.getId()%>.jpg" alt="product_img"></div>
    </div>
    <div class="bg-primary text-center text-white overflow-hidden product">
        <% p = iterator.next();%>
        <div class="overlay">
            <form action="order.jsp" method="post">
                <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                <input type="hidden" name="productName" value="<%=p.getName()%>"/>
                <button type="submit" class="overlay_button btn btn-outline-secondary">立即购买</button>
            </form>
        </div>
        <div class="my-3 py-3">
            <h2 class="display-5"><%= p.getName()%>
            </h2>
            <p class="lead"><%=p.getNormalprice()%>元 / 500克
            </p>
        </div>
        <div class="bd-placeholder-img" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"><img
                src="static/images/shop/<%=p.getId()%>.jpg" alt="product_img"></div>
    </div>
</div>

<div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
    <div class="bg-light text-center overflow-hidden product">
        <% p = iterator.next();%>
        <div class="overlay">
            <form action="order.jsp" method="post">
                <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                <input type="hidden" name="productName" value="<%=p.getName()%>"/>
                <button type="submit" class="overlay_button btn btn-outline-secondary">立即购买</button>
            </form>
        </div>
        <div class="my-3 p-3">
            <h2 class="display-5"><%= p.getName()%>
            </h2>
            <p class="lead"><%=p.getNormalprice()%>元 / 500克
            </p>
        </div>
        <div class="bd-placeholder-img" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"><img
                src="static/images/shop/<%=p.getId()%>.jpg" alt="product_img"></div>
    </div>
    <div class="bg-light text-center overflow-hidden product">
        <% p = iterator.next();%>
        <div class="overlay">
            <form action="order.jsp" method="post">
                <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                <input type="hidden" name="productName" value="<%=p.getName()%>"/>
                <button type="submit" class="overlay_button btn btn-outline-secondary">立即购买</button>
            </form>
        </div>
        <div class="my-3 py-3">
            <h2 class="display-5"><%= p.getName()%>
            </h2>
            <p class="lead"><%=p.getNormalprice()%>元 / 500克
            </p>
        </div>
        <div class="bd-placeholder-img" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"><img
                src="static/images/shop/<%=p.getId()%>.jpg" alt="product_img"></div>
    </div>
</div>

<%
    }
%>
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
<%--<footer class="container py-5">--%>
<%--    <div class="row">--%>
<%--        <div class="col-12 col-md">--%>
<%--            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mb-2" role="img" viewBox="0 0 24 24" focusable="false"><title>Product</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/></svg>--%>
<%--            <small class="d-block mb-3 text-muted">&copy; 2017-2020</small>--%>
<%--        </div>--%>
<%--        <div class="col-6 col-md">--%>
<%--            <h5>Features</h5>--%>
<%--            <ul class="list-unstyled text-small">--%>
<%--                <li><a class="text-muted" href="#">Cool stuff</a></li>--%>
<%--                <li><a class="text-muted" href="#">Random feature</a></li>--%>
<%--                <li><a class="text-muted" href="#">Team feature</a></li>--%>
<%--                <li><a class="text-muted" href="#">Stuff for developers</a></li>--%>
<%--                <li><a class="text-muted" href="#">Another one</a></li>--%>
<%--                <li><a class="text-muted" href="#">Last time</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <div class="col-6 col-md">--%>
<%--            <h5>Resources</h5>--%>
<%--            <ul class="list-unstyled text-small">--%>
<%--                <li><a class="text-muted" href="#">Resource</a></li>--%>
<%--                <li><a class="text-muted" href="#">Resource name</a></li>--%>
<%--                <li><a class="text-muted" href="#">Another resource</a></li>--%>
<%--                <li><a class="text-muted" href="#">Final resource</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <div class="col-6 col-md">--%>
<%--            <h5>Resources</h5>--%>
<%--            <ul class="list-unstyled text-small">--%>
<%--                <li><a class="text-muted" href="#">Business</a></li>--%>
<%--                <li><a class="text-muted" href="#">Education</a></li>--%>
<%--                <li><a class="text-muted" href="#">Government</a></li>--%>
<%--                <li><a class="text-muted" href="#">Gaming</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--        <div class="col-6 col-md">--%>
<%--            <h5>About</h5>--%>
<%--            <ul class="list-unstyled text-small">--%>
<%--                <li><a class="text-muted" href="#">Team</a></li>--%>
<%--                <li><a class="text-muted" href="#">Locations</a></li>--%>
<%--                <li><a class="text-muted" href="#">Privacy</a></li>--%>
<%--                <li><a class="text-muted" href="#">Terms</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>
<script src="static/js/jquery-3.5.1.min.js"></script>
<script>window.jQuery || document.write('<script src="static/js/jquery-3.5.1.min.js"><\/script>')</script>
<script src="static/js/bootstrap.bundle.js"></script>
</body>
</html>
