package com.kh.app02.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("KhFilter.init");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("AdminFilter.doFilter start@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        HttpSession session = ((HttpServletRequest)servletRequest).getSession();
        Object LoginAdminVo = session.getAttribute("loginAdminVo");
        filterChain.doFilter(servletRequest,servletResponse);
        //    if(LoginAdminVo != null ) {
        //          filterChain.doFilter(servletRequest, servletResponse);
        //      }else {
        //         ((HttpServletResponse)servletResponse).sendRedirect("/adminLoginPage");
        //     }
        //     System.out.println("KhFilter.doFilter end~~");
    }

    @Override
    public void destroy() {
        System.out.println("KhFilter.destroy");
    }
}
