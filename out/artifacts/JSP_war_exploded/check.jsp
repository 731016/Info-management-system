<%--
    判断用户session，防止跳过登录验证
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("login")==null){
        response.sendRedirect("bootstrap_register.jsp");
        return;
    }
%>