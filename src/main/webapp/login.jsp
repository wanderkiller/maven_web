<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 6/16/2020
  Time: 9:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.liutianfu.tools.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String login = request.getParameter("action");
    if (login != null && login.equals("login")) {
        String username = request.getParameter("userName");
        String password = request.getParameter("userPassword");
        User u = null;
        try {
            u = UserManager.userExits(username, password);
        } catch (UserNotFoundException e) {
            out.println("用户不存在！！");
            return;
        } catch (PasswordNotCorrectException e) {
            out.println("密码不正确！！");
            return;
        }
        session.setAttribute("user", u);
        //重定向到首页
        response.sendRedirect("index.jsp");
        return;
    }
%>
<%
    User u = (User) session.getAttribute("user");
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <base href="<%=basePath%>">

    <title>登陆页面</title>
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
<div class="bg-login">
    <nav class="site-header sticky-top py-1 row">
        <div class="container d-flex flex-column flex-md-row justify-content-between">
            <a class="py-2 d-none d-md-inline-block" href="index.jsp">J2ee项目</a>
            <a class="py-2 d-none d-md-inline-block" href="index.jsp">主页</a>
            <a class="py-2 d-none d-md-inline-block" href="shop.jsp">商店</a>
            <a class="py-2 d-none d-md-inline-block" href="order.jsp">订单通知</a>
            <%
                if (u == null) {
            %>
            <a class="py-2 float-md-left" href="register.jsp">注册账号</a>
            <%
            } else {
            %>
            <a class="py-2 d-none d-md-inline-block" href="account.jsp">欢迎您: <%=u.getUsername()%>
            </a><%}%>
        </div>
    </nav>
    <div class="container">
        <div class="py-lg-5 form row justify-content-center">
            <form action="login.jsp" method="post" class="form-horizontal" id="login_form">
                <input type="hidden" name="action" value="login"/>
                <h3 class="form-title justify-content-center">登录</h3>
                <div class="justify-content-center">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <label>
                            <input class="form-control required" type="text" placeholder="用户名" name="userName"
                                   autofocus="autofocus" maxlength="20"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <label>
                            <input class="form-control required" type="password" placeholder="密码" name="userPassword"
                                   maxlength="8"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/> 记住我
                        </label>
                        <hr/>
                        <a href="register.jsp" id="register_btn" class="item_link">创建账号</a>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-dark pull-right" value="登录 "/>
                    </div>
                </div>
            </form>
        </div>
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
</body>
</html>
