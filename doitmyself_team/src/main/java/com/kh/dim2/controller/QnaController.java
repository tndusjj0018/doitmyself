package com.kh.dim2.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.dim2.Service.qnaService;
import com.kh.dim2.domain.Qna;

/*
 * @Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만
 * 모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 
 * 
 */

@Controller
public class QnaController {
    @Autowired
	private qnaService qnasvc;
	
	@GetMapping(value="/temp")
	public String temp() throws Exception {
		return "detail/temp";
	}
	@GetMapping(value="/detail")
	public String detail() throws Exception {
		return "detail/detail";
	}
	@GetMapping(value="/pay")
	public String pay() throws Exception {
		return "detail/pay";
	}
	@GetMapping(value="/qnaWrite")
	public String qnaWrite() throws Exception {
		return "detail/qnaWrite";
	}
	
	@PostMapping(value="qnaGo")
	public String qnaGo(Qna qna, HttpServletRequest request) throws Exception {
		qnasvc.insertQna(qna);
		return "detail/detail";
	}
	
	

	
		
		

	


}
