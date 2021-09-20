<%@ page import="com.service.StudentService" %>
<%@ page import="com.service.impl.StudentServiceImpl" %>
<%@ page import="com.pojo.Student" %>
<%@ page import="java.util.List" %>
<%--导入用户是否登陆检查--%>
<%@ include file="check.jsp"%>
<%--
  所有用户名列表
  stu_list.jsp

  session:"login"为空 ,重定向bootstrap_register.jsp 回登陆页面

  点击用户名 超链接跳转到 stu_detail.jsp?acc=用户名
  点击删除 超链接跳转到 del.jsp?acc=用户名
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>用户列表</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
          integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
    <style>
        li {
            list-style: none;
        }
        .table>tbody>tr>td{
            text-align: center;
        }
    </style>
</head>
<body>
<%
    StudentService service = new StudentServiceImpl();
    List<Student> students = service.selectAll();
%>
<a href="register.jsp">添加用户</a>
<a href="exit.jsp">退出</a>
<%
    if (application.getAttribute("peopleNum")==null){
        application.setAttribute("peopleNum",1);
    }else{
        int num = Integer.parseInt(application.getAttribute("peopleNum").toString());
        num++;
        application.setAttribute("peopleNum",num);
    }
%>
<h4>当前访问量：<%=application.getAttribute("peopleNum").toString()%></h4>
    <table class="table table-bordered">
        <tr>
            <th>用户账号</th>
            <th>操作</th>
        </tr>
        <%
            for (int i = 0; i < students.size(); i++) {%>
        <tr>
            <td><a href="stu_detail.jsp?acc=<%=students.get(i).getAccount()%>"
                   name="detail" class="btn btn-info" role="button"><%=students.get(i).getAccount()%>
            </a></td>
            <td><a href="del.jsp?acc=<%=students.get(i).getAccount()%>" name="del" class="btn btn-danger" role="button">删除</a></td>
        </tr>
        <%}%>
    </table>
<script>
    var delBtn = document.getElementsByName("del");
    for (let i = 0; i < delBtn.length; i++) {
        delBtn[i].onclick = function () {
            let flag = confirm("确定要删除吗？");
            if (!flag) {
                return false;
            }
        }
    }
</script>
</body>
</html>
