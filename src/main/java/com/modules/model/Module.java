package com.modules.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Module {

    private Long id;
    private String name;
    private int type;
    private Long parentId;

    @Id
    @GeneratedValue
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "Module{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", parentId=" + parentId +
                '}';
    }

    public Module parent;

    public List<Module> subModules = new ArrayList<>();

    @SuppressWarnings("JpaDataSourceORMInspection")
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "parentId", referencedColumnName = "id", insertable = false, updatable = false)
    public Module getParent() {
        return parent;
    }

    public void setParent(final Module parent) {
        this.parent = parent;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "parent", cascade=CascadeType.ALL)
    public List<Module> getSubModules() {
        return subModules;
    }

    public void setSubModules(final List<Module> subModules) {
        this.subModules = subModules;
    }
}
