package com.kh.dim2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.domain.Member;
import com.kh.dim2.Service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberservice;

	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public ModelAndView member_info(
			
			ModelAndView mv,
			HttpSession session) {
		
		Member m = memberservice.memberInfo("sooyeon");
		mv.setViewName("member/memberInfo");
		mv.addObject("memberinfo", m);

		return mv;
	}

	@RequestMapping(value = "/sellerChange", method = RequestMethod.GET)
	public String sellerChange() {
		return "member/sellerChange";
	}

	@RequestMapping(value = "/memberLeave", method = RequestMethod.GET)
	public String memberLeave() {
		return "member/memberLeave";
	}

	@RequestMapping(value = "/orderDelivery", method = RequestMethod.GET)
	public String orderDelivery() {
		return "member/orderDelivery";
	}

	@RequestMapping(value = "/cancelProcess", method = RequestMethod.GET)
	public String cancelProcess() {
		return "member/cancelProcess";
	}

	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String reviewList() {
		return "member/reviewList";
	}

	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnaList() {
		return "member/qnaList";
	}

	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public String wishList() {
		return "member/wishList";
	}

	@RequestMapping(value = "/change_password", method = RequestMethod.GET)
	public String change_password() {
		return "member/change_password";
	}

}
