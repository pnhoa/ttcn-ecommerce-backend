package com.ttcn.ecommerce.backend.app.repository;

import com.ttcn.ecommerce.backend.app.entity.Feedback;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
    Page<Feedback> findByRatingContaining(int rating, Pageable pageable);
}
