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
