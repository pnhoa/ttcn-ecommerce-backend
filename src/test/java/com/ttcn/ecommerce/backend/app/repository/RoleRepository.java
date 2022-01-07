package com.ttcn.ecommerce.backend.app.repository;

import com.ttcn.ecommerce.backend.app.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByCode(String code);

}
