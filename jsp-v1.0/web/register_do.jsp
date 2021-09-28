<%@ page import="java.util.Enumeration" %>
<%@ page import="com.pojo.Student" %>
<%@ page import="com.service.StudentService" %>
<%@ page import="com.service.impl.StudentServiceImpl" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Collections" %><%--
  处理新增用户

  获取get请求表单数据
  注册成功跳转bootstrap_register.jsp 登录页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--处理请求--%>
<%
    //设置request的编码方式
    request.setCharacterEncoding("utf-8");
    //设置response的编码方式
    response.setCharacterEncoding("utf-8");
    //接收客户端表单提交的数据
    String account = request.getParameter("account");
    String pwd = request.getParameter("password");
    String educ = request.getParameter("educ");
    // 获取多个name相同的表单数据
    String[] sexs = request.getParameterValues("sex");
    String[] parameterValues = request.getParameterValues("happy");
    String happy = "";
    for (String value : parameterValues) {
        happy += value;
        happy += ",";
    }
    happy = happy.substring(0, happy.lastIndexOf(","));
    Student stu = new Student(account, pwd, sexs[0], educ, happy);
    StudentService service = new StudentServiceImpl();
    Integer insertFlag = service.insertStudent(stu);
    System.out.println("插入成功,修改行数：" + insertFlag);
    response.sendRedirect("bootstrap_register.jsp");
%>