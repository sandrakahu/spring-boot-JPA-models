package com.mkyong;

import com.mkyong.model.Module;
import com.mkyong.repository.ModuleJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModuleService {

    @Autowired
    private ModuleJpaRepository repository;

    public List<Module> getAllModules(){
        return repository.findAll();
    }

    public Module saveModule(Module module){
        return repository.save(module);
    }

    public Module get(Long id) {
        return repository.getOne(id);
    }

}
