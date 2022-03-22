package com.utar.flightwebapp_18acb02736.model.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.OffsetDateTime;

@Entity
@NamedQuery(name = "Booking.findbyId", query = "SELECT b FROM Booking b WHERE b.id = :id")
@NamedQuery(name = "Booking.findAll", query = "SELECT b FROM Booking b")


@Table(name = "bookings", schema = "flightdb")
public class Booking {
    @Id
    @Column(name = "book_ref", nullable = false, length = 6)
    private String id;

    @Column(name = "book_date", nullable = false)
    private OffsetDateTime bookDate;

    @Column(name = "total_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalAmount;

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public OffsetDateTime getBookDate() {
        return bookDate;
    }

    public void setBookDate(OffsetDateTime bookDate) {
        this.bookDate = bookDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}