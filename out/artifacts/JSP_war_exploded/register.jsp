<%--
    新增用户

    表单提交给register_do.jsp 注册处理页面
    默认get请求

    用户列表页 stu_list.jsp
    登录页面 bootstrap_register.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@include file="check.jsp"%>--%>
<%--<%@ include file="cookie.jsp"%>--%>
<html>
<head>
    <title>注册页面</title>
    <%--    表单元素提交必须设置name属性--%>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /*.form-control{*/
        /*    width: 40%;*/
        /*}*/
        .sub {
            margin-top: 20px;
        }

        .from_main {
            width: 600px;
            margin: 50px auto;
        }

        .btn-info {
            margin-right: 20px;
        }
    </style>
</head>
<body>
<form action="register_do.jsp" class="from_main text-center">
    <div class="form-group">
        <label for="inputAccount" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-10">
            <input type="text" name="account" class="form-control" id="inputAccount" placeholder="用户名">
        </div>
    </div>
    <span></span>
    <div class="form-group">
        <label for="inputPassword" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-10">
            <input type="password" name="password" class="form-control" id="inputPassword" placeholder="密码">

        </div>
    </div>
    <span></span>
    <div class="form-group">
        <label class="col-sm-2 control-label">性别</label>
        <input type="radio" name="sex" id="inlineRadio1" value="男"> 男
        <input type="radio" name="sex" id="inlineRadio2" value="女"> 女
    </div>
    <span></span>
    <div class="form-group">
        <label class="col-sm-2 control-label">学历</label>
        <div class="col-sm-10">
            <select multiple class="form-control" name="educ">
                <option value="大专">大专</option>
                <option value="本科">本科</option>
                <option value="硕士">硕士</option>
            </select>
        </div>

    </div>
    <span></span>
    <div class="form-group">
        <label for="" class="col-sm-2 control-label">爱好</label>
        <div class="col-sm-10">
            <label class="checkbox-inline">
                <input type="checkbox" name="happy" id="inlineCheckbox1" value="玩游戏"> 玩游戏
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="happy" id="inlineCheckbox2" value="学习"> 学习
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="happy" id="inlineCheckbox3" value="旅游"> 旅游
            </label>
        </div>
    </div>
    <span></span>
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-success sub" id="sub">提交</button>
        <button type="reset" class="btn btn-primary btn-danger sub">重置</button>
    </div>
    <div class="form-group">
        <a href="stu_list.jsp" class="btn btn-info" role="button">用户列表页</a>
        <a href="bootstrap_register.jsp" class="btn btn-info" role="button">登录页面</a>
    </div>
</form>
</body>
<script>
    $(function () {
        //4到16位（字母，数字，下划线，减号）
        var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
        //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
        var pPattern = /^\d{3,10}$/;
        var flag = true;
        $("#inputAccount").blur(function () {
            if (!uPattern.test($(this).val())) {
                $(this).parent().parent().next().text("用户名格式错误，4到16位（字母，数字，下划线，减号）").css("color", "red");
                flag = false;
            } else {
                $(this).parent().parent().next().text("用户名格式正确").css("color", "green");
            }
        });
        $("#inputPassword").blur(function () {
            if (!pPattern.test($(this).val())) {
                $(this).parent().parent().next().text("密码格式错误，必须是3-10位的数字").css("color", "red");
                flag = false;
            } else {
                $(this).parent().parent().next().text("密码格式正确").css("color", "green");
            }
        });

        if (!flag) {
            $("form").submit(function () {
                return false;
            });
        }
    });
</script>
</html>
