package com.utar.flightwebapp_18acb02736.controller;

import com.utar.flightwebapp_18acb02736.model.entity.Flight;
import com.utar.flightwebapp_18acb02736.model.sessionbean.FlightSessionBeanLocal;
import com.utar.flightwebapp_18acb02736.utilities.FlightValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "FlightController", value = "/FlightController")
public class FlightController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private FlightSessionBeanLocal flightbean;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if(session.getAttribute("tempname") == null ) {
            response.sendRedirect("index.html");
        }

        System.out.println("um zhi qing 0");
        String id = request.getParameter("id");

        try {
            Flight flight = flightbean.findFlight(id);
            request.setAttribute("selectedflight", flight);
            RequestDispatcher req = request.getRequestDispatcher("FlightUpdate.jsp");
            req.forward(request, response);
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

        String flightid = request.getParameter("flightid");
        String flightno = request.getParameter("flightno");
        String scheddep = request.getParameter("scheddep");
        String schedarr = request.getParameter("schedarr");
        String depairport = request.getParameter("depairport");
        String arrairport = request.getParameter("arrairport");
        String status = request.getParameter("status");
        String aircraftcode = request.getParameter("aircraftcode");
        String actdep = request.getParameter("actdep");
        String actarr = request.getParameter("actarr");

        PrintWriter out = response.getWriter();
        String[] s = { flightid, flightno, scheddep, schedarr, depairport, arrairport, status, aircraftcode, actdep, actarr };

        try {
            if (FlightValidateManageLogic.validateManager(request).equals("UPDATE")) {

                flightbean.updateFlight(s);
            }
            else if (FlightValidateManageLogic.validateManager(request).equals("DELETE")) {

                flightbean.deleteFlight(flightid);

            } else {

                flightbean.addFlight(s);
            }

            FlightValidateManageLogic.navigateJS(out);
        } catch (EJBException ex) {
            out.println("<SCRIPT type=\"text/javascript\">");
            out.println("alert(\"Alert!!! Input Error\")"); out.println("window.location.assign(\"FlightServlet?currentPage=1&recordsPerPage=70&keyword=&direction=ASC\")");
            out.println("</SCRIPT>");
        }
    }
}
