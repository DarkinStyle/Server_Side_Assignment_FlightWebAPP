package com.utar.flightwebapp_18acb02736.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.utar.flightwebapp_18acb02736.model.entity.Login;
import com.utar.flightwebapp_18acb02736.utilities.ValidateLogin;
import org.apache.commons.io.IOUtils;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext ctx = getServletContext();
        InputStream resourcecontent = ctx.getResourceAsStream("/WEB-INF/loginDetails.json");
        System.out.println("Path" + resourcecontent);

        String result = IOUtils.toString(resourcecontent, StandardCharsets.UTF_8);
        System.out.println("path: " + result);

        String Emailadd = request.getParameter("email");
        String Pass = request.getParameter("password");
        boolean fail = true;

        // Login Validation Check
        boolean check = true;
        check = ValidateLogin.getjson(Emailadd, Pass, result);


        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        if(check) {
            HttpSession hs = request.getSession();
            hs.setAttribute("tempname", Emailadd);
            response.sendRedirect("successLogin.jsp");
        } else {
            request.setAttribute("failLogin", fail);
            RequestDispatcher rd = request.getRequestDispatcher("indexCheck.jsp");
            rd.include(request, response);
        }


    }

}
