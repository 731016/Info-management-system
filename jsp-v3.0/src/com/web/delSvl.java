package com.web;

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
    请求地址："/del"
    请求参数：{'delAcc': delAcc}
        delAcc - 获取名称
        delAcc - 要删除的用户名
    
    重定向：stu_list.jsp
 */
@WebServlet(name = "delSvl",urlPatterns = "/del")
public class delSvl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        StudentService service=new StudentServiceImpl();
        try {
            Integer delCount = service.delOne(request.getParameter("acc"));
            System.out.println("删除行数："+delCount);
            response.sendRedirect("stu_list.jsp");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
