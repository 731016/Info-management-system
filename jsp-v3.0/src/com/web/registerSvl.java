package com.web;

import com.dao.StudentDao;
import com.pojo.Student;
import com.service.StudentService;
import com.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
/*
    请求方式：post
    请求地址：/register
    请求参数：account 用户名
             password 密码
             sex 性别
             educ 学历
            happy 爱好
    
    重定向：login.jsp
*/
@WebServlet(name = "registerSvl", urlPatterns = "/register")
public class registerSvl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置request的编码方式
        request.setCharacterEncoding("utf-8");
        //设置response的编码方式
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        StudentService service = new StudentServiceImpl();

        //接收客户端表单提交的数据
        String ajaxAccount = request.getParameter("ajaxAccount");
        if (ajaxAccount != null) {
            try {
                Student student = service.selectOne(ajaxAccount);
                if (student == null) {
                    response.getWriter().println("恭喜，该用户名可以注册!");
                } else {
                    response.getWriter().println("用户名已被注册!");
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            return;
        }
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

        try {
            Integer insertFlag = service.insertStudent(stu);
            System.out.println("插入成功,修改行数：" + insertFlag);
            response.sendRedirect("login.jsp");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
