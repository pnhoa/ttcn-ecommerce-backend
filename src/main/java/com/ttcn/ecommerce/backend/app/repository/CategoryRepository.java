package com.ttcn.ecommerce.backend.app.repository;

import com.ttcn.ecommerce.backend.app.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
