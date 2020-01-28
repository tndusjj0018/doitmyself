package com.kh.dim2.controller;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.MainService;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Product;
import com.kh.dim2.domain.Recent_View;

@Controller
public class MainController {
	
	@Autowired
	public MainService mainService;
	
	public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}
	
	@RequestMapping(value="/home")
	public ModelAndView home(
				ModelAndView mv , Product product , HttpServletResponse response , HttpSession session) {
		
		List<Product> BestproductList = mainService.getBestProduct_List();
		List<Product> NewproductList = mainService.getNewProduct_List();
		// 상태 토큰으로 사용할 랜덤 문자열 생성
		String state = generateState();
		// 세션 또는 별도의 저장 공간에 상태 토큰을 저장
		session.setAttribute("StringState", state);
		
		mv.addObject("newDim" , NewproductList);
		mv.addObject("bestDim" , BestproductList);
		
		mv.setViewName("main/home");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(
				 ModelAndView mv,
				 HttpSession session) {
		return "main/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(
			ModelAndView mv,
			HttpSession session) {
		return "main/join";
	}
	
	@RequestMapping(value="/idcheck" , method=RequestMethod.GET)
	@ResponseBody
	public void idcheck(@RequestParam("USER_ID") String USER_ID,
						HttpServletResponse response) throws Exception {
		
		int result = mainService.isId(USER_ID);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	@RequestMapping(value="/emailcheck" , method=RequestMethod.GET)
	@ResponseBody
	public void emailcheck(@RequestParam("USER_EMAIL") String USER_EMAIL,
			HttpServletResponse response) throws Exception {
		
		int result = mainService.isEmail(USER_EMAIL);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	
	@RequestMapping(value="/joinProcess" , method = RequestMethod.POST)
	@ResponseBody
	public void joinProcess(Member member, 
							HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = mainService.insert(member);
		out.println("<script>");

		if(result == 1) {//삽입 성공시
			out.println("alert('회원가입에 성공했습니다.');");
			out.println("location.href='login';");
		} else if(result == -1) {
			out.println("alert('회원가입에 실패했습니다.');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping(value="/loginProcess" , method = RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam("USER_ID") String USER_ID , @RequestParam("USER_PASSWORD") String USER_PASSWORD , Recent_View recent_view ,
							HttpServletRequest request , HttpServletResponse response , HttpSession session , ModelAndView mv) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		
		int result = mainService.isId(USER_ID , USER_PASSWORD);
		int seller_result = mainService.isSeller(USER_ID);
		
		Member admin_check = mainService.isAdmin(USER_ID);
		
		if(result == 1) {
			
			int recentView_Count = mainService.recentViewCount(USER_ID);
			int adminNumber = admin_check.getUSER_IS_ADMIN();//관리자인지 아닌지 확인
			List<Product> BestproductList = mainService.getBestProduct_List();//Best Dim 구하기
			List<Product> NewproductList = mainService.getNewProduct_List();//New Dim 구하기
			session.setAttribute("USER_ID", USER_ID);
			session.setAttribute("SELLER_RESULT" , seller_result);
			
			if(recentView_Count > 0) {
				List<Recent_View> recentViewList = mainService.getRecent_View_List(USER_ID); //최근 본 DIM
				mv.addObject("recentView", recentViewList);
			}
			mv.addObject("newDim" , NewproductList);
			mv.addObject("bestDim" , BestproductList);
			mv.addObject("adminNumber" , adminNumber);
			mv.setViewName("main/home");
			
			return mv;
			
		} else {
			String message = "아이디나 비밀번호가 일치하지 않습니다.";

			response.setContentType("text/html;charset=utf-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('" + message + "');");
	         out.println("location.href='login';");
	         out.println("</script>");
	         out.close();
	         return null;
		}
	}
  
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}

	@RequestMapping(value="/cart_count", method=RequestMethod.POST)
	public void cart_count(String id, HttpServletResponse response) throws Exception {
		int result = mainService.cartCount(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value="/naverLoginProcess" , method=RequestMethod.GET)
	public String naverLoginProcess(@RequestParam("state") String state , HttpSession session ,  HttpServletResponse response) throws Exception{
		
		String NaverState = state;

		// 세션 또는 별도의 저장 공간에서 상태 토큰을 가져옴
		String storedState = (String)session.getAttribute("state");

		if( !NaverState.equals( storedState ) ) {
		    return "error"; //401 unauthorized
		} else {
		    return "NaverLoginSuccess"; //200 success
		}
	}
	
	@RequestMapping(value="/NaverLoginCallback" , method= {RequestMethod.GET , RequestMethod.POST})
	public String NaverLoginSuccess(ModelAndView mv , @RequestParam("code") String code) throws Exception{
		return "home";
	}
	
}
