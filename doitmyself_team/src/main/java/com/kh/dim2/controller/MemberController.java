package com.kh.dim2.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.Service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	String user_id = "sooyeon";

	// 회원 정보 가지고 옴
	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public ModelAndView member_info(

			ModelAndView mv, HttpSession session) {

		
		Member m = memberservice.memberInfo(user_id);
		session.setAttribute("USER_ID", user_id);
		mv.setViewName("member/memberInfo");
		mv.addObject("memberinfo", m);

		return mv;
	}

	// 회원 정보 수정
	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	public void updateProcess(Member member, HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = memberservice.memberUpdate(member);
		out.println("<script>");

		// 수정 된 경우
		if (result == 1) {
			out.println("alert('회원 정보가 변경 되었습니다.');");
			out.println("location.href='memberInfo';");
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
						   @RequestParam("change_password") String change_password) throws Exception {
		
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
	

	@RequestMapping(value = "/sellerChange", method = RequestMethod.GET)
	public ModelAndView sellerChange(ModelAndView mv) {
		
		int isSeller = memberservice.isSeller(user_id);
		mv.addObject("isSeller", isSeller);		
		mv.setViewName("member/sellerChange");
		
		return mv;
	}
	
	
	//판매자로 변환 (판매자 테이블에 insert)
	@RequestMapping(value = "/sellerChangeAction", method = RequestMethod.POST)
	public void sellerChangeAction(Seller seller,
								   HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int result = memberservice.sellerChange(seller);
		out.println("<script>");
		
		if(result == 1) { //판매자 등록 된 경우
			out.println("alert('판매자 등록이 완료 되었습니다.');");
			out.println("location.href='memberInfo';");
		} else {
			out.println("alert('판매자 등록에 실패 하였습니다.')");
			out.println("history.back();");
		}
		
		out.println("</script>");
		out.close();
	}

	
	@RequestMapping(value = "/memberLeave", method = RequestMethod.GET)
	public String memberLeave() {
		return "member/memberLeave";
	}
	
	//회원 탈퇴하기
	@RequestMapping(value = "/memberLeaveAction", method = RequestMethod.POST)
	public void memberLeaveAction(HttpServletResponse response,
								  @RequestParam("user_pass") String user_password) throws Exception {
		
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
