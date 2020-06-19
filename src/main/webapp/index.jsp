<%--
  Created by IntelliJ IDEA.
  User: xavier
  Date: 6/19/2020
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>项目首页</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/custom.css">
    <script type="text/javascript" src="static/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</head>
<body>
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
<div class="container">
    <footer class="card-footer bg-light"><p class="float-left">Copyright © 2020 刘天赋 @ <a href="http://www.hbnu.edu.cn/">HBNU</a>. All Rights Reserverd. </p> <p class="float-right">Built with <a href="https://getbootstrap.com/">Bootstrap</a>, an open source project by <a href="https://twitter.com">Twitter, Inc.</a> </p> </footer>
</div>
</body>
</html>
