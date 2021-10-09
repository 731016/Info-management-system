package com.web;

import com.pojo.Student;
import com.service.StudentService;
import com.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "alterSvl", urlPatterns = "/stu_detail")
public class alterSvl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String alter_acc = request.getParameter("acc");
        String alter_sex = request.getParameter("sex");
        String alter_educ = request.getParameter("educ");
        String[] alter_happy = request.getParameterValues("happy");
        StringBuilder sb = new StringBuilder();
        for (String s : alter_happy) {
            sb.append(s + ",");
        }
        Student student = new Student(alter_acc, null, alter_sex, alter_educ, sb.toString().substring(0, sb.lastIndexOf(",")));
        System.out.println(student);
        StudentService service = new StudentServiceImpl();
        try {
            Integer alterFlag = service.alterOne(student);
            System.out.println("修改成功，受影响行数：" + alterFlag);
            HttpSession session = request.getSession();
            session.setAttribute("acc", alter_acc);
            PrintWriter out = response.getWriter();
            out.write("<script>alert('修改成功！');location='stu_detail.jsp';</script>");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
