package com.utar.flightwebapp_18acb02736.controller;

import com.utar.flightwebapp_18acb02736.model.entity.Flight;
import com.utar.flightwebapp_18acb02736.model.sessionbean.FlightSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FlightServlet", value = "/FlightServlet")
public class FlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private FlightSessionBeanLocal flightbean;

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
            int rows = flightbean.getNumberOfRows(keyword);
            nOfPages = rows / recordsPerPage;
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }
            List<Flight> lists = flightbean.readFlight(currentPage, recordsPerPage, keyword, direction);
            request.setAttribute("flights", lists);
        } catch (EJBException ex) {
        }

        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);
        RequestDispatcher dispatcher = request.getRequestDispatcher("flightpagination.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
