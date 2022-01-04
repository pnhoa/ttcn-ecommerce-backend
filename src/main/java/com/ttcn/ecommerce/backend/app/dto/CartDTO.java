package com.ttcn.ecommerce.backend.app.dto;


import com.ttcn.ecommerce.backend.app.entity.BaseEntity;
import com.ttcn.ecommerce.backend.app.entity.CartItem;
import com.ttcn.ecommerce.backend.app.entity.Customer;
import com.ttcn.ecommerce.backend.app.validation.ValidUsername;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CartDTO extends AbstractDTO {

    private Customer customer;

    private String note;

    private BigDecimal total_cost;

    @ValidUsername
    @NotNull(message = "is required")
    private String address;

    private List<CartItem> cartItems = new ArrayList<>();

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

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

    public BigDecimal getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(BigDecimal total_cost) {
        this.total_cost = total_cost;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
