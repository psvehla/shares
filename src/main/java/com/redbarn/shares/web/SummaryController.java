/**
 * 
 */
package com.redbarn.shares.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.redbarn.shares.TradingDay;

/**
 * @author peter
 *
 */
@Controller
public class SummaryController {
	
	@RequestMapping("/summary")
	public ModelAndView summary() {
		List<TradingDay> tradingDays = TradingDay.findAllTradingDays();
		return new ModelAndView("summary", "tradingDays", tradingDays);
	}

}
