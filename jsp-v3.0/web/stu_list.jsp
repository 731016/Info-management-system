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

        #ajaxTable > tbody > tr > td,
        #ajaxTable > thead > tr > th {
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
    <tr>
        <input type="text" placeholder="请输入用户名..." id="username">
        <button type="button" id="likeselect">模糊查询</button>
    </tr>
</table>

<table class="table table-bordered" id="ajaxTable">
    <thead>
    <tr>
        <th>用户账号</th>
        <th>性别</th>
        <th>学历</th>
        <th>爱好</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>

    </tbody>

    <%------------------------
            jsp展示数据 开始
    -------------------------%>
    <%-- <%
         for (int i = 0; i < students.size(); i++) {%>
     <tr>
         <td><a href="stu_detail.jsp?acc=<%=students.get(i).getAccount()%>"
                name="detail" class="btn btn-info" role="button"><%=students.get(i).getAccount()%>
         </a></td>
         <td><a href="/del?acc=<%=students.get(i).getAccount()%>" name="del" class="btn btn-danger" role="button">删除</a>
         </td>
     </tr>
     <%}%>--%>
    <%------------------------
            jsp展示数据 结束
    -------------------------%>
</table>


<script>
    function revealData(data) {
        $('#ajaxTable tbody').empty();
        $.each(data, function (index, obj) {
            let $tr = $('<tr></tr>');
            $tr.append($('<td>' + obj.account + '</td>'));
            $tr.append($('<td>' + obj.sex + '</td>'));
            $tr.append($('<td>' + obj.educ + '</td>'));
            $tr.append($('<td>' + obj.happy + '</td>'));
            $tr.append($('<td><a href="javascript:;" name="del">删除</a></td>'));
            $('#ajaxTable tbody').append($tr);
        });
        $("a[name='del']").on('click', function () {
            if (!confirm('确定要删除吗？')) {
                return false;
            }
            let delAcc = $(this).parent().parent().children().eq(0).text();
            $.ajax({
                type: 'post',
                data: {'delAcc': delAcc},
                dataType: 'json',
                url: 'ajaxDel',
                success: function (data) {
                    alert(data.value);
                },
                error: function (res) {
                    document.write(res.responseText);
                }
            });
            $(this).parent().parent().remove();
        })
    };

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
        /*----------------------------------
            ajax展示数据 开始
         ----------------------------------*/
        $.ajax({
            type: 'post',
            data: {},
            dataType: 'json',
            url: '/selectAll',
            success: function (data) {
                revealData(data)
            },
            error: function (res) {
                $('#ajaxTable').after(res.responseText);
            }
        });

        /*----------------------------------
            ajax展示数据 结束
         ----------------------------------*/


        /*----------------------------------
            ajax模糊查询 开始
         ----------------------------------*/
        $('#likeselect').click(function () {
            var username = $('#username').val();
            $.ajax({
                type: 'post',
                data:{'acc':username},
                dataType:'json',
                url:'/ajaxSelect',
                success:function (data) {
                    revealData(data)
                },
                error:function (res) {
                    $('#ajaxTable').after(res.responseText);
                }
            });
        });
        /*----------------------------------
            ajax模糊查询 结束
         ----------------------------------*/
    });
</script>
</body>
</html>
