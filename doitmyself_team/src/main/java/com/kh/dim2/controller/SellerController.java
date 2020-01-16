package com.kh.dim2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller  
public class SellerController {
	
	@RequestMapping(value = "/seller")
	public ModelAndView seller(String doc, ModelAndView mv) {
		if(doc == null) {
			doc = "seller_info";
		}
		mv.addObject("doc",doc);
		mv.setViewName("seller/seller_nav");
		return mv;
	}
}
