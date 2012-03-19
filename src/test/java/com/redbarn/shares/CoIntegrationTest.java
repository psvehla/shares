package com.redbarn.shares;

import java.math.BigDecimal;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = Co.class)
public class CoIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
    
    // The standard Roo test just deletes a random record. This can cause an integrity constraint violation if the record chosen is referenced from another table.
    @Test
    public void testRemove() {
    	
        Co co = new Co();
        co.setCode("TEST");
        co.setPrice(new BigDecimal("9.99"));
        co.persist();
        Assert.assertNotNull("Could not create test record for 'Co'.", co);
        
        Long id = co.getId();
        Assert.assertNotNull("Data on demand for 'Co' failed to provide an identifier", id);
        co = Co.findCo(id);
        co.remove();
        co.flush();
        Assert.assertNull("Failed to remove 'Co' with identifier '" + id + "'", Co.findCo(id));
    }
}
