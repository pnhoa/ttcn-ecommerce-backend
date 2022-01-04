package com.ttcn.ecommerce.backend.app.entity;


import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "cart")
public class Cart extends BaseEntity{
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @Column(name = "note")
    private String note;

    @Column(name = "total_cost")
    private float total_cost;

    @Column(name = "address")
    private String address;


    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }


    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public float getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(float total_cost) {
        this.total_cost = total_cost;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
