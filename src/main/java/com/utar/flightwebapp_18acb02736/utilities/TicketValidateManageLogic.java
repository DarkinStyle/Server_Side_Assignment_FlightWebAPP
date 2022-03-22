package com.utar.flightwebapp_18acb02736.utilities;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;

public class TicketValidateManageLogic {

    public static String validateManager(HttpServletRequest request) {
        if(request.getParameter("UPDATE")!=null&&request.getParameter("UPDATE").equals("UPDATE")) { return "UPDATE";
        }
        else if (request.getParameter("DELETE") != null && request.getParameter("DELETE").equals("DELETE")) {
            System.out.println("valid: "+ request.getRequestURI());
            System.out.println("valid: "+ request.getRequestURL());
            return "DELETE";
        }
        return "ADD";
    }
    // this method is used to notify a user that a record has been updated and to
// redirect to another page
    public static void navigateJS(PrintWriter out) {
        out.println("<SCRIPT type=\"text/javascript\">");
        out.println("alert(\"Record has been updated and url will be redirected\")"); out.println("window.location.assign(\"TicketServlet?currentPage=1&recordsPerPage=70&keyword=&direction=ASC\")");
        out.println("</SCRIPT>");
    }

}
