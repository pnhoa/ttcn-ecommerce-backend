package com.ttcn.ecommerce.backend.app.service;

import com.ttcn.ecommerce.backend.app.entity.Cart;
import com.ttcn.ecommerce.backend.app.entity.Customer;
import com.ttcn.ecommerce.backend.app.exception.ResourceNotFoundException;
import com.ttcn.ecommerce.backend.app.repository.CartItemRepository;
import com.ttcn.ecommerce.backend.app.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CartService {
    @Autowired
    private CartRepository cartRepo;
    @Autowired
    private CartItemRepository cartItemRepo;


    public Iterable<Cart> getAllCarts() {
        return cartRepo.findAll();
    }

    public Cart getCart(long id) {
        return cartRepo
                .findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found"));
    }

    public List<Cart> findAllCartByCustomer(Customer customer){
        return cartRepo.findByCustomer(customer);
    }

}
