package com.kh.dim2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.SellerService;
import com.kh.dim2.domain.Seller;

@Controller  
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@RequestMapping(value = "/seller")
	public ModelAndView seller(String doc, ModelAndView mv) {
		if(doc == null) {
			doc = "seller_info";
		}
		mv.addObject("doc",doc);
		mv.setViewName("seller/seller_nav");
		return mv;
	}
	
	// ## 판매자 정보 보기 ##
	@ResponseBody
	@RequestMapping(value="/sellerInfo")
	public List<Seller> SellerInfo(@RequestParam("id")String id) {
		List<Seller> list = sellerService.sellerInfo(id);
		
		return list;
	}
}
