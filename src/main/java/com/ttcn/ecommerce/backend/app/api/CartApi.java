package com.ttcn.ecommerce.backend.app.api;

import com.sun.istack.NotNull;
import com.ttcn.ecommerce.backend.app.entity.Cart;
import com.ttcn.ecommerce.backend.app.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/carts")
public class CartApi {

    @Autowired
    private CartService cartService;

    @GetMapping(value = { "", "/" })
    public @NotNull Iterable<Cart> getCarts() {
        return cartService.getAllCarts();
    }

    @GetMapping(value = { "/{cid}" })
    public @NotNull Cart getCart(long id) {
        return cartService.getCart(id);
    }
}
