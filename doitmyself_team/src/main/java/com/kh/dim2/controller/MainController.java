package com.kh.dim2.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.MainService;
import com.kh.dim2.domain.Member;

@Controller
public class MainController {
	
	@Autowired
	public MainService mainService;
	
	@RequestMapping(value="/home")
	public String home() {
		return "main/home";
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
			out.println("alert('회원가입에 축하드립니다.');");
			out.println("location.href='login';");
		} else if(result == -1) {
			out.println("alert('회원가입에 실패하였습니다.');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping(value="/loginProcess" , method = RequestMethod.POST)
	public String loginProcess(@RequestParam("USER_ID") String USER_ID , @RequestParam("USER_PASSWORD") String USER_PASSWORD ,
							HttpServletRequest request , HttpServletResponse response , HttpSession session) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		
		int result = mainService.isId(USER_ID , USER_PASSWORD);
		
		if(result == 1) {
			session.setAttribute("USER_ID", USER_ID);
			return "redirect:home";
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
		return "redirect:login";		 
	 }
}
