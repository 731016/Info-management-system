<%@ page import="com.pojo.Student" %>
<%@ page import="com.service.StudentService" %>
<%@ page import="com.service.impl.StudentServiceImpl" %><%--
  修改处理
  获取get请求表单信息

  修改成功，js跳转stu_detail.jsp 本页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String alter_acc = request.getParameter("acc");
    String alter_sex = request.getParameter("sex");
    String alter_educ = request.getParameter("educ");
    String[] alter_happy = request.getParameterValues("happy");
    StringBuilder sb = new StringBuilder();
    for (String s : alter_happy) {
        sb.append(s+",");
    }
    Student student = new Student(alter_acc, null, alter_sex, alter_educ, sb.toString().substring(0,sb.lastIndexOf(",")));
    System.out.println(student);
    StudentService service = new StudentServiceImpl();
    Integer alterFlag = service.alterOne(student);
    System.out.println("修改成功，受影响行数：" + alterFlag);
    session.setAttribute("acc",alter_acc);
    out.write("<script>alert('修改成功！');location='stu_detail.jsp';</script>");
%>
