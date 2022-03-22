package com.utar.flightwebapp_18acb02736.model.entity;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class TicketFlightId implements Serializable {
    private static final long serialVersionUID = -7893078813268667696L;
    @Column(name = "ticket_no", nullable = false, length = 13)
    private String ticketNo;
    @Column(name = "flight_id", nullable = false)
    private Integer flightId;

    public Integer getFlightId() {
        return flightId;
    }

    public void setFlightId(Integer flightId) {
        this.flightId = flightId;
    }

    public String getTicketNo() {
        return ticketNo;
    }

    public void setTicketNo(String ticketNo) {
        this.ticketNo = ticketNo;
    }

    @Override
    public int hashCode() {
        return Objects.hash(ticketNo, flightId);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        TicketFlightId entity = (TicketFlightId) o;
        return Objects.equals(this.ticketNo, entity.ticketNo) &&
                Objects.equals(this.flightId, entity.flightId);
    }
}