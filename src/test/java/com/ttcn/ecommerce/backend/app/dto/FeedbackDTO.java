package com.ttcn.ecommerce.backend.app.dto;

import com.ttcn.ecommerce.backend.app.entity.Product;

public class FeedbackDTO extends AbstractDTO{
    
    private int rate;

    private Product product;

    private Long productId;

    private CustomerDTO customerDTO;

    private Long customerId;

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public CustomerDTO getCustomerDTO() {
        return customerDTO;
    }

    public void setCustomerDTO(CustomerDTO customerDTO) {
        this.customerDTO = customerDTO;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    


}
