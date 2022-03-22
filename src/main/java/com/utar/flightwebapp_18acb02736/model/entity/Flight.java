package com.utar.flightwebapp_18acb02736.model.entity;

import javax.persistence.*;
import java.time.OffsetDateTime;

@Entity
@NamedQuery(name = "Flight.findbyId", query = "SELECT e FROM Flight e WHERE e.id = :id")
@NamedQuery(name = "Flight.findAll", query = "SELECT e FROM Flight e")

@Table(name = "flights", schema = "flightdb")
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "flight_id", nullable = false)
    private Integer id;

    @Column(name = "flight_no", nullable = false, length = 6)
    private String flightNo;

    @Column(name = "scheduled_departure", nullable = false)
    private OffsetDateTime scheduledDeparture;

    @Column(name = "scheduled_arrival", nullable = false)
    private OffsetDateTime scheduledArrival;

    @Basic(fetch = FetchType.LAZY)
    @Column(name = "departure_airport", nullable = false)
    private String airportsData;

    @Basic(fetch = FetchType.LAZY)
    @Column(name = "arrival_airport", nullable = false)
    private String airportsData1;

    @Column(name = "status", nullable = false, length = 20)
    private String status;

    @Basic(fetch = FetchType.LAZY)
    @Column(name = "aircraft_code", nullable = false)
    private String aircraftsData;

    @Column(name = "actual_departure")
    private OffsetDateTime actualDeparture;

    @Column(name = "actual_arrival")
    private OffsetDateTime actualArrival;

    public OffsetDateTime getActualArrival() {
        return actualArrival;
    }

    public void setActualArrival(OffsetDateTime actualArrival) {
        this.actualArrival = actualArrival;
    }

    public OffsetDateTime getActualDeparture() {
        return actualDeparture;
    }

    public void setActualDeparture(OffsetDateTime actualDeparture) {
        this.actualDeparture = actualDeparture;
    }

    public String getAircraftsData() {
        return aircraftsData;
    }

    public void setAircraftsData(String aircraftsData) {
        this.aircraftsData = aircraftsData;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAirportsData1() {
        return airportsData1;
    }

    public void setAirportsData1(String airportsData1) {
        this.airportsData1 = airportsData1;
    }

    public String getAirportsData() {
        return airportsData;
    }

    public void setAirportsData(String airportsData) {
        this.airportsData = airportsData;
    }

    public OffsetDateTime getScheduledArrival() {
        return scheduledArrival;
    }

    public void setScheduledArrival(OffsetDateTime scheduledArrival) {
        this.scheduledArrival = scheduledArrival;
    }

    public OffsetDateTime getScheduledDeparture() {
        return scheduledDeparture;
    }

    public void setScheduledDeparture(OffsetDateTime scheduledDeparture) {
        this.scheduledDeparture = scheduledDeparture;
    }

    public String getFlightNo() {
        return flightNo;
    }

    public void setFlightNo(String flightNo) {
        this.flightNo = flightNo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}