package com.ttcn.ecommerce.backend.app.repository;

import com.ttcn.ecommerce.backend.app.entity.Cart;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CartRepository extends JpaRepository<Cart, Long> {

    @Query("SELECT c from Cart c WHERE c.customer.id=?1")
    List<Cart> findByCustomer(Long customerId);

    Page<Cart> findById(Long id, Pageable pageable);

    Page<Cart> findByCustomerId(Long customerId, Pageable pageable);
}

