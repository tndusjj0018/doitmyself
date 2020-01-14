package com.kh.dim2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.AdminService;
import com.kh.dim2.domain.Member;



@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	//관리자 페이지로 이동
	@GetMapping("admin")
	public ModelAndView AdminPage(String doc, ModelAndView mv,@RequestParam(value = "num", defaultValue = "1", required = false)int num) {
		System.out.println("view = "+ doc);
		if(doc == null) {
			doc = "userview";
		}
		mv.addObject("doc",doc);
		mv.addObject("num",num);
		mv.setViewName("admin/admin");
		
		return mv;
	}
	
	//유저 리스트 보기 ajax
	@ResponseBody//Ajax쓸 때 꼭 써야함
	@PostMapping("userList")
	public Object userList(@RequestParam(value = "num", defaultValue = "1", required = false)int num){
		System.out.println("여기는 AdminController userList()");
		int limit =10;//한 페이지에 출력할 레코드 갯수
		int listcount = adminService.getListCount();
		System.out.println("adminService getListCount()갔다옴");
		
		//총 페이지 수 
		int maxpage = (listcount + limit - 1) / limit;
		
		//현재 페이지 그룹에서 맨 처음에 표시될 페이지 수 
		int startpage = ((num-1) / 10) *10 +1;
		//현재 페이지에 보여줄 마지막 페이지 수 (10, 20 , 30 등)
		int endpage = startpage + 10 -1;
		
		if (endpage > maxpage)
			endpage = maxpage;
		
		List<Member> memberlist = adminService.getMemberList(num, limit);
		System.out.println("adminService getMemberList()갔다옴" + memberlist.get(1));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("listcount", listcount);
		map.put("userlist", memberlist);
		map.put("limit", limit);
		
		return map;
	}
	
	@GetMapping("product")
	public String CategoryView() {
		return "category/shop";
	}
	
	
}
