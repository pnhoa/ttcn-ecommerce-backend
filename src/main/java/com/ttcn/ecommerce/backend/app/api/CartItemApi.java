package com.ttcn.ecommerce.backend.app.api;

import com.ttcn.ecommerce.backend.app.dto.CartItemDTO;
import com.ttcn.ecommerce.backend.app.dto.MessageResponse;
import com.ttcn.ecommerce.backend.app.entity.CartItem;
import com.ttcn.ecommerce.backend.app.service.CartItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/cartItem")
public class CartItemApi {
    @Autowired
    private CartItemService cartItemService;


    @GetMapping(value = { "", "/" })
    public ResponseEntity<List<CartItem>> findAll() {
        List<CartItem> listOfCartItem = cartItemService.findAll() ;

        if(listOfCartItem == null || listOfCartItem.isEmpty() )
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        else
            return new ResponseEntity<>(listOfCartItem, HttpStatus.OK);
    }

    @GetMapping(value = { "/{cid}" })
    public ResponseEntity<CartItem> getCartItem(@PathVariable("id") long id) {
        CartItem cartItem = cartItemService.findById(id);
        return new ResponseEntity<>(cartItem, HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<MessageResponse> createCartItem(@Valid @RequestBody CartItemDTO cartItemDto, BindingResult theBindingResult){

        if(theBindingResult.hasErrors()){
            return new ResponseEntity<>(new MessageResponse("Invalid param for creating cart item", HttpStatus.BAD_REQUEST, LocalDateTime.now()), HttpStatus.BAD_REQUEST);
        }

        MessageResponse messageResponse = cartItemService.createCartItem(cartItemDto);
        return new ResponseEntity<>(messageResponse, HttpStatus.CREATED);
    }
    @PutMapping("/{id}")
    public ResponseEntity<MessageResponse> updateCartItem(@PathVariable("id") Long theId,
                                                      @Valid @RequestBody CartItemDTO cartItemDto, BindingResult bindingResult){

        if(bindingResult.hasErrors()){
            return new ResponseEntity<>(new MessageResponse("Invalid param for modifying cart item", HttpStatus.BAD_REQUEST, LocalDateTime.now()), HttpStatus.BAD_REQUEST);
        }

        MessageResponse messageResponse = cartItemService.updateCartItem(theId, cartItemDto);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCartItem(@PathVariable("id") Long theId){

        cartItemService.deleteCartItem(theId);
        return new ResponseEntity<>(new MessageResponse("Delete cart item successfully!", HttpStatus.OK, LocalDateTime.now()), HttpStatus.OK);
    }

    @GetMapping("/cart/{cartId}")
    public ResponseEntity<List<CartItem>> findCartsByCartId(@PathVariable("cartId") Long cartId ){

        List<CartItem> cartItems = cartItemService.findByCartId(cartId);
        return new ResponseEntity<>(cartItems, HttpStatus.OK);

    }
}
