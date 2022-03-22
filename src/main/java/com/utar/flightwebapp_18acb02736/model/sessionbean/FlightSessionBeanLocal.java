package com.utar.flightwebapp_18acb02736.model.sessionbean;

import com.utar.flightwebapp_18acb02736.model.entity.Flight;

import javax.ejb.EJBException;
import javax.ejb.Local;
import java.util.List;

@Local
public interface FlightSessionBeanLocal {

    public List<Flight> getAllFlight() throws EJBException;
    public Flight findFlight(String id) throws EJBException;
    public List<Flight> readFlight(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public int getNumberOfRows(String keyword) throws EJBException ;
    public void updateFlight(String[] s) throws EJBException;
    public void deleteFlight(String id) throws EJBException;
    public void addFlight(String[] s) throws EJBException;
}
