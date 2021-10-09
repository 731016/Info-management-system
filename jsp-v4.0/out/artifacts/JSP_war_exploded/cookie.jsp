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
