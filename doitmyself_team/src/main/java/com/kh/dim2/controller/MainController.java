package com.kh.dim2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.MainService;

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

}
