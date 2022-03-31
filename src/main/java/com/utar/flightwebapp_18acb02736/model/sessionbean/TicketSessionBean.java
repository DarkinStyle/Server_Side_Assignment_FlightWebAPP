package com.utar.flightwebapp_18acb02736.model.sessionbean;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.utar.flightwebapp_18acb02736.model.entity.Booking;
import com.utar.flightwebapp_18acb02736.model.entity.ContactData;
import com.utar.flightwebapp_18acb02736.model.entity.Ticket;
import org.junit.Test;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

@Stateless
public class TicketSessionBean implements TicketSessionBeanLocal{

    @PersistenceContext(unitName= "default")
    EntityManager tck;

    private static final long serialVersionUID = 1L;
    @EJB
    private BookingSessionBeanLocal bookingbean;

    public List<Ticket> getAllTicket() throws EJBException {
        return tck.createNamedQuery("Ticket.findAll").getResultList();
    }

    public List<Ticket> readTicket(int currentPage, int recordsPerPage, String keyword, String direction) throws
            EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = tck.createNativeQuery("SELECT * FROM flightdb.tickets order by ticket_no" + direction, Ticket.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = tck.createNativeQuery("SELECT * from flightdb.tickets WHERE concat(ticket_no, book_ref, passenger_id, passenger_name, contact_data) LIKE ? order by ticket_no" + direction, Ticket.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
//        q = tck.createNativeQuery("SELECT * FROM flightdb.tickets order by ticket_no" , Ticket.class);
//        int start = currentPage * recordsPerPage - recordsPerPage;
        List<Ticket> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    public int getNumberOfRows(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = tck.createNativeQuery("SELECT COUNT(*) AS totalrow FROM flightdb.tickets");
        } else {
            q = tck.createNativeQuery("SELECT COUNT(*) AS totalrow from flightdb.tickets WHERE concat(ticket_no, book_ref, passenger_id, passenger_name, contact_data) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");
        }
//        q = tck.createNativeQuery("SELECT COUNT(*) AS totalrow FROM flightdb.tickets");
        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }

    public Ticket findTicket(String id) throws EJBException {
        Query q = tck.createNamedQuery("Ticket.findbyId");
        q.setParameter("id", String.valueOf(id));
        return (Ticket) q.getSingleResult();
    }

    public void updateTicket(String[] s) throws EJBException {

        System.out.println("update problem");
        Ticket ticket = findTicket(s[0]);

        // Pass the s[4] & s[5] to the contact data class as object
        ContactData contactdata = new ContactData(s[4], s[5]);


        //TODO contactdata parameter need explicit conversion from string to jsonb (Please research on jsonb in Postgresql/SQL on how to work in java, string conversion)
        ObjectMapper objectmapper = new ObjectMapper();
        String jsonContactData = null;
        try {
            jsonContactData = objectmapper.writeValueAsString(contactdata);
            System.out.println(jsonContactData);
        } catch (IOException e) {
            e.printStackTrace();
        }

        ticket.setPassengerId(s[2]);
        ticket.setPassengerName(s[3]);
        ticket.setContactData(jsonContactData);
        tck.persist(ticket);
    }

    public void deleteTicket(String id) throws EJBException {
        Ticket e = findTicket(id);
        tck.remove(e);
    }

    public void addTicket(String[] s) throws EJBException {

        // Use booking session bean to retrieve a record of the book ref
        Booking booking = bookingbean.findBooking(s[1]);

        Ticket ticket = new Ticket();

        // Pass the s[4] & s[5] to the contact data class as object
        ContactData contactdata = new ContactData(s[4], s[5]);


        //TODO contactdata parameter need explicit conversion from string to jsonb (Please research on jsonb in Postgresql/SQL on how to work in java, string conversion)
        ObjectMapper objectmapper = new ObjectMapper();
        String jsonContactData = null;
        try {
            jsonContactData = objectmapper.writeValueAsString(contactdata);
            System.out.println(jsonContactData);
        } catch (IOException e) {
            e.printStackTrace();
        }

        ticket.setId(s[0]);
        ticket.setBookings(booking);
        ticket.setPassengerId(s[2]);
        ticket.setPassengerName(s[3]);
        ticket.setContactData(jsonContactData);
        tck.persist(ticket);
    }

}
