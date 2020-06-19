<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 6/19/2020
  Time: 5:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="sessionCheck.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    if(action != null && action.equals("modify")){
        String username = request.getParameter("username");
        //String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        if(username != null && !username.trim().equals("")){
            u.userUpdate(username, phone, addr);
        }
%>
<!--这里会有个问题应为缓存没有清理，session中还是保留原来的user信息，所以看到前面user的信息是不变的-->
<!--弹出成功的提示-->
<script type="text/javascript" >
    alert("修改成功");
    //跳转到登陆页面
    window.location='index.jsp'
</script> ;
<%
        return;//下面的内容就不执行了
    }
%>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <base href="<%=basePath%>">
    <title>账号管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/custom_global.css" rel="stylesheet">
</head>

<body class="bg-light">
<nav class="site-header sticky-top py-1 row">
    <div class="container d-flex flex-column flex-md-row justify-content-between">
        <a class="py-2 d-none d-md-inline-block" href="index.jsp">J2ee项目</a>
        <a class="py-2 d-none d-md-inline-block" href="index.jsp">主页</a>
        <a class="py-2 d-none d-md-inline-block" href="shop.jsp">商店</a>
        <a class="py-2 d-none d-md-inline-block" href="#">博客</a>
        <a class="py-2 d-none d-md-inline-block" href="cart.jsp">购物车</a>
        <a class="py-2 d-none d-md-inline-block" href="#">推广页</a>
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
<center>
    <form action="account.jsp" method="post">
        <input type="hidden" name="action" value="modify" />
        <table border="1" width="80%" align="center">
            <tr>
                <td colspan="2" align="center">用户信息修改</td>
            </tr>
            <tr>
                <td>用户姓名：</td>
                <td><input type="text" name="username" value="<%=u.getUsername() %>" /></td>
            </tr>
            <!--
   				<tr>
   					<td>密码：</td>
   					<td><input type="password" name="password" <%=u.getPassword() %> /></td>
   				</tr>
   				 -->
            <tr>
                <td>联系电话：</td>
                <td><input type="text" name="phone" value="<%=u.getPhone() %>" /> </td>
            </tr>
            <tr>
                <td>地址:</td>
                <td><textarea rows="8" cols="60" name="addr"  ><%=u.getAddr()%></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交" />
                    <input type="reset" value="重置" />
                </td>
            </tr>
        </table>

    </form>
</center>
<div class="container">
    <div class="py-5 text-center">
        <h2>个人中心</h2>
        <p class="lead">你可以在此处管理自己的账号信息，包括但不限于更新地址，管理邮箱和安全退出。</p>
    </div>
    <div class="col-md-8 offset-2 ">
        <h4 class="mb-3">账号详情</h4>
        <form class="needs-validation" action="account.jsp" method="post">
            <div class="mb-3">
                <label for="username">用户名</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">@</span>
                    </div>
                    <input type="text" class="form-control" id="username" placeholder="Username" value="<%=u.getUsername() %>" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="email">电子邮箱</label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com">
            </div>
            <div class="mb-3">
                <label for="address2">手机号 <span class="text-muted"></span></label>
                <input type="text" class="form-control" name="phone" value="<%=u.getPhone() %>" />
            </div>
            <div class="mb-3">
                <label for="address">地址</label>
                <input type="text" class="form-control" id="address" placeholder="具体到街道" required>
            </div>

            <div class="mb-3">
                <label for="address2">地址 2 <span class="text-muted">(可选)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="具体门牌号">
            </div>

            <div class="row">
                <div class="col-md-5 mb-3">
                    <label for="country">国家和地区</label>
                    <select class="custom-select d-block w-100" id="country" required>
                        <option value="">选择...</option>
                        <option>中国大陆</option>
                        <option>中国香港</option>
                        <option>中国台湾</option>
                        <option>新加坡</option>
                        <option>马来西亚</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="state">省份</label>
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
                <button class="col-md-5 btn btn-primary btn-lg btn-block" type="submit">提交</button>
                <button class="col-md-5 offset-md-2 btn btn-danger btn-lg btn-block" onclick="window.location.href='logout.jsp'">退出</button>

            </div>
        </form>
    </div>
</div>

<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2020 Company Name</p>
    <ul class="list-inline">
        <li class="list-inline-item"><a href="#">Privacy</a></li>
        <li class="list-inline-item"><a href="#">Terms</a></li>
        <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
</footer>
</body>
</html>
