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
    处理模糊查询请求
    data:{'acc':username}

    接收字符串acc
    返回：被序列化的对象，json格式的字符串
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
