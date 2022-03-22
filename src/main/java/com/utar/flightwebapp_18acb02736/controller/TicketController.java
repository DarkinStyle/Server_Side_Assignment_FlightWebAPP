package com.utar.flightwebapp_18acb02736.controller;

import com.utar.flightwebapp_18acb02736.model.entity.Ticket;
import com.utar.flightwebapp_18acb02736.model.sessionbean.TicketSessionBeanLocal;
import com.utar.flightwebapp_18acb02736.utilities.TicketValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TicketController", value = "/TicketController")
public class TicketController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private TicketSessionBeanLocal ticketbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if(session.getAttribute("tempname") == null ) {
            response.sendRedirect("index.html");
        }

        System.out.println("Ticket Controller: at doGet ");
        String id = request.getParameter("id");
        System.out.println("Ticket Controller: at doGet 2");
        try {
            Ticket ticket = ticketbean.findTicket(id);
            request.setAttribute("selectedticket", ticket);
            System.out.println("um zhi qing");
            RequestDispatcher req = request.getRequestDispatcher("TicketUpdate.jsp");
            System.out.println("last 0");
            req.forward(request, response);
            System.out.println("last");
        } catch (EJBException ex) {
            System.out.println("Um tek ah");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if(session.getAttribute("tempname") == null ) {
            response.sendRedirect("index.html");
        }

        String ticketno = request.getParameter("ticketno");
        String bookref = request.getParameter("bookref");
        String passengerid = request.getParameter("passengerid");
        String passengerfname = request.getParameter("passengerfname");
        String passengerlname = request.getParameter("passengerlname");
        String contactemail = request.getParameter("contactemail");
        String contactphone = request.getParameter("contactphone");

        System.out.println(ticketno + bookref + passengerid + passengerfname + passengerlname + contactemail + contactphone);
        System.out.println("post" + request.getPathInfo());
        System.out.println("post" + request.getRequestURI());
        System.out.println("post" + request.getRequestURL());
        String passengerFULLname = passengerfname + " " +  passengerlname;

        PrintWriter out = response.getWriter();
        String[] s = { ticketno, bookref, passengerid, passengerFULLname, contactemail, contactphone };

        try {
            if (TicketValidateManageLogic.validateManager(request).equals("UPDATE")) {

                ticketbean.updateTicket(s);
            }
            else if (TicketValidateManageLogic.validateManager(request).equals("DELETE")) {

                System.out.println("try" + request.getRequestURI());
                System.out.println("try" + request.getRequestURL());
                ticketbean.deleteTicket(ticketno);

            } else {

                ticketbean.addTicket(s);
            }

            TicketValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
            out.println("<SCRIPT type=\"text/javascript\">");
            out.println("alert(\"Alert!!! Input Error\")"); out.println("window.location.assign(\"TicketServlet?currentPage=1&recordsPerPage=70&keyword=&direction=ASC\")");
            out.println("</SCRIPT>");
        }

    }
}
