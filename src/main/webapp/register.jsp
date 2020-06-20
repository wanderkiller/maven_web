<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 6/16/2020
  Time: 9:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.liutianfu.tools.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if(action != null && action.equals("register")){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        u.setPhone(phone);
        u.setAddr(addr);
        u.setrDate(new Timestamp(System.currentTimeMillis()));
        u.save();
%>
<!--弹出注册成功的提示-->
<script type="text/javascript" >
    alert("注册成功");
    //跳转到登陆页面
    window.location='login.jsp' ;
</script>
<%
        return;//下面的内容就不执行了
    }
%>
<html lang="zh">
<head>
    <base href="<%=basePath%>">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>注册页面</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/custom_global.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
</head>
<body>


<div class="bg-light">
    <nav class="site-header sticky-top py-1 row">
        <div class="container d-flex flex-column flex-md-row justify-content-between">
            <a class="py-2 d-none d-md-inline-block" href="index.jsp">J2ee项目</a>
            <a class="py-2 d-none d-md-inline-block" href="index.jsp">主页</a>
            <a class="py-2 d-none d-md-inline-block" href="shop.jsp">商店</a>
            <a class="py-2 d-none d-md-inline-block" href="#">活动</a>
            <a class="py-2 d-none d-md-inline-block" href="order.jsp">订单通知</a>
            <a class="py-2 float-md-left" href="login.jsp">登录</a>
        </div>
    </nav>
    <div class="container">
        <div class="form py-lg-5 row justify-content-center">
<%--            选择post方式进行注册--%>
            <form action="register.jsp" method="post" class="form-horizontal" id="register_form">
                <input type="hidden" name="action" value="register"/>
                <h3 class="form-title justify-content-center">账号注册</h3>
                <div class="justify-content-center">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <label>
                            <input class="form-control required" type="text" placeholder="用户名" name="username"
                                   autofocus="autofocus"   maxlength="20"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <label>
                            <input class="form-control required" type="password" placeholder="密码" name="password"
                                   maxlength="8"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <label>
                            <input class="form-control required" type="password" placeholder="确认密码" name="confirmpd"
                                   maxlength="8"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <label>
                            <input class="form-control required" type="text" placeholder="手机号" name="phone"
                                   maxlength="16"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <label>
                            <input class="form-control required" type="text" placeholder="地址" name="addr"
                                   maxlength="16"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-dark pull-right" value="提交"/>
                    </div>
                </div>
            </form>
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
</div>

</body>
</html>
