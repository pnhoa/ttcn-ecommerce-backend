package com.ttcn.ecommerce.backend.app.service;

import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import com.ttcn.ecommerce.backend.app.dto.FeedbackDTO;
import com.ttcn.ecommerce.backend.app.dto.MessageResponse;
import com.ttcn.ecommerce.backend.app.entity.Feedback;
import com.ttcn.ecommerce.backend.app.exception.ResourceNotFoundException;
import com.ttcn.ecommerce.backend.app.repository.FeedbackRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import java.util.Optional;


@Service
@Transactional
public class FeedbackService implements IFeedbackService{


    @Autowired
    private FeedbackRepository feedbackRepository;

    @Autowired
    private ProductService productService;

    @Override
    public List<Feedback> findAll() {
        
        return feedbackRepository.findAll();
    }

    @Override
    public Feedback findById(Long theId) {
        
        return feedbackRepository.findById(theId).orElseThrow(()->new ResourceNotFoundException("Not found feedback with ID=" + theId));
    }

    @Override
    public MessageResponse createFeedback(FeedbackDTO theFeedbackDto) {
        Feedback feedback = new Feedback();

        feedback.setCreatedBy("");
        feedback.setCreatedDate(new Date());
        feedback.setProduct(
            productService.findById(theFeedbackDto.getProduct_id())
        );
        feedback.setRating(theFeedbackDto.getRating());

        return new MessageResponse("Create feedback successfully!", HttpStatus.CREATED, LocalDateTime.now());
    }

    @Override
    public MessageResponse updateFeedback(Long theId, FeedbackDTO theFeedbackDto) {
        Optional<Feedback> theFeedback = feedbackRepository.findById(theId);

        if(!theFeedback.isPresent()) {
            throw new ResourceNotFoundException("Not found feedback with ID=" + theId);
        } else {
            theFeedback.get().setCreatedBy("");
            theFeedback.get().setCreatedDate(new Date());
            theFeedback.get().setProduct(
                productService.findById(theFeedbackDto.getProduct_id())
            );
            theFeedback.get().setRating(theFeedbackDto.getRating());
        }

        return new MessageResponse("Update feedback successfully!" , HttpStatus.OK, LocalDateTime.now());
    }

    @Override
    public void deleteFeedback(Long theId) {
        Feedback theProduct = feedbackRepository.findById(theId).orElseThrow(
                () -> new ResourceNotFoundException("Not found feedback with ID=" + theId));

        feedbackRepository.delete(theProduct);
        
    }

    @Override
    public List<Feedback> findByProductId(Long product_id) {
        
        return feedbackRepository.findFeedbacksByProductId(product_id);
    }
    
}
