<%--
    判断用户session，防止跳过登录验证

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*
    防止用户直接输入地址，跳过登录。
    通过session设置login标识，存储用户名，此session只会在登录后设置。
     */
    if (session.getAttribute("login") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>