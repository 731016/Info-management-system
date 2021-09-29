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
    查询所有用户

    请求方式：post
    请求地址：/selectAll
    请求参数：{}

    返回格式：List<Student>序列化后的json字符串
    格式：
    [
        {"account":"admin","pwd":"123","sex":"男","educ":"本科","happy":"玩游戏,学习,旅游"},
        {"account":"root","pwd":"123","sex":"男","educ":"专科","happy":"玩游戏,旅游"}
    ]
 */
@WebServlet(name = "ajaxSelectAll",urlPatterns = "/selectAll")
public class ajaxSelectAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=UTF-8");

        try {
            StudentService service = new StudentServiceImpl();
            List<Student> students = service.selectAll();
            Gson gson = new Gson();
            String strJson = gson.toJson(students);
            response.getWriter().println(strJson);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
