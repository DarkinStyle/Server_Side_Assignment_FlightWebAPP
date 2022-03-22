package com.utar.flightwebapp_18acb02736.controller;

import com.utar.flightwebapp_18acb02736.model.entity.Booking;
import com.utar.flightwebapp_18acb02736.model.sessionbean.BookingSessionBeanLocal;
import com.utar.flightwebapp_18acb02736.utilities.BookingValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "BookingController", value = "/BookingController")
public class BookingController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @EJB
    private BookingSessionBeanLocal bookingbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if(session.getAttribute("tempname") == null ) {
            response.sendRedirect("index.html");
        }

        System.out.println("Booking Controller: at doGet ");
        String id = request.getParameter("id");
        System.out.println("Booking Controller: at doGet 2");
        try {
            Booking booking = bookingbean.findBooking(id);
            request.setAttribute("selectedbooking", booking);
            System.out.println("um zhi qing");
            RequestDispatcher req = request.getRequestDispatcher("BookingUpdate.jsp");
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

        String bookref = request.getParameter("bookref");
        String bookdate = request.getParameter("bookdate");
        String totalamt = request.getParameter("totalamt");

        PrintWriter out = response.getWriter();
        String[] s = { bookref, bookdate, totalamt };

        try {
            if (BookingValidateManageLogic.validateManager(request).equals("UPDATE")) {

                bookingbean.updateBooking(s);
            }
            else if (BookingValidateManageLogic.validateManager(request).equals("DELETE")) {

                bookingbean.deleteBooking(bookref);

            } else {

                bookingbean.addBooking(s);
            }

            BookingValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
            out.println("<SCRIPT type=\"text/javascript\">");
            out.println("alert(\"Alert!!! Input Error\")"); out.println("window.location.assign(\"BookingServlet?currentPage=1&recordsPerPage=70&keyword=&direction=ASC\")");
            out.println("</SCRIPT>");
        }


    }
}
