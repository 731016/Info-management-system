<%@ page import="com.service.StudentService" %>
<%@ page import="com.service.impl.StudentServiceImpl" %><%--
  删除用户信息处理

  重定向回用户列表页面stu_list.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    StudentService service=new StudentServiceImpl();
    Integer delCount = service.delOne(request.getParameter("acc"));
    System.out.println("删除行数："+delCount);
    response.sendRedirect("stu_list.jsp");
%>
