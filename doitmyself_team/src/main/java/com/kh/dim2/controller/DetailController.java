package com.kh.dim2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.qnaService;
import com.kh.dim2.domain.Qna;


/*
 * @Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만
 * 모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 
 * 
 */

@Controller
public class DetailController {
    @Autowired
	private qnaService qnasvc;
	
	@GetMapping(value="/qnaWrite")
	public String qnaWrite() throws Exception {
		return "detail/qnaWrite";
	}
	
	@PostMapping(value="qnaGo")
	public String qnaGo(Qna qna, HttpServletRequest request) throws Exception {
		qnasvc.insertQna(qna);
		return "detail/detail";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/QnaListAjax.bo")
	public Object QnaListAjax(
			@RequestParam(value = "page", defaultValue = "1", required = false)int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false)int limit)
			                      throws Exception {
		List<Qna> qnalist = qnasvc.getQnaList(page, limit);
		return qnalist;
	
	}
	
	
	// 글 목록보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView QnaList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {

		int limit = 10; // 한 화면에 출력할 레코드 갯수

		int listcount = qnasvc.getListCount(); // 총 리스트 수를 받아옴

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		//
		List<Qna> qnalist = qnasvc.getQnaList(page, limit);

		mv.setViewName("detail/detail");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("qnalist", qnalist);
		mv.addObject("limit", limit);

		return mv;

	}
	
	

	
		
		

	


}
