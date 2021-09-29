package com.web;

import com.google.gson.Gson;
import com.service.StudentService;
import com.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
/*
    请求方式：post
    请求地址："/ajaxDel"
    请求参数：{'delAcc': 'admin'}
    参数：delAcc - 账号

    返回格式：json字符串
    返回参数：
    {"status":1,"value\":"删除成功!"}
    {"status":0,"value\":"删除失败!"}
    参数：status - 状态，删除成功，返回修改行数 [>0 成功 ==0 失败]
         value - 弹出提示
 */
@WebServlet(name = "ajaxDel", urlPatterns = "/ajaxDel")
public class ajaxDel extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=UTF-8");
        try {
            String acc = request.getParameter("delAcc");

            String resJson = "";

            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getValue().equals(acc)){
                    resJson = "{\"status\":-1,\"value\":\"不能删除当前登录用户，删除失败!\"}";
                    response.getWriter().println(resJson);
                    return;
                }
            }


            StudentService service = new StudentServiceImpl();
            Integer delOneFlag = service.delOne(acc);

            // 设置插入状态，拼接json字符串

            if (delOneFlag > 0) {
                resJson = "{\"status\":" + delOneFlag + ",\"value\":\"删除成功!\"}";
            } else {
                resJson = "{\"status\":" + delOneFlag + ",\"value\":\"删除失败!\"}";
            }
            response.getWriter().println(resJson);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
