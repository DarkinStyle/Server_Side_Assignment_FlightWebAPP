package com.utar.flightwebapp_18acb02736.controller;

import com.utar.flightwebapp_18acb02736.model.entity.Ticket;
import com.utar.flightwebapp_18acb02736.model.sessionbean.TicketSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TicketServlet", value = "/TicketServlet")
public class TicketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private TicketSessionBeanLocal ticketbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if(session.getAttribute("tempname") == null ) {
            response.sendRedirect("index.html");
        }

        int nOfPages = 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");

        try {
            int rows = ticketbean.getNumberOfRows(keyword);
            nOfPages = rows / recordsPerPage;
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }
            List<Ticket> lists = ticketbean.readTicket(currentPage, recordsPerPage, keyword, direction);
            request.setAttribute("tickets", lists);
        } catch (EJBException ex) {
            System.out.println("come");
        }

        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ticketpagination.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
