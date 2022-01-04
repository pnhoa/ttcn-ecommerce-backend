package com.ttcn.ecommerce.backend.app.service;
import com.ttcn.ecommerce.backend.app.dto.FeedbackDTO;
import com.ttcn.ecommerce.backend.app.dto.MessageResponse;
import com.ttcn.ecommerce.backend.app.entity.Feedback;

import java.util.List;

public interface IFeedbackService {
    
    List<Feedback> findAll();

    Feedback findById(Long theId);

    MessageResponse createFeedback(FeedbackDTO theFeedbackDto);

    MessageResponse updateFeedback(Long theId, FeedbackDTO theFeedbackDto);

    void deleteFeedback(Long theId);

    List<Feedback> findByProductId(Long product_id);

    

}
