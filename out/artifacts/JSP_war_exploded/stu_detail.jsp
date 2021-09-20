<%@ page import="com.service.StudentService" %>
<%@ page import="com.service.impl.StudentServiceImpl" %>
<%@ page import="com.pojo.Student" %>
<%@ page import="java.util.Arrays" %>
<%--导入用户是否登陆检查--%>
<%@ include file="check.jsp" %>
<%--
  用户详情页面

  获取session "login" || 超链接get请求
  为空 重定向登录页

  表单提交alter.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户详情页面</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
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
</style>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String acc = request.getParameter("acc"); //链接请求 用户列表点击用户名
    Student stuInfo = null;
    String account = (String) session.getAttribute("acc"); //session 修改成功后获取session
    if (acc == null && account == null) {
        request.getRequestDispatcher("bootstrap_register.jsp").forward(request, response);
//            response.sendRedirect("bootstrap_register.jsp");
    } else {
        //是，获取get、请求的参数
        StudentService service = new StudentServiceImpl();
        if (acc == null) {
            stuInfo = service.selectOne(account);
        } else {
            stuInfo = service.selectOne(acc);
        }
    }
%>
<a href="stu_list.jsp">返回用户列表</a>
<form action="alter.jsp">
    <table class="table .table-bordered table-hover">
        <tr>
            <th>用户名</th>
            <th>性别</th>
            <th>学历</th>
            <th>爱好</th>
            <th>操作</th>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="acc" value="<%= stuInfo.getAccount()%>"/>
                <label><%= stuInfo.getAccount()%>
                </label>

            </td>
            <td>
                <input type="radio" name="sex" value="男">男
                <input type="radio" name="sex" value="女">女

            </td>
            <td>
                <select name="educ">
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                </select>
            </td>
            <td>
                <input type="checkbox" name="happy" value="玩游戏">玩游戏
                <input type="checkbox" name="happy" value="学习">学习
            </td>
            <td>
                <input type="submit" value="修改" class="btn btn-warning" role="button">
            </td>
        </tr>
    </table>
</form>
<script>
    $(function () {
        var arrstr = "<%=stuInfo.getHappy()%>"; //获取爱好数据传递给js变量
        var strings = arrstr.split(",");
        $('input[name="sex"][value="<%=stuInfo.getSex()%>"]').prop('checked', true);
        $('input[name="educ"][value="<%= stuInfo.getEduc() %>"]').prop('selected', true);
        // 使用js的forEach方法
        $.each(strings, function () {
            $('input[type="checkbox"][value="' + this + '"]').prop('checked', true);
        });
    });
</script>

</body>
</html>
