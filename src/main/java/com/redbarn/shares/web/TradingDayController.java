package com.redbarn.shares.web;

import com.redbarn.shares.TradingDay;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tradingdays")
@Controller
@RooWebScaffold(path = "tradingdays", formBackingObject = TradingDay.class)
public class TradingDayController {
}
