// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.redbarn.shares;

import com.redbarn.shares.Co;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Co_Roo_Jpa_Entity {
    
    declare @type: Co: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Co.id;
    
    @Version
    @Column(name = "version")
    private Integer Co.version;
    
    public Long Co.getId() {
        return this.id;
    }
    
    public void Co.setId(Long id) {
        this.id = id;
    }
    
    public Integer Co.getVersion() {
        return this.version;
    }
    
    public void Co.setVersion(Integer version) {
        this.version = version;
    }
    
}