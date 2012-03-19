// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.redbarn.shares;

import com.redbarn.shares.Co;
import com.redbarn.shares.CoDataOnDemand;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect CoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CoDataOnDemand: @Component;
    
    private Random CoDataOnDemand.rnd = new SecureRandom();
    
    private List<Co> CoDataOnDemand.data;
    
    public Co CoDataOnDemand.getNewTransientCo(int index) {
        Co obj = new Co();
        setCode(obj, index);
        setPrice(obj, index);
        return obj;
    }
    
    public void CoDataOnDemand.setCode(Co obj, int index) {
        String code = "code_" + index;
        obj.setCode(code);
    }
    
    public void CoDataOnDemand.setPrice(Co obj, int index) {
        BigDecimal price = BigDecimal.valueOf(index);
        obj.setPrice(price);
    }
    
    public Co CoDataOnDemand.getSpecificCo(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Co obj = data.get(index);
        Long id = obj.getId();
        return Co.findCo(id);
    }
    
    public Co CoDataOnDemand.getRandomCo() {
        init();
        Co obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Co.findCo(id);
    }
    
    public boolean CoDataOnDemand.modifyCo(Co obj) {
        return false;
    }
    
    public void CoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Co.findCoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Co' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Co>();
        for (int i = 0; i < 10; i++) {
            Co obj = getNewTransientCo(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
