package com.ttcn.ecommerce.backend.app.api;

import com.sun.istack.NotNull;
import com.ttcn.ecommerce.backend.app.dto.CartDTO;
import com.ttcn.ecommerce.backend.app.dto.MessageResponse;
import com.ttcn.ecommerce.backend.app.dto.ProductDTO;
import com.ttcn.ecommerce.backend.app.entity.Cart;
import com.ttcn.ecommerce.backend.app.entity.Product;
import com.ttcn.ecommerce.backend.app.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/carts")
public class CartApi {

    @Autowired
    private CartService cartService;

    @GetMapping(value = { "", "/" })
    public ResponseEntity<List<Cart>> findAll() {
        List<Cart> listOfCart = cartService.findAll() ;

        if(listOfCart == null || listOfCart.isEmpty() )
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        else
            return new ResponseEntity<>(listOfCart, HttpStatus.OK);
    }

    @GetMapping(value = { "/{cid}" })
    public ResponseEntity<Cart> getCart(@PathVariable("id") long id) {
        Cart cart = cartService.findById(id);
        return new ResponseEntity<>(cart, HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<MessageResponse> createCart(@Valid @RequestBody CartDTO cartDto, BindingResult theBindingResult){

        if(theBindingResult.hasErrors()){
            return new ResponseEntity<>(new MessageResponse("Invalid value for create cart", HttpStatus.BAD_REQUEST, LocalDateTime.now()), HttpStatus.BAD_REQUEST);
        }

        MessageResponse messageResponse = cartService.createCart(cartDto);
        return new ResponseEntity<>(messageResponse, HttpStatus.CREATED);
    }
    @PutMapping("/{id}")
    public ResponseEntity<MessageResponse> updateCart(@PathVariable("id") Long theId,
                                                         @Valid @RequestBody CartDTO cartDto, BindingResult bindingResult){

        if(bindingResult.hasErrors()){
            return new ResponseEntity<>(new MessageResponse("Invalid value for update product", HttpStatus.BAD_REQUEST, LocalDateTime.now()), HttpStatus.BAD_REQUEST);
        }

        MessageResponse messageResponse = cartService.updateCart(theId, cartDto);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProduct(@PathVariable("id") Long theId){

        cartService.deleteCart(theId);
        return new ResponseEntity<>(new MessageResponse("Delete cart successfully!", HttpStatus.OK, LocalDateTime.now()), HttpStatus.OK);
    }

    @GetMapping("/customer/{customerId}")
    public ResponseEntity<List<Cart>> findCartsByCustomerId(@PathVariable("customerId") Long customerId ){

        List<Cart> carts = cartService.findByCustomerId(customerId);
        return new ResponseEntity<>(carts, HttpStatus.OK);

    }

}
