// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.redbarn.shares.web;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

import com.redbarn.shares.Co;
import com.redbarn.shares.TradingDay;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Co, String> ApplicationConversionServiceFactoryBean.getCoToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.redbarn.shares.Co, java.lang.String>() {
            public String convert(Co co) {
                return new StringBuilder().append(co.getCode()).append(" ").append(co.getPrice()).toString();
            }
        };
    }
    
    public Converter<Long, Co> ApplicationConversionServiceFactoryBean.getIdToCoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.redbarn.shares.Co>() {
            public com.redbarn.shares.Co convert(java.lang.Long id) {
                return Co.findCo(id);
            }
        };
    }
    
    public Converter<String, Co> ApplicationConversionServiceFactoryBean.getStringToCoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.redbarn.shares.Co>() {
            public com.redbarn.shares.Co convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Co.class);
            }
        };
    }
    
    public Converter<TradingDay, String> ApplicationConversionServiceFactoryBean.getTradingDayToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.redbarn.shares.TradingDay, java.lang.String>() {
            public String convert(TradingDay tradingDay) {
                return new StringBuilder().append(tradingDay.getTradingDate()).toString();
            }
        };
    }
    
    public Converter<Long, TradingDay> ApplicationConversionServiceFactoryBean.getIdToTradingDayConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.redbarn.shares.TradingDay>() {
            public com.redbarn.shares.TradingDay convert(java.lang.Long id) {
                return TradingDay.findTradingDay(id);
            }
        };
    }
    
    public Converter<String, TradingDay> ApplicationConversionServiceFactoryBean.getStringToTradingDayConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.redbarn.shares.TradingDay>() {
            public com.redbarn.shares.TradingDay convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), TradingDay.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getCoToStringConverter());
        registry.addConverter(getIdToCoConverter());
        registry.addConverter(getStringToCoConverter());
        registry.addConverter(getTradingDayToStringConverter());
        registry.addConverter(getIdToTradingDayConverter());
        registry.addConverter(getStringToTradingDayConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}