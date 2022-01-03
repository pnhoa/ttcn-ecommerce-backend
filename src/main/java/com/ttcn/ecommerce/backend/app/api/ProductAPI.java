package com.ttcn.ecommerce.backend.app.api;

import com.ttcn.ecommerce.backend.app.dto.MessageResponse;
import com.ttcn.ecommerce.backend.app.dto.ProductDTO;
import com.ttcn.ecommerce.backend.app.entity.Product;
import com.ttcn.ecommerce.backend.app.service.IProductService;
import com.ttcn.ecommerce.backend.app.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/api/products")
@CrossOrigin
public class ProductAPI {

    @Autowired
    private IProductService productService;

    @GetMapping("")
    public ResponseEntity<List<Product>> findAll( @RequestParam(name = "productName_contains", required = false) String productName,
                                                  @RequestParam(defaultValue = "0") int page,
                                                  @RequestParam(defaultValue = "10") int limit,
                                                  @RequestParam(defaultValue = "id,ASC") String[] sort){

        try {

            List<Order> orders = new ArrayList<>();

            if (sort[0].contains(",")) {
                // will sort more than 2 fields
                // sortOrder="field, direction"
                for (String sortOrder : sort) {
                    String[] _sort = sortOrder.split(",");
                    Sort.Direction dire = CommonUtils.getSortDirection(_sort[1]);
                    Order order = new Order(dire,_sort[0]);
                    orders.add( order );
                }
            } else {
                // sort=[field, direction]
                Sort.Direction dire = CommonUtils.getSortDirection(sort[1]);
                Order order = new Order(dire, sort[0]);
                orders.add( order );
            }

            Pageable pagingSort = PageRequest.of(page, limit, Sort.by(orders));
            Page<Product> productPage;

            if(productName == null) {
                productPage = productService.findAllPageAndSort(pagingSort);
            } else {
                productPage = productService.findByNameContaining(productName, pagingSort);
            }

            if(productPage.getContent().isEmpty()){
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }

            return new ResponseEntity<>(productPage.getContent(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> findById(@PathVariable("id") Long theId){

        Product theProduct = productService.findById(theId);
        return new ResponseEntity<>(theProduct, HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<MessageResponse> createProduct(@Valid @RequestBody ProductDTO theProductDto, BindingResult theBindingResult){

        if(theBindingResult.hasErrors()){
            return new ResponseEntity<MessageResponse>(new MessageResponse("Invalid value for create product", HttpStatus.BAD_REQUEST, LocalDateTime.now()), HttpStatus.BAD_REQUEST);
        }

        MessageResponse messageResponse = productService.createProduct(theProductDto);
        return new ResponseEntity<MessageResponse>(messageResponse, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<MessageResponse> updateProduct(@PathVariable("id") Long theId,
                                                         @Valid @RequestBody ProductDTO theProductDto, BindingResult bindingResult){

        if(bindingResult.hasErrors()){
            return new ResponseEntity<MessageResponse>(new MessageResponse("Invalid value for update product", HttpStatus.BAD_REQUEST, LocalDateTime.now()), HttpStatus.BAD_REQUEST);
        }

        MessageResponse messageResponse = productService.updateProduct(theId, theProductDto);
        return new ResponseEntity<MessageResponse>(messageResponse, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProduct(@PathVariable("id") Long theId){

        productService.deleteProduct(theId);
        return new ResponseEntity<>(new MessageResponse("Delete successfully!", HttpStatus.OK, LocalDateTime.now()), HttpStatus.OK);
    }

    @GetMapping("/category/{categoryId}")
    public ResponseEntity<List<Product>> findProductsByCategoryId(@PathVariable("categoryId") Long categoryId ){

        List<Product> theProducts = productService.findByCategoryId(categoryId);
        return new ResponseEntity<>(theProducts, HttpStatus.OK);

    }

    @GetMapping("/count")
    public ResponseEntity<?> count(){
        return new ResponseEntity<>(productService.count(), HttpStatus.OK);
    }

}
