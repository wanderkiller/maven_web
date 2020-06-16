<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 6/16/2020
  Time: 9:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.liutianfu.tools.User" %>
<%@ page import="com.liutianfu.tools.UserManager" %>
<%@ page import="com.liutianfu.tools.UserNotFoundException" %>
<%@ page import="com.liutianfu.tools.PasswordNotCorrectException" %>
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

    <title>登陆页面</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="http://qbzzanv01.bkt.clouddn.com/css/custom.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>

</head>
<body>
    <div class="bg-login">
        <nav class="navbar navbar-fixed-top my-navbar" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">J2EE项目</a>
                </div>
            </div>
        </nav>
        <div class="container">
            <br>
            <br>
            <br>
            <br>
            <br>
            <div class="form row justify-content-center">
                <form class="form-horizontal" id="login_form">
                    <h3 class="form-title justify-content-center">登录</h3>
                    <div class="justify-content-center">
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <input class="form-control required" type="text" placeholder="用户名" name="username"
                                   autofocus="autofocus" maxlength="20"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="密码" name="password"
                                   maxlength="8"/>
                        </div>
                        <div class="form-group">
                            <label class="checkbox">
                                <input type="checkbox" name="remember" value="1"/> 记住我
                            </label>
                            <hr/>
                            <a href="signup.jsp" id="register_btn" class="">创建账号</a>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-success pull-right" value="登录 "/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
