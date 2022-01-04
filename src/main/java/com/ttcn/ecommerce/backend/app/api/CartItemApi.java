package com.ttcn.ecommerce.backend.app.api;

import com.sun.istack.NotNull;
import com.ttcn.ecommerce.backend.app.entity.Cart;
import com.ttcn.ecommerce.backend.app.entity.CartItem;
import com.ttcn.ecommerce.backend.app.service.CartItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cartItems")
public class CartItemApi {
    @Autowired
    private CartItemService cartItemService;

    @GetMapping(value = { "", "/" })
    public @NotNull
    Iterable<CartItem> getAllCartItems() {
        return cartItemService.getAll();
    }

    @GetMapping(value = { "/{cid}" })
    public @NotNull CartItem getCartItem(long id) {
        return cartItemService.getCartItem(id);
    }
}
