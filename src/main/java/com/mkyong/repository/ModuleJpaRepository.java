package com.mkyong.repository;

import com.mkyong.model.Module;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface ModuleJpaRepository extends JpaRepository<Module, Long> {
    Module findByName(String name);
}

