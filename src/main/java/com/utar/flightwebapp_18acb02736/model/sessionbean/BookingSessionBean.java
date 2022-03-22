package com.utar.flightwebapp_18acb02736.model.sessionbean;

import com.utar.flightwebapp_18acb02736.model.entity.Booking;
import com.utar.flightwebapp_18acb02736.model.entity.Flight;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.OffsetDateTime;
import java.util.List;

@Stateless
public class BookingSessionBean implements BookingSessionBeanLocal {
    @PersistenceContext(unitName = "default")
    EntityManager bk;

    public List<Booking> getAllBooking() throws EJBException {
        return bk.createNamedQuery("Booking.findAll").getResultList();
    }

    public List<Booking> readBooking(int currentPage, int recordsPerPage, String keyword, String direction) throws
            EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = bk.createNativeQuery("SELECT * FROM flightdb.bookings order by book_ref" + direction, Booking.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = bk.createNativeQuery("SELECT * from flightdb.bookings WHERE concat(book_ref, book_date, total_amount) LIKE ? order by book_ref" + direction, Booking.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
//        q = bk.createNativeQuery("SELECT * FROM flightdb.bookings order by book_ref" , Booking.class);
//        int start = currentPage * recordsPerPage - recordsPerPage;

        //use of setMaxResults --> to replace LIMIT & setFirstResult --> to replace OFFSET
        List<Booking> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    public int getNumberOfRows(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = bk.createNativeQuery("SELECT COUNT(*) AS totalrow FROM flightdb.bookings");
        } else {
            q = bk.createNativeQuery("SELECT COUNT(*) AS totalrow from flightdb.bookings WHERE concat(book_ref, book_date, total_amount) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");
        }
//        q = bk.createNativeQuery("SELECT COUNT(*) AS totalrow FROM flightdb.bookings");
        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }

    public Booking findBooking(String id) throws EJBException {
        Query q = bk.createNamedQuery("Booking.findbyId");
        q.setParameter("id", String.valueOf(id));
        return (Booking) q.getSingleResult();
    }

    public void updateBooking(String[] s) throws EJBException {
        OffsetDateTime bookdate = null;
        BigDecimal totalamt = null;

        System.out.println("update problem");
        Booking booking = findBooking(s[0]);

        String firstrec = s[1] + ":00+08:00";

        try {
            bookdate = OffsetDateTime.parse(firstrec);
            totalamt = new BigDecimal(s[2]);

        } catch (Exception ex) {
            System.out.println("OffsetDateTime problem comes up!!!");
            System.out.println(firstrec);
            System.out.println(bookdate);
            System.out.println(totalamt);
        }

        System.out.println("total amount: " + s[2] + totalamt);
        booking.setBookDate(bookdate);
        booking.setTotalAmount(totalamt);
        bk.persist(booking);
    }

    public void deleteBooking(String id) throws EJBException {
        Booking e = findBooking(id);
        bk.remove(e);
    }

    public void addBooking(String[] s) throws EJBException {
        OffsetDateTime bookdate = null;
        BigDecimal totalamt = null;

        System.out.println("update problem");
        Booking booking = new Booking();

        String firstrec = s[1] + ":00+08:00";

        try {
            bookdate = OffsetDateTime.parse(firstrec);
            totalamt = new BigDecimal(s[2]);

        } catch (Exception ex) {
            System.out.println("OffsetDateTime problem comes up!!!");
            System.out.println(firstrec);
            System.out.println(bookdate);
            System.out.println(totalamt);
        }

        booking.setId(s[0]);
        booking.setBookDate(bookdate);
        booking.setTotalAmount(totalamt);
        bk.persist(booking);
    }
}
