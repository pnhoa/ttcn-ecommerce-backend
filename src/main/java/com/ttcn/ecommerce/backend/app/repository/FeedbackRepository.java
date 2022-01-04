package com.ttcn.ecommerce.backend.app.repository;
import com.ttcn.ecommerce.backend.app.entity.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FeedbackRepository extends JpaRepository<Feedback, Long>{
    

    @Query("SELECT f from feedback f WHERE f.product.id=?1")
    List<Feedback> findFeedbacksByProductId(Long product_id);
    
}
