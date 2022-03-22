package com.utar.flightwebapp_18acb02736.model.entity;

import com.fasterxml.jackson.databind.JsonNode;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import com.vladmihalcea.hibernate.type.json.JsonStringType;
import com.vladmihalcea.hibernate.type.json.JsonType;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import javax.persistence.*;
import java.util.HashMap;
import java.util.Map;

@TypeDefs({
        @TypeDef(name = "json", typeClass = JsonType.class),
        @TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
})

@Entity
@NamedQuery(name = "Ticket.findbyId", query = "SELECT e FROM Ticket e WHERE e.id = :id")
@NamedQuery(name = "Ticket.findAll", query = "SELECT e FROM Ticket e")
@Table(name = "tickets", schema = "flightdb")
public class Ticket {
    @Id
    @Column(name = "ticket_no", nullable = false, length = 13)
    private String id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "book_ref", nullable = false)
    private Booking bookings;

    @Column(name = "passenger_id", nullable = false, length = 20)
    private String passengerId;

    @Lob
    @Type(type = "org.hibernate.type.TextType")
    @Column(name = "passenger_name", columnDefinition = "text", nullable = false)
    private String passengerName;

    @Type(type = "json")
    @Column(name = "contact_data", columnDefinition = "jsonb")
    private String contactData;

    public String getContactData() {
        return contactData;
    }

    public void setContactData(String contactData) {
        this.contactData = contactData;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(String passengerId) {
        this.passengerId = passengerId;
    }

    public Booking getBookings() {
        return bookings;
    }

    public void setBookings(Booking bookings) {
        this.bookings = bookings;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}