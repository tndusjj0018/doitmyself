package com.kh.dim2.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.AdminService;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Review;



@Controller
public class AdminController {
	String word ="";// 검색어를 저장할 변수  => ajax를 통해 검색을 할 수 있지만, 저장할 변수가 없으면 제대로 기능을 수행하지 못함
	@Autowired
	AdminService adminService;
	
	//관리자 페이지로 이동
	@GetMapping("admin")
	public ModelAndView AdminPage(String doc, ModelAndView mv, HttpServletRequest request) {
		System.out.println("view = "+ doc);
		if(doc == null) {
			doc = "userview";
		}else if (doc.equals("memberInfo")) {//회원관리에서 수정버튼 눌렀을 때
			Member member = UserInfo(Integer.parseInt(request.getParameter("USER_NO")));
			mv.addObject("member", member);
			
		}
		mv.addObject("doc",doc);
		mv.setViewName("admin/admin");
		
		return mv;
	}
	
	//유저 리스트 보기 ajax
	@ResponseBody//Ajax쓸 때 꼭 써야함
	@PostMapping("userList")
	public Object userList(@RequestParam(value = "num", defaultValue = "1", required = false)int num, 
							@RequestParam(value = "search_word", defaultValue = "", required = false)String search_word,
							@RequestParam(value = "search_col",  defaultValue = "USER_ID",required = false) String search_col,
							HttpServletRequest request){
		if(!search_word.equals("")) {
			word = search_word;
			//검색을 했을 때 처음 띄워줄 페이지는 1페이지
			num = 1;
		}
		System.out.println("여기는 AdminController userList()");
		System.out.println("search_col = "+search_col+", search_word = "+word);
		int limit =10;//한 페이지에 출력할 레코드 갯수
		int listcount = adminService.getListCount(word, search_col);
		System.out.println("adminService getListCount()갔다옴");
		
		//총 페이지 수 
		int maxpage = (listcount + limit - 1) / limit;
		
		//현재 페이지 그룹에서 맨 처음에 표시될 페이지 수 
		int startpage = ((num-1) / 10) *10 +1;
		//현재 페이지에 보여줄 마지막 페이지 수 (10, 20 , 30 등)
		int endpage = startpage + 10 -1;
		
		if (endpage > maxpage)
			endpage = maxpage;
		List<Member> memberlist;
		if(search_word == "") {
			memberlist = adminService.getMemberList(num, limit);
			System.out.println("모든 유저 리스트 보여주기");
		}else {
			memberlist = adminService.getMemberList(num, limit, word, search_col);
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("listcount", listcount);
		map.put("userlist", memberlist);
		map.put("limit", limit);
		map.put("search_word", word);
		map.put("search_col", search_col);
		
		
		return map;
	}
	
	@GetMapping("product")
	public String CategoryView() {
		return "category/shop";
	}
	
	
	@GetMapping("DeleteUser")
	public void DeleteUser(HttpServletResponse response, int USER_NO)throws Exception {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("왔다 유저번호 들고 " + USER_NO);
		PrintWriter out=  response.getWriter();
		int result = adminService.DeleteUser(USER_NO);
		out.println("<script>");
		if(result == 1) {
			out.println("alert('해당 사용자 삭제가 완료되었습니다.');");
			out.println("location.href ='admin?doc=userview'");
		}else {
			out.println("alert('해당 사용자 삭제에 실패하였습니다.');");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();
	}
	
	@GetMapping("ModifyUser")
	public void ModifyUser(HttpServletResponse response, int USER_NO)throws Exception {
		System.out.println("AdminController의 ModifyUser");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=  response.getWriter();
		int result = adminService.ModifyUser(USER_NO);
		out.println("<script>");
		if(result == 1) {
			out.println("alert('유저 정보 수정이 완료되었습니다.');");
			out.println("location.href ='admin?doc=userview'");
		}else {
			out.println("alert('유저 정보 수정에 실패했습니다.');");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();
	}
	
	@GetMapping("user_info")
	public Member UserInfo(int USER_NO) {
		System.out.println("AdminController의 UserInfo");
		Member member = adminService.getMemberInfo(USER_NO);
		System.out.println("userno = "+USER_NO);
		return member;
	}
	
	
	
	
	@ResponseBody
	@PostMapping("reviewlist")
	public Object getReviewList(@RequestParam(value="num", defaultValue = "1", required = false)int num,
								@RequestParam(value="reviewOrder")String reviewOrder) {
		//한 페이지에 보여줄 항목 수 
		int limit = 10;
		
		//총 리뷰 수 구하기
		int reviewcount = adminService.getReviewCount();
		
		
		System.out.println("AdminController의 getReviewList()");
		System.out.println("선택된 정렬 방법은 "+reviewOrder);
		
		List<Review> reviewlist = adminService.getReviewList(num, limit, reviewOrder);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewlist", reviewlist);
		
		return map;
	}
	
	@PostMapping("resetstaticvalue")
	public void ResetStaticValue() {
		word = "";
	}
	
}

