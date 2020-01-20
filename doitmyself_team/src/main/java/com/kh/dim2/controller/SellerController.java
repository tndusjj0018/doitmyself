package com.kh.dim2.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.SellerService;
import com.kh.dim2.domain.Category;
import com.kh.dim2.domain.Seller;
import com.kh.dim2.domain.SubCategory;

@Controller  
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@RequestMapping(value = "/seller")
	public ModelAndView seller(String doc, ModelAndView mv) {
		if(doc == null) {
			doc = "seller_info";
		}
		mv.addObject("doc",doc);
		mv.setViewName("seller/seller_nav");
		return mv;
	}
	
	// ## 판매자 정보 보기 ##
	@ResponseBody
	//@ResponseBody가 붙은 메서드에서 Map을 반환하면 자동으로 
	//Map 정보가 JSON 객체로 변환되어 전송됩니다.	
	@RequestMapping(value="/sellerInfo")
	public List<Seller> SellerInfo(@RequestParam("id")String id) {
		List<Seller> list = sellerService.sellerInfo(id);
		
		return list;
	}
	
	// ## 판매자 정보 수정 ##
	@RequestMapping(value="/sellerInfoUpdate", method=RequestMethod.POST)
	public void sellerInfoupdate(Seller s,
						HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = sellerService.infoUpdate(s);
		
		out.println("<script>");
		if(result == 1) {
			out.println("alert('수정되었습니다');");
			out.println("location.href='seller?doc=seller_info';");
		}else {
			out.println("alert('회원 정보 수정에 실패했습니다.');");			
			// out.println("location.href='join.net';");// 새로고침되어 이전에
			out.println("history.back()");// 비밀번호를 제외한 다른 데이터는 유지되어
		}
		out.println("</script>");
		out.close();
	}
	
	// ## 상품등록 ##
	
	// ## 카테고리 불러오기 ##
	@ResponseBody
	@RequestMapping(value="/productCategory")
	public List<Category> productCategory() {
		List<Category> list = sellerService.productCategory();
		
		return list;
	}
	
	// ## 서브카테고리 불러오기 ##
	@ResponseBody
	@RequestMapping(value="/productSubCategory")
	public List<SubCategory> productSubCategory(@RequestParam("c_no")int c_no) {
		List<SubCategory> list = sellerService.productSubCategory(c_no);
		
		return list;
	}
	
}

