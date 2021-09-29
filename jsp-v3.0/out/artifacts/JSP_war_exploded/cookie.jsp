<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/18
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*
        验证cookie信息，免登陆
     */
    if (request.getCookies()==null){
        response.sendRedirect("login.jsp");
        return;
    }
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("cookie_login")){
            response.sendRedirect("stu_list.jsp");
            return;
        }
    }
%>