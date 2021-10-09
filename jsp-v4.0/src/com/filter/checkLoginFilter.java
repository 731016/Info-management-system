package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
    防止用户直接输入地址，跳过登录。
    通过session设置login标识，存储用户名，此session只会在登录后设置。
*/
//@WebFilter(filterName = "checkLoginFilter", urlPatterns = {"/*"})
public class checkLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        // 获取请求的uri地址
        String requestURI = request.getRequestURI();
        // 请求登录页面
        if (requestURI.contains("login.jsp")) {
            // 判断cookie是否存在，免登陆
            if (request.getCookies() == null) {
//                request.getRequestDispatcher("login.jsp").forward(req, resp);
                response.sendRedirect("login.jsp");
                return;
            }
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cookie_login")) {
                    response.sendRedirect("stu_list.jsp");
//                    request.getRequestDispatcher("stu_list.jsp").forward(req, resp);
                    return;
                }
            }
        }
        // 判断 请求 登录页面，登录表单提交，登录后的session不为空，允许
        if (requestURI.contains("login.jsp") || requestURI.contains("loginSvl") || request.getSession().getAttribute("login") != null) {
            chain.doFilter(req, resp);
            return;
        }
        response.sendRedirect("login.jsp");

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
