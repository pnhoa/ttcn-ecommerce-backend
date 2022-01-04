package com.ttcn.ecommerce.backend.app;

import com.ttcn.ecommerce.backend.app.entity.Cart;
import com.ttcn.ecommerce.backend.app.entity.Customer;
import com.ttcn.ecommerce.backend.app.entity.Product;
import com.ttcn.ecommerce.backend.app.repository.CartRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import java.math.BigDecimal;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Rollback(false)
public class CartTests {
    @Autowired
    private CartRepository cartRepo;

    @Autowired
    private TestEntityManager entityManager;

    @Test
    public void testAddCart(){

        Customer customer = entityManager.find(Customer.class, 0);
        Cart cart = new Cart();
        cart.setCustomer(customer);
        cart.setAddress("Sdawdsadw");
        cart.setNote("sdadsadad");
        cart.setTotal_cost(new BigDecimal(1023));
        cart.setCreatedBy("SDSad");
        cart.setModefiedBy("sadasd");
        Cart savedCart = cartRepo.save(cart);


    }
}
