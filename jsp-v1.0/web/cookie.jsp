<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/18
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getCookies()==null){
        response.sendRedirect("bootstrap_register.jsp");
        return;
    }
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("cookie_login")){
            response.sendRedirect("bootstrap_register.jsp");
            return;
        }
    }
%>
