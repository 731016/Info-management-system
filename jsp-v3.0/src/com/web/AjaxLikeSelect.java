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
import java.util.List;
/*
    请求方式：post
    请求地址："/ajaxSelect"
    
    请求参数：{'acc':username}
    参数：acc - 请求获取的名称
         username - 用户名
         格式：'admin'
    
    返回格式：json字符串
    返回参数：List<Student>序列化后的json字符串
    格式：{'account':'admin','pwd':'123','sex':'男','educ':'本科','happy':'玩游戏,学习'}
 */
@WebServlet(name = "AjaxLikeSelect",urlPatterns = "/ajaxSelect")
public class AjaxLikeSelect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=UTF-8");
        try{
            String account = request.getParameter("acc");
            StudentService service=new StudentServiceImpl();
            List<Student> students = service.selectAll("%"+account+"%");
            Gson gson =new Gson();
            String strJson = gson.toJson(students);
            response.getWriter().println(strJson);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
