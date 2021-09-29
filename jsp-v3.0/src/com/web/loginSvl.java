package com.web;

import com.pojo.Student;
import com.service.StudentService;
import com.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


public class loginSvl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //用户输入
        String account = request.getParameter("account");
        String pwd = request.getParameter("pwd");

        StudentService service = new StudentServiceImpl();
        try {
            Student student = service.selectOne(account);
            // student对象为注册页面[stu_list.jsp]的a链接
            if (student != null && account.equals(student.getAccount()) && pwd.equals(student.getPwd())) {
                HttpSession session = request.getSession();
                session.setAttribute("login", student.getAccount());//设置session
                session.setMaxInactiveInterval(30); //session失效时间30s

                if (request.getParameter("rem") != null) {
                    Cookie cookieLogin = new Cookie("cookie_login", student.getAccount());
                    cookieLogin.setMaxAge(30);
                    response.addCookie(cookieLogin);
                }
                request.getRequestDispatcher("stu_list.jsp").forward(request, response);//请求转发
            } else {
                PrintWriter out = response.getWriter();
                out.write("<script>alert('账号或密码不正确！');location='login.jsp';</script>");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
