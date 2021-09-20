<%@ page import="com.service.StudentService" %>
<%@ page import="com.service.impl.StudentServiceImpl" %>
<%@ page import="com.pojo.Student" %><%--

  登录处理页面
  boot_reg_to.jsp

  设置session "login":student.getAccount() 账户名(登录用户的数据库用户名)
  请求转发到 stu_list.jsp

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=UTF-8");
    //用户输入
    String account = request.getParameter("account");
    String pwd = request.getParameter("pwd");

    StudentService service = new StudentServiceImpl();
    Student student = service.selectOne(account);
    // student对象为注册页面[stu_list.jsp]的a链接
    if (student != null && account.equals(student.getAccount()) && pwd.equals(student.getPwd())) {
        session.setAttribute("login", student.getAccount());//设置session
//        session.setMaxInactiveInterval(30); //session失效时间30s

        if (request.getParameter("rem") != null) {
            Cookie cookieLogin = new Cookie("cookie_login", student.getAccount());
            cookieLogin.setMaxAge(30);
            response.addCookie(cookieLogin);
        }
        request.getRequestDispatcher("stu_list.jsp").forward(request, response);//请求转发
    } else {
        out.write("<script>alert('账号或密码不正确！');location='bootstrap_register.jsp';</script>");
    }
%>
