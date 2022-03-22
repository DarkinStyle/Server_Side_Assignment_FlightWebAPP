package com.utar.flightwebapp_18acb02736.model.sessionbean;

import com.utar.flightwebapp_18acb02736.model.entity.Flight;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.OffsetDateTime;
import java.util.List;

@Stateless
public class FlightSessionBean implements FlightSessionBeanLocal {

    @PersistenceContext(unitName= "default")
    EntityManager em;

    public List<Flight> getAllFlight() throws EJBException {
        return em.createNamedQuery("Flight.findAll").getResultList();
    }

    public List<Flight> readFlight(int currentPage, int recordsPerPage, String keyword, String direction) throws
            EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM flightdb.flights order by flight_id" + direction, Flight.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * from flightdb.flights WHERE concat(flight_id,flight_no,scheduled_departure,scheduled_arrival,departure_airport,arrival_airport,status,aircraft_code,actual_departure,actual_arrival) LIKE ? order by flight_id" + direction, Flight.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
//        q = em.createNativeQuery("SELECT * FROM flightdb.flights order by flight_id" , Flight.class);
//        int start = currentPage * recordsPerPage - recordsPerPage;
        //use of setMaxResults --> to replace LIMIT & setFirstResult --> to replace OFFSET
        List<Flight> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    public int getNumberOfRows(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM flightdb.flights");
        } else {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow from flightdb.flights WHERE concat(flight_id,flight_no,scheduled_departure,scheduled_arrival,departure_airport,arrival_airport,status,aircraft_code,actual_departure,actual_arrival) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");
        }
//        q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM flightdb.flights");
//        concat(flight_id,flight_no,scheduled_departure,scheduled_arrival,departure_airport,arrival_airport,status,aircraft_code,actual_departure,actual_arrival)
        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }

    public Flight findFlight(String id) throws EJBException {
        Query q = em.createNamedQuery("Flight.findbyId");
        q.setParameter("id", Integer.valueOf(id));
        return (Flight) q.getSingleResult();
    }

    public void updateFlight(String[] s) throws EJBException {
        OffsetDateTime schdep = null;
        OffsetDateTime scharr = null;
        OffsetDateTime actdep = null;
        OffsetDateTime actarr = null;

        //System.out.println("update problem");
        Flight flight = findFlight(s[0]);

        String firstrec = s[2] + ":00+08:00";
        String secondrec = s[3] + ":00+08:00";
        String thirdrec = s[8] + ":00+08:00";
        String fourthrec = s[9] + ":00+08:00";

        try {
            schdep = OffsetDateTime.parse(firstrec);
            scharr = OffsetDateTime.parse(secondrec);
            actdep = OffsetDateTime.parse(thirdrec);
            actarr = OffsetDateTime.parse(fourthrec);
        } catch (Exception ex) {
            System.out.println("OffsetDateTime problem comes up!!!");
            System.out.println(firstrec);
            System.out.println(schdep);
        }

        flight.setScheduledDeparture(schdep);
        flight.setScheduledArrival(scharr);
        flight.setStatus(s[6]);
        flight.setAircraftsData(s[7]);
        flight.setActualDeparture(actdep);
        flight.setActualArrival(actarr);

        em.persist(flight);
    }

    public void deleteFlight(String id) throws EJBException {
        Flight e = findFlight(id);
        em.remove(e);
    }

    public void addFlight(String[] s) throws EJBException {
        OffsetDateTime schdep = null;
        OffsetDateTime scharr = null;
        OffsetDateTime actdep = null;
        OffsetDateTime actarr = null;

        System.out.println("Add Flight checkpoint");
        System.out.println(s[3]);
        Flight flight = new Flight();

        String firstrec = s[2] + ":00+08:00";
        String secondrec = s[3] + ":00+08:00";

//        if (s[8] == "" && s[9] == "") {
//
//            try {
//                schdep = OffsetDateTime.parse(firstrec);
//                scharr = OffsetDateTime.parse(secondrec);
//            } catch (Exception ex) {
//                System.out.println("OffsetDateTime problem comes up!!!");
//                System.out.println(firstrec);
//                System.out.println(schdep);
//            }
//
//        }
//        else if (s[8] == "") {
//
//        }
        String thirdrec = s[8] + ":00+08:00";
        String fourthrec = s[9] + ":00+08:00";

        try {
            schdep = OffsetDateTime.parse(firstrec);
            scharr = OffsetDateTime.parse(secondrec);
            actdep = OffsetDateTime.parse(thirdrec);
            actarr = OffsetDateTime.parse(fourthrec);
        } catch (Exception ex) {
            System.out.println("OffsetDateTime problem comes up!!!");
            System.out.println(firstrec);
            System.out.println(schdep);
        }

        flight.setFlightNo(s[1]);
        flight.setScheduledDeparture(schdep);
        flight.setScheduledArrival(scharr);
        flight.setAirportsData(s[4]);
        flight.setAirportsData1(s[5]);
        flight.setStatus(s[6]);
        flight.setAircraftsData(s[7]);
        flight.setActualDeparture(actdep);
        flight.setActualArrival(actarr);

        em.persist(flight);
    }

}
