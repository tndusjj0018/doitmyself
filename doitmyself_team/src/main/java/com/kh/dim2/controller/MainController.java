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
	public void idcheck(@RequestParam("USER_ID") String USER_ID ,
			HttpServletResponse response) throws Exception {
		
		int result = mainService.isId(USER_ID);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	
	@RequestMapping(value="/joinProcess" , method = RequestMethod.POST)
	public void joinProcess(Member member , 
							HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = mainService.insert(member);
		out.println("<script>");
		if(result == 1) {//���� ������
			out.println("alert('ȸ�����Կ� ���ϵ帳�ϴ�.');");
			out.println("location.href='/login';");
		} else if(result == -1) {
			out.println("alert('ȸ�����Կ� �����Ͽ����ϴ�.');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
	}
}
