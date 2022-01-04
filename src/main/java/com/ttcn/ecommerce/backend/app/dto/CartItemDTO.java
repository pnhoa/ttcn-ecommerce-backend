package com.ttcn.ecommerce.backend.app.dto;


import com.ttcn.ecommerce.backend.app.entity.BaseEntity;
import com.ttcn.ecommerce.backend.app.entity.Cart;
import com.ttcn.ecommerce.backend.app.entity.Product;

import javax.persistence.*;

public class CartItemDTO extends AbstractDTO {
    private Cart cart;

    private Product product;


    private int quantity;

    private int status;


    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
