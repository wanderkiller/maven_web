<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 6/16/2020
  Time: 9:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.liutianfu.tools.*" %>
<%@ page import="com.liutianfu.*" %>
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
    <link rel="stylesheet" href="static/css/custom.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>

</head>
<body>
    <div class="bg-login">
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
            <div class="container">
                <a class="navbar-brand" href="#">J2ee项目</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">主页<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.jsp">商品</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp">购物车</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">个人中心</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="https://www.baidu.com/baidu" target="_blank">
                        <input name=tn type=hidden value=baidu>
                        <input class="form-control mr-sm-2" type="text" name="word" placeholder="输入搜索内容" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
                    </form>
                </div>
            </div>
        </nav>
        <div class="container align-items-baseline">
            <br>
            <br>
            <br>
            <br>
            <br>
            <div class="form row justify-content-center">
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
                            <a href="register.jsp" id="register_btn" class="">创建账号</a>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-success pull-right" value="登录 "/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="container">
        <footer class="card-footer bg-light"><p class="float-left">Copyright © 2020 刘天赋 @ <a href="http://www.hbnu.edu.cn/">HBNU</a>. All Rights Reserverd. </p> <p class="float-right">Built with <a href="https://getbootstrap.com/">Bootstrap</a>, an open source project by <a href="https://twitter.com">Twitter, Inc.</a> </p> </footer>
    </div>
</body>
</html>
