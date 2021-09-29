package com.web;

import com.google.gson.Gson;
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
import java.util.List;
/*
    查询当前登录的用户名

    请求方式：post
    请求地址："/select"
    请求参数：无参数
    
    返回格式：json字符串
    返回参数：Student序列化后的json字符串
    格式：{'account':'admin','pwd':'123','sex':'男','educ':'本科','happy':'玩游戏,学习'}
 */
@WebServlet(name = "ajaxSelect",urlPatterns = "/select")
public class ajaxSelect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        StudentService service = new StudentServiceImpl();
        try {
            // 获取登录时的session，用户名
            String login = String.valueOf(request.getSession().getAttribute("login"));
            // 查询信息，返回对象
            Student student = service.selectOne(login);
            Gson gson = new Gson();
            // 对象序列化为json字符串
            String stuToJson = gson.toJson(student);
            System.out.println(stuToJson);
            // 响应给客户端
            response.getWriter().println(stuToJson);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
