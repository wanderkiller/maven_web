<%--
  Created by IntelliJ IDEA.
  User: xxxav
  Date: 6/19/2020
  Time: 9:28 PM
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
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>test</h2>
<%
    for (Product p : products) {
%>
<h2><%=p.getName()%></h2><%}%>
</body>
</html>
