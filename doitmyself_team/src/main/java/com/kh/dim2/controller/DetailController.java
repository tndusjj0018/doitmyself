package com.kh.dim2.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.ProductService;
import com.kh.dim2.Service.ReviewService;
import com.kh.dim2.Service.qnaService;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Qna;
import com.kh.dim2.domain.Review;

/*
 * @Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만
 * 모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 
 * 
 */

@Controller
public class DetailController {
	@Autowired
	private qnaService qnasvc;

	@Autowired
	private ProductService prdsvc;

	@Autowired
	private ReviewService reviewsvc;

	@GetMapping(value = "/qnaWrite")
	public String qnaWrite() throws Exception {
		return "detail/qnaWrite";
	}

	// 문의글 작성
	@PostMapping(value = "qnaGo")
	public void qnaGo(Qna qna, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = qnasvc.insertQna(qna);
		out.println("<script>");

		// 등록 된 경우
		if (result == 1) {

			out.println("alert('문의글이 작성되었습니다.');");
			out.println("window.close();");
		} else {
			out.println("alert('문의글 작성에 실패했습니다.');");
			out.println("window.close()");
		}

		out.println("</script>");
		out.close();

	}

	// 문의글 수정 클릭시 원문 정보 가져옴
	@GetMapping(value = "/qnaUpdateView")
	public ModelAndView qnaUpdateView(int num, ModelAndView mv, HttpServletRequest request) throws Exception {
		Qna qna = qnasvc.getDetail(num);
		// 글 내용 불러오기 실패시
		if (qna == null) {
			System.out.println("문의글 수정을 위한 원문글 불러오기 실패!");
			mv.setViewName("detail/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "문의글 수정을 위한 원문글 불러오기 실패!");
			return mv;
		}
		System.out.println("문의글 수정을 위한 원문글 불러오기 성공~");
		// 수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 boarddata 객체를
		// ModelAndView객체에 저장합니다.
		mv.addObject("qnaData", qna);

		// 글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
		mv.setViewName("detail/qnaUpdate");

		return mv;

	}

	// 문의글 수정
	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public void qnaUpdate(Qna qna, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = qnasvc.qnaUpdate(qna);
		out.println("<script>");

		// 수정 된 경우
		if (result == 1) {
			System.out.println("문의글 수정 성공~");
			out.println("alert('문의글이 수정되었습니다.');");
			out.println("window.close()");
		} else {
			System.out.println("문의글 수정 실패!");
			out.println("alert('문의글 수정에 실패했습니다!');");
			out.println("window.close()");
		}

		out.println("</script>");
		out.close();

	}
    
	//문의글 AJAX
	@ResponseBody
	@RequestMapping(value = "/QnaListAjax.bo")
	public Object QnaListAjax(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit) throws Exception {
		List<Qna> qnalist = qnasvc.getQnaList(page, limit);
		return qnalist;

	}
	
	//리뷰 AJAX
	@ResponseBody
	@RequestMapping(value = "/ReviewListAjax.bo")
	public Object ReviewListAjax(@RequestParam(value = "page2", defaultValue = "1", required = false) int page2,
			@RequestParam(value = "limit2", defaultValue = "5", required = false) int limit2) throws Exception {
		List<Review> reviewlist = reviewsvc.getReviewList(page2, limit2);
		return reviewlist;

	}

	// 상품 불러오기 & 리뷰 불러오기 & 문의/답변 불러오기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView QnaList(@RequestParam(value = "page2", defaultValue = "1", required = false) int page2,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv/*
							 * ,
							 * 
							 * @RequestParam("P_NO") int p_no
							 */) {
		// 페이지 이동
		mv.setViewName("detail/detail");
		
		
		
		// 상품 불러오기
		Product prd = prdsvc.getDetail(2);
		if (prd == null) {
			System.out.println("상품 정보 가져오기 실패!");
			mv.setViewName("detail/error");
		}
		System.out.println("상품 정보 가져오기 성공~");
		mv.addObject("prdData", prd); // 불러올 상품 정보


		
		// 리뷰 페이지네이션
		int limit2 = 5; // 한 화면에 출력할 레코드 갯수

		int listcount2 = reviewsvc.getListCount(); // 총 리스트 수를 받아옴

		// 총 페이지 수
		int maxpage2 = (listcount2 + limit2 - 1) / limit2;

		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage2 = ((page2 - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등..)
		int endpage2 = startpage2 + 10 - 1;

		if (endpage2 > maxpage2)
			endpage2 = maxpage2;

		List<Review> reviewlist = reviewsvc.getReviewList(page2, limit2);
		mv.addObject("reviewlist", reviewlist);

		mv.addObject("page2", page2);
		mv.addObject("maxpage2", maxpage2);
		mv.addObject("startpage2", startpage2);
		mv.addObject("endpage2", endpage2);
		mv.addObject("listcount2", listcount2);
		mv.addObject("limit2", limit2);

		
		
		
		// 문의글 페이지네이션
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

		List<Qna> qnalist = qnasvc.getQnaList(page, limit);

		mv.addObject("qnalist", qnalist); // 문의글 집합 목록
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("limit", limit);

		return mv;

	}

}
