package com.ttcn.ecommerce.backend.app.api;
import com.ttcn.ecommerce.backend.app.dto.FeedbackDTO;
import com.ttcn.ecommerce.backend.app.dto.MessageResponse;
import com.ttcn.ecommerce.backend.app.entity.Feedback;
import com.ttcn.ecommerce.backend.app.service.IFeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/feedbacks")
@CrossOrigin
public class FeedbackAPI {
    
    @Autowired
    private IFeedbackService feedbackService;

    @GetMapping("")
    public ResponseEntity<List<Feedback>> findAll() {

        List<Feedback> theFeedbacks = feedbackService.findAll();

        return new ResponseEntity<>(theFeedbacks, HttpStatus.OK);

    }

    @GetMapping("/{id}")
    public ResponseEntity<Feedback> findById(@PathVariable("id") Long theId) {

        Feedback theFeedback = feedbackService.findById(theId);
        return new ResponseEntity<>(theFeedback, HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<MessageResponse> createFeedback(@Valid @RequestBody FeedbackDTO theFeedbackDto,
            BindingResult theBindingResult) {

        if (theBindingResult.hasErrors()) {
            return new ResponseEntity<MessageResponse>(new MessageResponse("Invalid value for create feedback",
                    HttpStatus.BAD_REQUEST, LocalDateTime.now()), HttpStatus.BAD_REQUEST);
        }

        MessageResponse messageResponse = feedbackService.createFeedback(theFeedbackDto);
        return new ResponseEntity<MessageResponse>(messageResponse, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<MessageResponse> updateFeedback(@PathVariable("id") Long theId,
            @Valid @RequestBody FeedbackDTO theFeedbackDto, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return new ResponseEntity<MessageResponse>(new MessageResponse("Invalid value for update feedback",
                    HttpStatus.BAD_REQUEST, LocalDateTime.now()), HttpStatus.BAD_REQUEST);
        }

        MessageResponse messageResponse = feedbackService.updateFeedback(theId, theFeedbackDto);
        return new ResponseEntity<MessageResponse>(messageResponse, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteFeedback(@PathVariable("id") Long theId) {

        feedbackService.deleteFeedback(theId);
        return new ResponseEntity<>(new MessageResponse("Delete a feedback successfully!", HttpStatus.OK, LocalDateTime.now()),
                HttpStatus.OK);
    }

    @GetMapping("/product/{productId}")
    public ResponseEntity<List<Feedback>> findFeedbacksByProductId(@PathVariable("productId") Long productId) {

        List<Feedback> theFeedbacks = feedbackService.findByProductId(productId);
        return new ResponseEntity<>(theFeedbacks, HttpStatus.OK);

    }
}
