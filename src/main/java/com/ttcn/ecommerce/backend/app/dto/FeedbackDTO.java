package com.ttcn.ecommerce.backend.app.dto;


public class FeedbackDTO extends AbstractDTO{
    
    private Long product_id;

    // private int customer_id;

    private int rating;

    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public FeedbackDTO() {
    }

    
}
