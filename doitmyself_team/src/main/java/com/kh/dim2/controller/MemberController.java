package com.kh.dim2.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.MemberService;
import com.kh.dim2.domain.C_Product;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.O_Product;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Q_Product;
import com.kh.dim2.domain.Refund;
import com.kh.dim2.domain.Review;
import com.kh.dim2.domain.Seller;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	//String user_id = "sooyeon3";

	// 회원 정보 가지고 옴
	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public ModelAndView member_info(ModelAndView mv,
									@RequestParam("USER_ID") String user_id) {
		
		Member m = memberservice.memberInfo(user_id);
		//session.setAttribute("USER_ID", user_id);
		
		mv.addObject("doc", "mi");
		mv.setViewName("member/memberInfo");
		mv.addObject("memberinfo", m);

		return mv;
	}
	

	// 회원 정보 수정
	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	public void updateProcess(Member member, HttpServletResponse response,
							  @RequestParam("USER_ID") String user_id) throws Exception {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = memberservice.memberUpdate(member);
		out.println("<script>");

		// 수정 된 경우
		if (result == 1) {
			out.println("alert('회원 정보가 변경 되었습니다.');");
			out.println("location.href='memberInfo?USER_ID=" + user_id + "';");
		} else {
			out.println("alert('회원 정보 변경에 실패 하였습니다.');");
			out.println("history.back()");
		}

		out.println("</script>");
		out.close();
	}

	
	// 비밀번호 변경
	@RequestMapping(value="/passChange.net", method = RequestMethod.POST)
	public void passChange(ModelAndView mv,
						   Member member,
						   HttpServletResponse response,
						   @RequestParam("user_password") String user_password,
						   @RequestParam("change_password") String change_password,
						   @RequestParam("USER_ID") String user_id) throws Exception {
		
		//현재 비밀번호 확인
		int result = memberservice.passCheck(user_id, user_password);
		
		System.out.println(result);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) { //현재 비밀번호 맞는 경우
			memberservice.passChange(change_password, user_id);
			System.out.println("비밀번호 변경 완료");
			
			out.println("<script>");
			out.println("alert('비밀번호가 변경 되었습니다.');");
			out.println("window.opener.top.location.href='memberInfo?USER_ID=" +user_id + "';");
			out.println("self.close();");			
			out.println("</script>");
			out.close();
		} else if (result == -1) { //현재 비밀번호 틀린 경우
			out.println("<script>");
			out.println("alert('현재 사용 중인 비밀번호를 확인하세요');");
			out.println("location.href='change_password';");
			out.println("</script>");
			out.close();
		}
		
	}
	
	
	//판매자인지 아닌지 확인 후 페이지 불러옴
	@RequestMapping(value = "/sellerChange", method = RequestMethod.GET)
	public ModelAndView sellerChange(ModelAndView mv,
									 @RequestParam("USER_ID") String user_id) {
		
		int isSeller = memberservice.isSeller(user_id);
		mv.addObject("doc", "sc");
		mv.addObject("isSeller", isSeller);		
		mv.setViewName("member/sellerChange");
		
		return mv;
	}
	
	
	//판매자로 변환 (판매자 테이블에 insert)
	@RequestMapping(value = "/sellerChangeAction", method = RequestMethod.POST)
	public void sellerChangeAction(Seller seller,
								   HttpServletResponse response,
								   HttpSession session,
								   @RequestParam("USER_ID") String user_id) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int result = memberservice.sellerChange(seller);
		out.println("<script>");
		
		if(result == 1) { //판매자 등록 된 경우
			session.setAttribute("SELLER_RESULT", result);
			out.println("alert('판매자 등록이 완료 되었습니다.');");
			out.println("location.href='sellerChange?USER_ID=" + user_id + "';");
		} else {
			out.println("alert('판매자 등록에 실패 하였습니다.')");
			out.println("history.back();");
		}
		
		out.println("</script>");
		out.close();
	}
	
	
	//가게명 있는지 확인
	@RequestMapping(value="/sellerNameCheck", method=RequestMethod.GET)
	public void idcheck(@RequestParam("SELLER_NAME") String seller_name,
						HttpServletResponse response) throws Exception {
		int result = memberservice.sellerNameCheck(seller_name);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	

	//회원 탈퇴 페이지로 이동
	@RequestMapping(value = "/memberLeave", method = RequestMethod.GET)
	public ModelAndView memberLeave(ModelAndView mv) {
		mv.addObject("doc", "ml");
		mv.setViewName("member/memberLeave");
		
		return mv;
	}
	
	//회원 탈퇴하기
	@RequestMapping(value = "/memberLeaveAction", method = RequestMethod.POST)
	public void memberLeaveAction(HttpServletResponse response,
								  @RequestParam("user_pass") String user_password,
								  @RequestParam("USER_ID") String user_id,
								  HttpSession session) throws Exception {
		
		//현재 비밀번호 확인
		int result = memberservice.passCheck(user_id, user_password);
		
		if(result == 1) { //현재 비밀번호 맞는 경우
			
			int isLeave = memberservice.memberLeave(user_id);
			
			if(isLeave != 1) {
				response.setContentType("text/html; charset=utf-8"); 
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('탈퇴에 실패하였습니다.');");
				out.println("history.back()");
				out.println("</script>");
				System.out.println("탈퇴 실패");
			} else {
				response.setContentType("text/html; charset=utf-8"); 
				PrintWriter out = response.getWriter();
				session.invalidate();
				out.println("<script>");
				out.println("alert('정상적으로 탈퇴 되었습니다.');");
				out.println("location.href='home';");
				out.println("</script>");
				System.out.println(user_id +" 탈퇴 성공");
			}
			
			
		} else if (result == -1) { //현재 비밀번호 틀린 경우
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 정확히 입력하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
						
	}

	
	//주문 정보 가지고 옴
	@RequestMapping(value = "/orderDelivery", method = RequestMethod.GET)
	public ModelAndView orderDelivery(ModelAndView mv,
									  @RequestParam("USER_ID") String user_id,
									  @RequestParam(value="page", defaultValue="1", required=false) int page) throws Exception {
		
		//한 화면에 출력할 레코드 갯수
		int limit = 4;
				
		//총 리스트 수 받아옴
		int ordercount = memberservice.ordercount(user_id);
		System.out.println("주문내역수" + ordercount);
		
		//총 페이지 수
		int maxpage = (ordercount + limit -1) / limit;
				
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage = ((page - 1) / 10) * 10 + 1;
				  
		//10, 20, 30 등
		int endpage = startpage + 10 -1;
				  
		if (endpage > maxpage) endpage = maxpage;
		
		List<O_Product> orderlist = memberservice.orderlist(user_id, page, limit);
		mv.addObject("doc", "od");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("orderlist", orderlist);
		mv.addObject("ordercount", ordercount);
		mv.setViewName("member/orderDelivery");
		return mv;
	}
	
	
	@RequestMapping(value = "/cancelRegister", method = RequestMethod.GET)
	public ModelAndView cancelRegister(ModelAndView mv,
									   @RequestParam("ORDER_NO") int order_no,
									   @RequestParam("ORDER_P_NO") int p_no) {
		
		O_Product p = memberservice.cancelDetail(order_no);
		mv.addObject("productdetail", p);
		mv.addObject("ORDER_NO", order_no);
		mv.setViewName("member/cancelRegister");
	
		return mv;
	}
	
	
	@RequestMapping(value = "/cancelRegisterAction", method = RequestMethod.GET)
	public void cancelRegisterAction(HttpServletResponse response,
									 @RequestParam("ORDER_NO") int order_no,
									 @RequestParam("USER_ID") String user_id) throws Exception {
		
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		int result = memberservice.cancelRegister(order_no);
		if(result == 1) {
			System.out.println("주문번호 " + order_no + " 취소 신청 완료");
			out.println("<script>");
			out.println("alert('취소 신청이 완료 되었습니다.');");
			out.println("window.opener.top.location.href='cancelProcess?USER_ID=" +user_id + "';");
			out.println("window.close();");
			out.println("</script>");
			out.close();
		}
	}
	
	
	
	
	
	@RequestMapping(value = "/returnRegister", method = RequestMethod.GET)
	public ModelAndView returnRegister(ModelAndView mv,
			   						   @RequestParam("ORDER_NO") int order_no,
			   						   @RequestParam("ORDER_P_NO") int p_no) {

		O_Product p = memberservice.cancelDetail(order_no);
		mv.addObject("productdetail", p);
		mv.addObject("ORDER_NO", order_no);
		mv.setViewName("member/returnRegister");

		return mv;
	}
	
	@RequestMapping(value = "/returnRegisterAction", method = RequestMethod.GET)
	public void returnRegisterAction(HttpServletResponse response,
									 Refund refund,
									 @RequestParam("ORDER_NO") int order_no,
									 @RequestParam("USER_ID") String user_id) throws Exception {
		
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		int result1 = memberservice.returnRegister(order_no);
		int result2 = memberservice.refundinsert(refund);
		int result = result1 + result2;
		if(result == 2) {
			System.out.println("주문번호 " + order_no + " 반품 신청 완료");
			out.println("<script>");
			out.println("alert('반품 신청이 완료 되었습니다.');");
			out.println("window.opener.top.location.href='cancelProcess?USER_ID=" +user_id + "';");
			out.println("window.close();");
			out.println("</script>");
			out.close();
		}
	}
	
	

	//취소/반품 페이지
	@RequestMapping(value = "/cancelProcess", method = RequestMethod.GET)
	public ModelAndView cancelProcess(ModelAndView mv,
									  @RequestParam("USER_ID") String user_id,
									  @RequestParam(value="page", defaultValue="1", required=false) int page) throws Exception {
		
		//한 화면에 출력할 레코드 갯수
		int limit = 4;
						
		//총 리스트 수 받아옴
		int cancelreturncount = memberservice.cancelreturncount(user_id);
				
		//총 페이지 수
		int maxpage = (cancelreturncount + limit -1) / limit;
					
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage = ((page - 1) / 10) * 10 + 1;
						  
		//10, 20, 30 등
		int endpage = startpage + 10 -1;
						  
		if (endpage > maxpage) endpage = maxpage;
		
		List<O_Product> cancelreturnlist = memberservice.cancelreturnlist(user_id, page, limit);
		
		
		mv.addObject("cancelreturnlist", cancelreturnlist);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("doc", "cp");
		mv.setViewName("member/cancelProcess");
		
		return mv;
	}

	
	//리뷰 작성 가능한 리스트 가져옴
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public ModelAndView reviewList(ModelAndView mv,
								   @RequestParam("USER_ID") String user_id,
								   @RequestParam(value="page_able", defaultValue="1", required=false) int page_able,
								   @RequestParam(value="page_write", defaultValue="1", required=false) int page_write) throws Exception {
		
		//한 화면에 출력할 레코드 갯수
		int limit = 4;						
		//총 리스트 수 받아옴
		int reviewablecount = memberservice.reviewablecount(user_id);						
		//총 페이지 수
		int maxpage_able = (reviewablecount + limit -1) / limit;						
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage_able = ((page_able - 1) / 10) * 10 + 1;								  
		//10, 20, 30 등
		int endpage_able = startpage_able + 10 -1;								  
		if (endpage_able > maxpage_able) endpage_able = maxpage_able;
		
		List<O_Product> reviewablelist = memberservice.reviewablelist(user_id, page_able, limit);
		
		//int reviewablecount = memberservice.reviewablecount(user_id);		
		//List<O_Product> reviewablelist = memberservice.reviewablelist(user_id);
		
		
		
		int reviewwritecount = memberservice.reviewwritecount(user_id);
		System.out.println("작성 리뷰 개수 " + reviewwritecount);
		//총 페이지 수
		int maxpage_write = (reviewwritecount + limit -1) / limit;						
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage_write = ((page_write - 1) / 10) * 10 + 1;								  
		//10, 20, 30 등
		int endpage_write = startpage_write + 10 -1;								  
		if (endpage_write > maxpage_write) endpage_write = maxpage_write;
		
		List<O_Product> reviewwritelist = memberservice.reviewwritelist(user_id, page_write, limit);
		
		
		//int reviewwritecount = memberservice.reviewwritecount(user_id);
		//List<O_Product> reviewwritelist = memberservice.reviewwritelist(user_id);
		
		mv.addObject("doc", "rl");
		mv.addObject("page_able", page_able);
		mv.addObject("maxpage_able", maxpage_able);
		mv.addObject("startpage_able", startpage_able);
		mv.addObject("endpage_able", endpage_able);
		
		mv.addObject("page_write", page_write);
		mv.addObject("maxpage_write", maxpage_write);
		mv.addObject("startpage_write", startpage_write);
		mv.addObject("endpage_write", endpage_write);
		
		
		mv.addObject("reviewablecount", reviewablecount);
		mv.addObject("reviewablelist", reviewablelist);
		mv.addObject("reviewwritecount", reviewwritecount);
		mv.addObject("reviewwritelist", reviewwritelist);
		
		mv.setViewName("member/reviewList");
		return mv;
	}
		
	//리뷰 적는 폼으로 이동
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public ModelAndView reviewWrite(ModelAndView mv,
									@RequestParam("P_NO") int p_no,
									@RequestParam("REVIEW_ORDER_NO") int REVIEW_ORDER_NO) {
		
		Product p = memberservice.productDetail(p_no);
		
		mv.addObject("REVIEW_ORDER_NO", REVIEW_ORDER_NO);
		mv.addObject("doc", "rl");
		mv.addObject("productdetail", p);
		mv.setViewName("member/reviewWrite");
		
		return mv;
	}
	
	//리뷰 적는 메소드
	@RequestMapping(value = "/reviewWriteAction", method = RequestMethod.POST)
	public void reviewWriteAction(HttpServletResponse response,
								  Review review,
								  HttpServletRequest request,
								  @RequestParam("USER_ID") String user_id) throws Exception {
		
		MultipartFile uploadfile = review.getUploadfile();
		
			if(!uploadfile.isEmpty()) {
				String fileName = uploadfile.getOriginalFilename(); //원래 파일명
				review.setREVIEW_IMG(fileName); //원래 파일명 저장
				
				String saveFolder = "C:\\Users\\USER\\git\\doitmyself\\doitmyself_team\\src\\main\\webapp\\resources\\reviewupload\\";
				
				// 난수를 구합니다.(랜덤)
				Random r = new Random();
				int random = r.nextInt(100000000);
				
				//새로운 파일명
				String refileName = random + fileName;
				
				//오라클 디비에 저장될 파일 명
				// transferTo(file path) : 업로드한 파일을 매개변수의 경로에 지정합니다.
				uploadfile.transferTo(new File(saveFolder + refileName));
				
				//바뀐 파일명으로 저장
				review.setREVIEW_IMG(refileName);
				System.out.println("refileName = " + refileName);
			}
			
			memberservice.reviewWrite(review);
			
			response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰가 등록 되었습니다.')");
			out.println("location.href='reviewList?USER_ID=" +user_id + "';");
			out.println("</script>");
			out.close();
			
		
	}
	

	//리뷰 수정/삭제 폼으로 이동
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.GET)
	public ModelAndView reviewUpdate(ModelAndView mv,
									 @RequestParam("P_NO") int p_no,
									 @RequestParam("REVIEW_NO") int review_no) {
		
		O_Product r = memberservice.reviewDetail(p_no, review_no);
		mv.addObject("doc", "rl");
		mv.addObject("reviewdetail", r);
		mv.setViewName("member/reviewUpdate");
		
		return mv;
	}
	
	//리뷰 수정 메소드
	@RequestMapping(value = "/reviewUpdateAction", method = RequestMethod.POST)
	public void reviewUpdateAction(Review review, 
			  							   ModelAndView mv,
			  							   HttpServletRequest request,
			  							   HttpServletResponse response,
			  							   @RequestParam("USER_ID") String user_id) throws Exception {
		
		System.out.println(review.getREVIEW_IMG());

		MultipartFile uploadfile = review.getUploadfile();
		String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/reviewupload/";

		if(uploadfile != null && !uploadfile.isEmpty()) {
			System.out.println("파일 변경한 경우");
			String fileName = uploadfile.getOriginalFilename();
			review.setREVIEW_IMG(fileName);
			
			// 난수를 구합니다.(랜덤)
			Random r = new Random();
			int random = r.nextInt(100000000);

			String fileDBName = random + fileName;

			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			//바뀐 파일명으로 저장
			review.setREVIEW_IMG(fileDBName);
		}

		
		//DAO에서 수정 메서드 호출하여 수정합니다.
		int result = memberservice.reviewUpdate(review);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");

		//수정에 실패한 경우
		if(result == 0) {
			out.println("alert('리뷰 수정하는 도중 에러가 발생하였습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			
		} else { //수정 성공한 경우
			System.out.println("리뷰 수정 완료");			
			out.println("alert('리뷰가 정상적으로 수정 되었습니다.');");
			out.println("location.href='reviewList?USER_ID=" +user_id + "';");
			out.println("</script>");
		}

		out.close();

	}
	
	
	//리뷰 삭제 메소드
	@RequestMapping(value= "/reviewDeleteAction", method = RequestMethod.GET)
	public void reviewDeleteAction(HttpServletResponse response,
								   @RequestParam("REVIEW_NO") int review_no,
								   @RequestParam("USER_ID") String user_id) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		
		int result = memberservice.reviewDelete(review_no);
		
		if(result == 1) { //리뷰 삭제 성공
			System.out.println(review_no + " 리뷰 삭제 성공");
			out.println("<script>");
			out.println("alert('리뷰가 정상적으로 삭제 되었습니다.');");
			out.println("location.href='reviewList?USER_ID=" +user_id + "';");
			out.println("</script>");
			out.close();
		} else {
			System.out.println("리뷰 삭제 실패");
			out.println("<script>");
			out.println("alert('리뷰가 삭제 중 오류가 발생하였습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
	}



	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList(ModelAndView mv,
								@RequestParam("USER_ID") String user_id,
//								@RequestParam(value="page", defaultValue="1", required=false) int page,
								@RequestParam("qnaCate") String qnaCate) throws Exception {
		
		//한 화면에 출력할 레코드 갯수
//		int limit = 4;
						
		//총 리스트 수 받아옴
		int qnacount = memberservice.qnacount(user_id);
				
		//총 페이지 수
//		int maxpage = (qnacount + limit -1) / limit;
				
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
//		int startpage = ((page - 1) / 10) * 10 + 1;
						  
		//10, 20, 30 등
//		int endpage = startpage + 10 -1;
						  
//		if (endpage > maxpage) endpage = maxpage;
		
		
		List<Q_Product> qnalist = memberservice.qnalist(user_id, qnaCate);

		mv.addObject("doc", "ql");
//		mv.addObject("page", page);
//		mv.addObject("maxpage", maxpage);
//		mv.addObject("startpage", startpage);
//		mv.addObject("endpage", endpage);
		mv.addObject("qnacount", qnacount);
		mv.addObject("qnalist", qnalist);
		mv.addObject("qnaCate", qnaCate);
		mv.setViewName("member/qnaList");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="qnaListAjax")
	public Object qnaCateList(
			@RequestParam("USER_ID") String user_id,
//			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="qnaCate", defaultValue="q_all") String qnaCate) throws Exception {
		
		
		//한 화면에 출력할 레코드 갯수
//		int limit = 4;
								
		//총 리스트 수 받아옴
		int qnacount = memberservice.qnacount(user_id);
						
		//총 페이지 수
//		int maxpage = (qnacount + limit -1) / limit;
						
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
//		int startpage = ((page - 1) / 10) * 10 + 1;
								  
		//10, 20, 30 등
//		int endpage = startpage + 10 -1;
							  
//		if (endpage > maxpage) endpage = maxpage;
		
		System.out.println(qnaCate);
				
		List<Q_Product> qnalist = memberservice.qnalist(user_id, qnaCate);
		
		//Map 이용
		Map<String, Object> qnaajax = new HashMap<String, Object>();
//		qnaajax.put("page", page);
//		qnaajax.put("maxpage", maxpage);
//		qnaajax.put("startpage", startpage);
//		qnaajax.put("endpage", endpage);
		qnaajax.put("qnacount", qnacount);
		qnaajax.put("qnalist", qnalist);
		qnaajax.put("qnaCate", qnaCate);
		System.out.println(qnaajax);
		return qnaajax;
		
	}
	
	
	

	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public ModelAndView wishList(ModelAndView mv,
								 @RequestParam("D_USER_ID") String D_USER_ID,
								 @RequestParam(value="page", defaultValue="1", required=false) int page) throws Exception {
		
		//한 화면에 출력할 레코드 갯수
		int limit = 4;
								
		//총 리스트 수 받아옴
		int wishcount = memberservice.wishcount(D_USER_ID);
						
		//총 페이지 수
		int maxpage = (wishcount + limit -1) / limit;
						
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage = ((page - 1) / 10) * 10 + 1;
								  
		//10, 20, 30 등
		int endpage = startpage + 10 -1;
								  
		if (endpage > maxpage) endpage = maxpage;		
		
		List<Product> wishlist = memberservice.wishlist(D_USER_ID, page, limit);
		mv.addObject("doc", "wl");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("wishcount", wishcount);
		mv.addObject("wishlist", wishlist);
		mv.setViewName("member/wishList");
		return mv;
	}
	
	@RequestMapping(value = "/wishdelete", method = RequestMethod.GET)
	public void wishdelete(@RequestParam("P_NO") int p_no,
						   HttpServletResponse response,
						   @RequestParam("USER_ID") String user_id) throws Exception {
		
		int wishdelete = memberservice.wishdelete(p_no, user_id);
		System.out.println(wishdelete);
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		if(wishdelete == 1) {
			memberservice.p_dibsupdate(p_no);
			System.out.println("상품번호 " + p_no +" 찜 삭제 완료");
			out.println("<script>");
			out.println("alert('성공적으로 삭제 되었습니다.');");
			out.println("location.href='wishList?D_USER_ID=" + user_id + "';");
			out.println("</script>");
		} else {
			System.out.println("찜 삭제 중 오류");
		}
	}
	
	
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public ModelAndView cartList(ModelAndView mv,
								 @RequestParam("USER_ID") String USER_ID,
								 @RequestParam(value="page", defaultValue="1", required=false) int page) throws Exception {
		
		//한 화면에 출력할 레코드 갯수
		int limit = 4;
								
		//총 리스트 수 받아옴
		int cartcount = memberservice.cartcount(USER_ID);
		System.out.println(cartcount +"장바구니 수");				
		//총 페이지 수
		int maxpage = (cartcount + limit -1) / limit;
						
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등..)
		int startpage = ((page - 1) / 10) * 10 + 1;
								  
		//10, 20, 30 등
		int endpage = startpage + 10 -1;
								  
		if (endpage > maxpage) endpage = maxpage;		
		
		List<C_Product> cartlist = memberservice.cartlist(USER_ID, page, limit);
		mv.addObject("doc", "cl");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("cartcount", cartcount);
		mv.addObject("cartlist", cartlist);
		mv.setViewName("member/cartList");
		return mv;
	}
	
	
	@RequestMapping(value = "/cartdelete", method = RequestMethod.GET)
	public void cartdelete(@RequestParam("P_NO") int p_no,
						   HttpServletResponse response,
						   @RequestParam("USER_ID") String user_id) throws Exception {
		
		int cartdelete = memberservice.cartdelete(p_no, user_id);
		System.out.println(cartdelete);
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		if(cartdelete == 1) {
			System.out.println("상품번호 " + p_no +" 장바구니 삭제 완료");
			out.println("<script>");
			out.println("alert('성공적으로 삭제 되었습니다.');");
			out.println("location.href='cartList?USER_ID=" + user_id + "';");
			out.println("</script>");
		} else {
			System.out.println("장바구니 삭제 중 오류");
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="totalAjax")
	public Object totalAjax(@RequestParam("USER_ID") String user_id,
							@RequestParam(value="total", defaultValue="0") int total) throws Exception {
		
		Map<String, Object> cartajax = new HashMap<String, Object>();
		cartajax.put("total", total);
		
		System.out.println("total " + total);
		return cartajax;
	}
	
	@RequestMapping(value="cartpay")
	public String cartpay() {
		return "detail/pay";
	}
	
	

	@RequestMapping(value = "/change_password", method = RequestMethod.GET)
	public String change_password() {
		return "member/change_password";
	}
}
