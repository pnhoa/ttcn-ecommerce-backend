package com.ttcn.ecommerce.backend.app.service;

import com.ttcn.ecommerce.backend.app.entity.Cart;
import com.ttcn.ecommerce.backend.app.entity.CartItem;
import com.ttcn.ecommerce.backend.app.exception.ResourceNotFoundException;
import com.ttcn.ecommerce.backend.app.repository.CartItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CartItemService {
    @Autowired
    private CartItemRepository cartItemRepo;
    public List<CartItem> findAllCart(Cart cart){

        return cartItemRepo.findByCart(cart);
    }

    public Iterable<CartItem> getAll() {
        return cartItemRepo.findAll();
    }

    public CartItem getCartItem(long id) {
        return  cartItemRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found"));
    }
}
