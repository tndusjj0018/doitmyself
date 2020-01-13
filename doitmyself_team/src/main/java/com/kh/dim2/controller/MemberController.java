package com.kh.dim2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value="/memberInfo", method=RequestMethod.GET)
	public String memberInfo() {
		return "member/memberInfo" ;
	}
	
	@RequestMapping(value="/sellerChange", method=RequestMethod.GET)
	public String sellerChange() {
		return "member/sellerChange" ;
	}
	
	@RequestMapping(value="/memberLeave", method=RequestMethod.GET)
	public String memberLeave() {
		return "member/memberLeave" ;
	}
	
	@RequestMapping(value="/orderDelivery", method=RequestMethod.GET)
	public String orderDelivery() {
		return "member/orderDelivery" ;
	}
	
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public String reviewList() {
		return "member/reviewList" ;
	}
	
	@RequestMapping(value="/wishList", method=RequestMethod.GET)
	public String wishList() {
		return "member/wishList" ;
	}

}
