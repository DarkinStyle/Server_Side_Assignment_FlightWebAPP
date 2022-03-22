package com.utar.flightwebapp_18acb02736.model.sessionbean;

import com.utar.flightwebapp_18acb02736.model.entity.Booking;

import javax.ejb.EJBException;
import javax.ejb.Local;
import java.util.List;

@Local
public interface BookingSessionBeanLocal {

    public List<Booking> getAllBooking() throws EJBException;
    public Booking findBooking(String id) throws EJBException;
    public List<Booking> readBooking(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public int getNumberOfRows(String keyword) throws EJBException ;
    public void updateBooking(String[] s) throws EJBException;
    public void deleteBooking(String id) throws EJBException;
    public void addBooking(String[] s) throws EJBException;
}
