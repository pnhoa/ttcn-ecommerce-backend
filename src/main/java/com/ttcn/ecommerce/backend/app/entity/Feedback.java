package com.ttcn.ecommerce.backend.app.entity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "feedback")
public class Feedback extends BaseEntity{
    

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    @JsonIgnoreProperties("feedbacks")
    private Product product;


    // @ManyToOne(fetch = FetchType.EAGER)
    // @JoinColumn(name = "customer_id")
    // @JsonIgnoreProperties("feedbacks")
    // private Customer customer;

    @Column(name = "rating", nullable = false)
    private int rating;


    public Product getProduct() {
        return product;
    }


    public void setProduct(Product product) {
        this.product = product;
    }


    public int getRating() {
        return rating;
    }


    public void setRating(int rating) {
        this.rating = rating;
    }


    public Feedback() {
        super();
    }



}
