package com.kh.dim2.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.MemberService;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.O_Product;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Q_Product;
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
			out.println("self.close();");
			out.println("location.href='memberInfo';");			
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
	public String memberLeave() {
		return "member/memberLeave";
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

	@RequestMapping(value = "/orderDelivery", method = RequestMethod.GET)
	public ModelAndView orderDelivery(ModelAndView mv,
									  @RequestParam("USER_ID") String user_id) {
		
		int ordercount = memberservice.ordercount(user_id);
		
		List<O_Product> orderlist = memberservice.orderlist(user_id);
		mv.addObject("orderlist", orderlist);
		mv.addObject("ordercount", ordercount);
		mv.setViewName("member/orderDelivery");
		return mv;
	}

	@RequestMapping(value = "/cancelProcess", method = RequestMethod.GET)
	public String cancelProcess() {
		return "member/cancelProcess";
	}

	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public ModelAndView reviewList(ModelAndView mv,
								   @RequestParam("USER_ID") String user_id) {
		
		int reviewablecount = memberservice.reviewablecount(user_id);		
		List<O_Product> reviewablelist = memberservice.reviewablelist(user_id);
		
		int reviewwritecount = memberservice.reviewwritecount(user_id);
		List<O_Product> reviewwritelist = memberservice.reviewwritelist(user_id);
		
		
		mv.addObject("reviewablecount", reviewablecount);
		mv.addObject("reviewablelist", reviewablelist);
		mv.addObject("reviewwritecount", reviewwritecount);
		mv.addObject("reviewwritelist", reviewwritelist);
		
		mv.setViewName("member/reviewList");
		return mv;
	}
		
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET)
	public ModelAndView reviewWrite(ModelAndView mv,
									@RequestParam("P_NO") int p_no) {
		
		Product p = memberservice.productDetail(p_no);
		mv.addObject("productdetail", p);
		mv.setViewName("member/reviewWrite");
		
		return mv;
	}
	
	
	@RequestMapping(value = "/reviewWriteAction", method = RequestMethod.POST)
	public void reviewWriteAction(HttpServletResponse response,
								  Review review,
								  HttpServletRequest request,
								  @RequestParam("USER_ID") String user_id) throws Exception {
		
		MultipartFile uploadfile = review.getUploadfile();
		
		//if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); //원래 파일명
			review.setREVIEW_IMG(fileName); //원래 파일명 저장
			
			String saveFolder = "C:\\Users\\USER\\git\\doitmyself\\doitmyself_team\\src\\main\\webapp\\resources\\reviewupload";
			
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
			
			memberservice.reviewWrite(review);
			
			response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰가 등록 되었습니다.')");
			out.println("location.href='reviewList?USER_ID=" +user_id + "';");
			out.println("</script>");
			out.close();
			
			
		//}
		
	}
	

	
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.GET)
	public ModelAndView reviewUpdate(ModelAndView mv,
									 @RequestParam("P_NO") int p_no) {
		
		O_Product r = memberservice.reviewDetail(p_no);
		mv.addObject("reviewdetail", r);
		mv.setViewName("member/reviewUpdate");
		
		return mv;
	}
	
	

	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList(ModelAndView mv,
								@RequestParam("USER_ID") String user_id) {
		
		int qnacount = memberservice.qnacount(user_id);
		
		List<Q_Product> qnalist = memberservice.qnalist(user_id);

		mv.addObject("qnacount", qnacount);
		mv.addObject("qnalist", qnalist);
		mv.setViewName("member/qnaList");
		return mv;
	}

	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public ModelAndView wishList(ModelAndView mv,
								 @RequestParam("D_USER_ID") String D_USER_ID) {
		int wishcount = memberservice.wishcount(D_USER_ID);
		
		List<Product> wishlist = memberservice.wishlist(D_USER_ID);
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

	@RequestMapping(value = "/change_password", method = RequestMethod.GET)
	public String change_password() {
		return "member/change_password";
	}
	
}
