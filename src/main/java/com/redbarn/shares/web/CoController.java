package com.redbarn.shares.web;

import com.redbarn.shares.Co;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/coes")
@Controller
@RooWebScaffold(path = "coes", formBackingObject = Co.class)
public class CoController {
}
