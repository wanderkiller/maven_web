<%--
  Created by IntelliJ IDEA.
  User: liutianfu
  Date: 6/19/2020
  Time: 5:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="sessionCheck.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if (action != null && action.equals("modify")) {
        String username = request.getParameter("username");
        //String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        if (username != null && !username.trim().equals("")) {
            u.userUpdate(username, phone, addr);
        }
%>
<!--这里会有个问题应为缓存没有清理，session中还是保留原来的user信息，所以看到前面user的信息是不变的-->
<!--弹出成功的提示-->
<script type="text/javascript">
    alert("修改成功");
    //跳转到登陆页面
    window.location = 'index.jsp'
</script>
;
<%
        return;//下面的内容就不执行了
    }
%>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <base href="<%=basePath%>">
    <title>账号管理</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link href="static/css/bootstrap.css" rel="stylesheet">
    <link href="static/css/custom_global.css" rel="stylesheet">
</head>

<body class="bg-light">
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
        <%
        } else {
        %>
        <a class="py-2 d-none d-md-inline-block" href="account.jsp">欢迎您: <%=u.getUsername()%>
        </a><%}%>
    </div>
</nav>

<div class="container">
    <div class="py-5 text-center">
        <h2>个人中心</h2>
        <p class="lead">你可以在此处管理自己的账号信息，包括但不限于更新地址，管理邮箱和安全退出。</p>
    </div>
    <div class="col-md-8 offset-2 ">
        <h4 class="mb-3">账号详情</h4>
        <form class="needs-validation" action="account.jsp" method="post">
            <input type="hidden" name="action" value="modify"/>
            <div class="mb-3">
                <label>用户名</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">@</span>
                    </div>
                    <input type="text" class="form-control" name="username" placeholder="Username"
                           value="<%=u.getUsername() %>" required>
                </div>
            </div>

            <div class="mb-3">
                <label>电子邮箱</label>
                <input type="email" class="form-control" name="email" placeholder="you@example.com">
            </div>
            <div class="mb-3">
                <label>手机号 <span class="text-muted"></span></label>
                <input type="text" class="form-control" name="phone" value="<%=u.getPhone() %>"/>
            </div>
            <div class="mb-3">
                <label>地址</label>
                <input type="text" class="form-control" name="addr" value="<%=u.getAddr()%>" placeholder="具体到街道" required>
            </div>

            <div class="mb-3">
                <label>地址 2 <span class="text-muted">(可选)</span></label>
                <input type="text" class="form-control" name="address2" placeholder="具体门牌号">
            </div>

            <div class="row">
                <div class="col-md-5 mb-3">
                    <label>国家和地区</label>
                    <select class="custom-select d-block w-100" name="country" required>
                        <option value="">选择...</option>
                        <option>中国大陆</option>
                        <option>中国香港</option>
                        <option>中国台湾</option>
                        <option>新加坡</option>
                        <option>马来西亚</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label>省份</label>
                    <select class="custom-select d-block w-100" id="state" required>
                        <option value="">选择...</option>
                        <option>北京</option>
                        <option>上海</option>
                        <option>广州</option>
                        <option>深圳</option>
                    </select>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="zip">邮编</label>
                    <input type="text" class="form-control" id="zip" placeholder="" required>
                </div>
            </div>
            <hr class="mb-4">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="same-address">
                <label class="custom-control-label" for="same-address">邮寄地址和我的账单地址一致</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="save-info">
                <label class="custom-control-label" for="save-info">暂时保存以备下次修改</label>
            </div>
            <hr class="mb-4">
            <div class="row">
                <button class="col-md-5 btn btn-dark" type="submit">提交</button>
                <button class="col-md-5 offset-md-2 btn btn-danger"
                        onclick="window.location.href='logout.jsp'">退出
                </button>
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
</body>
</html>
