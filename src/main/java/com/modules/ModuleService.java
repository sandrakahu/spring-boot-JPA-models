package com.modules;

import com.modules.model.Module;
import com.modules.repository.ModuleJpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModuleService {

    private final ModuleJpaRepository repository;

    public ModuleService(ModuleJpaRepository repository) {
        this.repository = repository;
    }

    public List<Module> getAllModules(){
        return repository.findAll();
    }

    public Module saveModule(Module module){
        return repository.save(module);
    }

    public Module get(Long id) {
        return repository.getOne(id);
    }

    public List<Module> getParentModules(){
        return repository.findByParentIdIsNull();
    }

}
