package com.utar.flightwebapp_18acb02736.model.sessionbean;

import com.utar.flightwebapp_18acb02736.model.entity.Ticket;

import javax.ejb.EJBException;
import javax.ejb.Local;
import java.util.List;

@Local
public interface TicketSessionBeanLocal {

    public List<Ticket> getAllTicket() throws EJBException;
    public Ticket findTicket(String id) throws EJBException;
    public List<Ticket> readTicket(int currentPage, int recordsPerPage, String keyword, String direction)throws EJBException;
    public int getNumberOfRows(String keyword) throws EJBException;
    public void updateTicket(String[] s) throws EJBException;
    public void deleteTicket(String id) throws EJBException;
    public void addTicket(String[] s) throws EJBException;
}
