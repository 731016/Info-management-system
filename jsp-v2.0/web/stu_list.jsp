<%@ page import="com.service.StudentService" %>
<%@ page import="com.service.impl.StudentServiceImpl" %>
<%@ page import="com.pojo.Student" %>
<%@ page import="java.util.List" %>
<%--导入用户是否登陆检查--%>
<%@ include file="check.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>用户列表</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        li {
            list-style: none;
        }

        .table > tbody > tr > td,
        .table > tbody > tr > th
        {
            text-align: center;
            margin: 0 auto;
        }

        #data {
            padding-left: 10px;
            color: salmon;
            font-weight: 700;
            font-family: 'Consolas';
        }
    </style>
</head>
<body>
<%
    StudentService service = new StudentServiceImpl();
    List<Student> students = service.selectAll();
%>
<a href="register.jsp">添加用户</a>
<a href="/exit">退出</a>
<%
    if (application.getAttribute("peopleNum") == null) {
        application.setAttribute("peopleNum", 1);
    } else {
        int num = Integer.parseInt(application.getAttribute("peopleNum").toString());
        num++;
        application.setAttribute("peopleNum", num);
    }
%>
<h4>当前访问量：<%=application.getAttribute("peopleNum").toString()%>
</h4>

<table>
    <tr>
        <th>当前登录账号</th>
        <th id="data"></th>
    </tr>
</table>

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
        <td><a href="/del?acc=<%=students.get(i).getAccount()%>" name="del" class="btn btn-danger" role="button">删除</a>
        </td>
    </tr>
    <%}%>
</table>


<script>
    $(function () {
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '/select',
            success: function (data) {
                $('#data').text(data.account);
            },
            error: function (resopnse) {
                document.write(resopnse.responseText);
            }
        });
    });
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
