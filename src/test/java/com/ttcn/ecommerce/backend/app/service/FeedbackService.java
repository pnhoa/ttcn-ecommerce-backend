package com.ttcn.ecommerce.backend.app.service;

import java.util.List;

import com.ttcn.ecommerce.backend.app.dto.FeedbackDTO;
import com.ttcn.ecommerce.backend.app.dto.MessageResponse;
import com.ttcn.ecommerce.backend.app.entity.Feedback;
import com.ttcn.ecommerce.backend.app.repository.FeedbackRepository;
import com.ttcn.ecommerce.backend.app.exception.ResourceNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Optional;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FeedbackService implements IFeedbackService{

    @Autowired
    FeedbackRepository feedbackRepository;

    @Autowired
    ProductService productService;

    @Autowired
    CustomerService customerService;

    @Override
    public List<Feedback> findAll() {
        
        return feedbackRepository.findAll();
    }

    @Override
    public Page<Feedback> findAllPageAndSort(Pageable pagingSort) {
        
        return feedbackRepository.findAll(pagingSort);
    }

    @Override
    public Feedback findById(Long theId) {
        
        return feedbackRepository.findById(theId).orElseThrow(() -> new ResourceNotFoundException("Not found feedback with ID=" + theId));

    }

    @Override
    public MessageResponse createFeedback(FeedbackDTO theFeedbackDto) {
        Feedback theFeedback = new Feedback();

        theFeedback.setRating(theFeedbackDto.getRate());
        theFeedback.setProduct(productService.findById(theFeedbackDto.getCustomerId()));
        theFeedback.setCreatedDate(new Date());
        theFeedback.setCreatedBy("");
        theFeedback.setCustomer(customerService.findByIdCustomer(theFeedbackDto.getCustomerId()));
        feedbackRepository.save(theFeedback);

        return new MessageResponse("Create feedback successfully!", HttpStatus.CREATED, LocalDateTime.now());
    }

    @Override
    public MessageResponse updateFeedback(Long theId, FeedbackDTO theFeedbackDto) {
        Optional<Feedback> theFeedback = feedbackRepository.findById(theId);

        if(!theFeedback.isPresent()) {
            throw new ResourceNotFoundException("Not found product with ID=" + theId);
        } else {
            theFeedback.get().setRating(theFeedbackDto.getRate());
            theFeedback.get().setProduct(productService.findById(theFeedbackDto.getCustomerId()));
            theFeedback.get().setCreatedDate(new Date());
            theFeedback.get().setCreatedBy("");

            feedbackRepository.save(theFeedback.get());
        }
        
        return new MessageResponse("Update feedback successfully!" , HttpStatus.OK, LocalDateTime.now());
    }

    @Override
    public void deleteFeedback(Long theId) {
        
        Feedback theFeedback = feedbackRepository.findById(theId).orElseThrow(
                () -> new ResourceNotFoundException("Not found feedback with ID=" + theId));

        feedbackRepository.delete(theFeedback);
        
    }

    @Override
    public Long count() {
        
        return feedbackRepository.count();
    }

    @Override
    public Page<Feedback> findByRatingContaining(int rating, Pageable pagingSort) {
        return feedbackRepository.findByRatingContaining(rating, pagingSort);
    }
    
}
