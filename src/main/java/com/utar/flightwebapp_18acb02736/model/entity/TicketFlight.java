package com.utar.flightwebapp_18acb02736.model.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "ticket_flights", schema = "flightdb")
public class TicketFlight {
    @EmbeddedId
    private TicketFlightId id;

    @MapsId("ticketNo")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ticket_no", nullable = false)
    private Ticket ticketNo;

    @MapsId("flightId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "flight_id", nullable = false)
    private Flight flight;

    @Column(name = "fare_conditions", nullable = false, length = 10)
    private String fareConditions;

    @Column(name = "amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal amount;

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getFareConditions() {
        return fareConditions;
    }

    public void setFareConditions(String fareConditions) {
        this.fareConditions = fareConditions;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public Ticket getTicketNo() {
        return ticketNo;
    }

    public void setTicketNo(Ticket ticketNo) {
        this.ticketNo = ticketNo;
    }

    public TicketFlightId getId() {
        return id;
    }

    public void setId(TicketFlightId id) {
        this.id = id;
    }
}