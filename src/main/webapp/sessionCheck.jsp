<%--
  Created by IntelliJ IDEA.
  User: xxxav
  Date: 6/19/2020
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.liutianfu.tools.*" %>
<%
    //检查用户有没有登录
    User u = (User)session.getAttribute("user");
    if(u == null){
        out.println("请先登录");
        response.sendRedirect("login.jsp");
        return;
    }
%>