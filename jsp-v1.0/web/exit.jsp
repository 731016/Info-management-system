<%--
  用户退出

  删除session
  重定向回bootstrap_register.jsp 登录页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    session.removeAttribute("login");
    session.invalidate();
    response.sendRedirect("bootstrap_register.jsp");
%>