package com.ttcn.ecommerce.backend.app.dto;


import com.ttcn.ecommerce.backend.app.entity.BaseEntity;
import com.ttcn.ecommerce.backend.app.entity.Cart;
import com.ttcn.ecommerce.backend.app.entity.Product;

import javax.persistence.*;

public class CartItemDTO extends AbstractDTO {
    private long cartId;

    private Product product;


    private int quantity;

    private int status;


    public long getCartId() {
        return cartId;
    }

    public void setCartId(long cartId) {
        this.cartId = cartId;
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
