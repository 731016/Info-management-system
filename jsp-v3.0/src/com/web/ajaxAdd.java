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
/*
    请求方式：post
    请求地址："/ajaxAdd"
    
    请求参数：{'json': jsonData}
    参数：json - 请求获取的名称
         jsonData - 值为json字符串，为了序列化为对象
         格式：{'account':'admin','pwd':'123','sex':'男','educ':'本科','happy':'玩游戏,学习,旅游'}
    
    返回格式：json字符串
    返回参数：
    {"status":1,"value\":"添加成功!"}
    {"status":0,"value\":"添加失败!"}
 */
@WebServlet(name = "ajaxAdd", urlPatterns = "/ajaxAdd")
public class ajaxAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取json字符串
        String jsonData = request.getParameter("json");
        Gson gson = new Gson();
        // 反序列化为对象
        Student student = gson.fromJson(jsonData, Student.class);

        StudentService service = new StudentServiceImpl();
        try {
            Integer insertFlag = service.insertStudent(student);
            // 设置插入状态，拼接json字符串
            String resJson = "";
            if (insertFlag > 0) {
                resJson = "{\"status\":" + insertFlag + ",\"value\":\"添加成功!\"}";
            } else {
                resJson = "{\"status\":" + insertFlag + ",\"value\":\"添加失败!\"}";
            }
            // 响应给客户端
            response.getWriter().println(resJson);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
