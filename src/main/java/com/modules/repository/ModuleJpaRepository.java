package com.modules.repository;

import com.modules.model.Module;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ModuleJpaRepository extends JpaRepository<Module, Long> {
    Module findByName(String name);
    List<Module> findByParentIdIsNull();
}

