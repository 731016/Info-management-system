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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">

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
<form action="/register" class="from_main text-center" method="post">
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
        <label for="man">男</label>
        <input type="radio" name="sex" value="男" id="man">
        <label for="gril">女</label>
        <input type="radio" name="sex" value="女" id="gril">
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
        <label class="col-sm-2 control-label">爱好</label>
        <div class="col-sm-10">
            <label class="checkbox-inline">
                <input type="checkbox" name="happy" value="玩游戏"> 玩游戏
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="happy" value="学习"> 学习
            </label>
            <label class="checkbox-inline">
                <input type="checkbox" name="happy" value="旅游"> 旅游
            </label>
        </div>
    </div>
    <span></span>
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-success sub" id="sub">from提交</button>
        <button type="button" class="btn btn-primary btn-success sub" id="ajaxSub">异步提交</button>
        <button type="reset" class="btn btn-primary btn-danger sub">重置</button>
    </div>
    <div class="form-group">
        <a href="stu_list.jsp" class="btn btn-info" role="button">用户列表页</a>
        <a href="login.jsp" class="btn btn-info" role="button">登录页面</a>
    </div>
</form>
</body>
<script>
    $(function () {
        //4到16位（字母，数字，下划线，减号）
        let uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
        //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
        let pPattern = /^\d{3,10}$/;
        let flagAcc = false;
        let flagPwd = false;
        $("#inputAccount").blur(function () {
            if ($(this).val() == "") {
                $(this).parent().parent().next().text("");
                return;
            }

            if (!uPattern.test($(this).val())) {
                if ($(this).val() == "") {
                    $(this).parent().parent().next().text("");
                    return;
                }
                $(this).parent().parent().next().text("用户名格式错误，4到16位（字母，数字，下划线，减号）").css("color", "red");

            } else {
                $(this).parent().parent().next().text("用户名格式正确").css("color", "green");
                flagAcc = true;
                // 验证用户名是否注册
                $.ajax({
                    type: 'post',
                    data: {'ajaxAccount': $('#inputAccount').val()},
                    data_type: 'text',
                    url: '/register',
                    success: function (data) {
                        $('#inputAccount').parent().parent().next().text(data);
                    },
                    error: function (res) {
                        $('#inputAccount').parent().parent().next().text(res.responseText);
                    }
                });
            }
        });
        $("#inputPassword").blur(function () {
            if ($(this).val() == "") {
                $(this).parent().parent().next().text("");
                return;
            }
            if (!pPattern.test($(this).val())) {
                $(this).parent().parent().next().text("密码格式错误，必须是3-10位的数字").css("color", "red");

            } else {
                $(this).parent().parent().next().text("密码格式正确").css("color", "green");
                flagPwd = true;
            }
        });

        $("form").submit(function () {
            if (flagAcc == false || flagPwd == false) {

                console.log(flagAcc);
                console.log(flagPwd);
                return false;
            }
        })
        // 正则验证失败，不提交

        // 异步提交注册
        $('#ajaxSub').click(function () {
            if (flagAcc == false || flagPwd == false) {
                return false;
            }
            let inputAccount = $('#inputAccount').val();
            let inputPassword = $('#inputPassword').val();
            let sex = $('input[name="sex"]:checked').val();

            let educ = $('select[name="educ"]').val();
            let happy = $('input[name="happy"]:checked');

            let happys = "";
            $.each(happy, function (index, obj) {
                happys += $(obj).val();
                happys += ",";
            })
            happys = happys.substring(0, happys.lastIndexOf(","));
            let jsonData = "{'account':'" + inputAccount + "','pwd':'" + inputPassword + "','sex':'" + sex + "','educ':'" + educ + "','happy':'" + happys + "'}";
            console.log(jsonData);
            $.ajax({
                type: 'post',
                data: {'json': jsonData},
                dataType: 'json',
                url: '/ajaxAdd',
                success: function (data) {
                    alert(data.value);
                    location = '/login.jsp';
                },
                error: function (res) {
                    document.write(res.responseText);
                }
            })
        });
    });
</script>
</html>
