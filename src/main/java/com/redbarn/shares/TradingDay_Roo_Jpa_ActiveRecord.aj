// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.redbarn.shares;

import com.redbarn.shares.TradingDay;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TradingDay_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager TradingDay.entityManager;
    
    public static final EntityManager TradingDay.entityManager() {
        EntityManager em = new TradingDay().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TradingDay.countTradingDays() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TradingDay o", Long.class).getSingleResult();
    }
    
    public static List<TradingDay> TradingDay.findAllTradingDays() {
        return entityManager().createQuery("SELECT o FROM TradingDay o", TradingDay.class).getResultList();
    }
    
    public static TradingDay TradingDay.findTradingDay(Long id) {
        if (id == null) return null;
        return entityManager().find(TradingDay.class, id);
    }
    
    public static List<TradingDay> TradingDay.findTradingDayEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TradingDay o", TradingDay.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void TradingDay.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TradingDay.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TradingDay attached = TradingDay.findTradingDay(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TradingDay.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TradingDay.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TradingDay TradingDay.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TradingDay merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
