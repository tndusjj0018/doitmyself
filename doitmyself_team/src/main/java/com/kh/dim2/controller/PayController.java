package com.kh.dim2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.PayService;
import com.kh.dim2.domain.Member;


/*
 * @Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만
 * 모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 
 * 
 */

@Controller
public class PayController {
 @Autowired
 private PayService paysvc;
	
	// 회원 정보 조회를 통해 배송지 입력
	@RequestMapping(value = "/pay")
	public ModelAndView loc_info(@RequestParam("USER_ID") String USER_ID, ModelAndView mv) {

		Member m = paysvc.locInfo(USER_ID);
		
		mv.setViewName("detail/pay");
		mv.addObject("locInfo",m);
	

		return mv;

	}
	
	

	
		
		

	


}
