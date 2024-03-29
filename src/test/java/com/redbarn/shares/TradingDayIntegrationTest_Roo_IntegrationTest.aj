// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.redbarn.shares;

import com.redbarn.shares.TradingDay;
import com.redbarn.shares.TradingDayDataOnDemand;
import com.redbarn.shares.TradingDayIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TradingDayIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TradingDayIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TradingDayIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: TradingDayIntegrationTest: @Transactional;
    
    @Autowired
    private TradingDayDataOnDemand TradingDayIntegrationTest.dod;
    
    @Test
    public void TradingDayIntegrationTest.testCountTradingDays() {
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to initialize correctly", dod.getRandomTradingDay());
        long count = TradingDay.countTradingDays();
        Assert.assertTrue("Counter for 'TradingDay' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TradingDayIntegrationTest.testFindTradingDay() {
        TradingDay obj = dod.getRandomTradingDay();
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to provide an identifier", id);
        obj = TradingDay.findTradingDay(id);
        Assert.assertNotNull("Find method for 'TradingDay' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'TradingDay' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TradingDayIntegrationTest.testFindAllTradingDays() {
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to initialize correctly", dod.getRandomTradingDay());
        long count = TradingDay.countTradingDays();
        Assert.assertTrue("Too expensive to perform a find all test for 'TradingDay', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<TradingDay> result = TradingDay.findAllTradingDays();
        Assert.assertNotNull("Find all method for 'TradingDay' illegally returned null", result);
        Assert.assertTrue("Find all method for 'TradingDay' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TradingDayIntegrationTest.testFindTradingDayEntries() {
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to initialize correctly", dod.getRandomTradingDay());
        long count = TradingDay.countTradingDays();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<TradingDay> result = TradingDay.findTradingDayEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'TradingDay' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'TradingDay' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TradingDayIntegrationTest.testFlush() {
        TradingDay obj = dod.getRandomTradingDay();
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to provide an identifier", id);
        obj = TradingDay.findTradingDay(id);
        Assert.assertNotNull("Find method for 'TradingDay' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTradingDay(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'TradingDay' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TradingDayIntegrationTest.testMergeUpdate() {
        TradingDay obj = dod.getRandomTradingDay();
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to provide an identifier", id);
        obj = TradingDay.findTradingDay(id);
        boolean modified =  dod.modifyTradingDay(obj);
        Integer currentVersion = obj.getVersion();
        TradingDay merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'TradingDay' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TradingDayIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to initialize correctly", dod.getRandomTradingDay());
        TradingDay obj = dod.getNewTransientTradingDay(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'TradingDay' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'TradingDay' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TradingDayIntegrationTest.testRemove() {
        TradingDay obj = dod.getRandomTradingDay();
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TradingDay' failed to provide an identifier", id);
        obj = TradingDay.findTradingDay(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'TradingDay' with identifier '" + id + "'", TradingDay.findTradingDay(id));
    }
    
}
