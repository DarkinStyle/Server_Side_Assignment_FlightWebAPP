package com.utar.flightwebapp_18acb02736.controller;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

//urlPatterns = {"/TicketUpdate.jsp/*", "/FlightUpdate.jsp/*", "/BookingUpdate.jsp/*", "/Logout.jsp/*"}, servletNames = {"BookingController", "BookingServlet", "FlightController",
//        "FlightServlet", "LoginServlet", "TicketController", "TicketServlet"}

@WebFilter()
public class MyFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {

        System.out.println("Filter initialized");

    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        String validateKey = (String) request.getAttribute("validate");
        if (validateKey != null) {
            System.out.println("Filter Working");
            chain.doFilter(request, response);
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h1>You are not allowed to directly access this resource<h1>");
        }
    }
}
