package com.kh.dim2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dim2.Service.CategoryServiceImpl;
import com.kh.dim2.domain.Product;

@Controller
public class CategoryController {
	@Autowired
	CategoryServiceImpl categoryService;

	@ResponseBody
	@PostMapping("getProductList")
	public Object getProductList(int num, String option,
			@RequestParam(value = "", required = false, defaultValue = "") String category,
			@RequestParam(value = "search_word", defaultValue = "", required = false) String search_word) {
		System.out.println("category = " + category);
		Map<String, Object> map = new HashMap<String, Object>();
		int limit = 12;// 한 번에 보여줄 컨텐츠의 갯수는 12개
		int startnum = limit * (num - 1) + 1;
		int endnum = limit + startnum - 1;
		map.put("start", startnum);
		map.put("end", endnum);
		map.put("option", option);

		String sub = category.substring(1);
		if (sub.equals("00")) {// 대분류 일때
			map.put("category", category.substring(0, 1));
		} else {
			map.put("category", category);
		}
		if (!search_word.equals("")) {// 상품 명 검색어
			System.out.println("검색어 = " + search_word);
			map.put("search_word", search_word);
		}

		int listcount = categoryService.getProductListcount(map);
		map.put("listcount", listcount);
		List<Product> list = categoryService.getProductList(map);
		map.put("list", list);
		return map;
	}
	@ResponseBody
	@PostMapping("jjim")
	public int Dibs(int P_NO, @RequestParam(value = "D_USER_ID",required = true)String D_USER_ID) {
		int result =0;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("P_NO", P_NO);
		map.put("D_USER_ID", D_USER_ID);
		String check = categoryService.checkDibs(map);
		System.out.println("check = "+check);
		if(check == null) {//찜 
			result = categoryService.dibsInsert(map);
			if(result == 1)//찜 
				result = 1;
			System.out.println("찜하기");
		}else {//찜 취소
			result = categoryService.dibsDelete(map);
			if(result == 1) 
				result = 2;
			System.out.println("찜취소");
		}
		
		return result;
	}
	
	//상품 리스트를 보여줄 때 찜인 상품과 찜이 아닌 상품을 구별
	@ResponseBody
	@PostMapping("ProductDibsCheck")
	public int ProductDibsCheck(int P_NO, @RequestParam(value = "D_USER_ID",required = true)String D_USER_ID) {//0: 찜이 되어있지 않은 상품
		int result = 0;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("P_NO", P_NO);
		map.put("D_USER_ID", D_USER_ID);
		String check = categoryService.checkDibs(map);
		
		return result;
	}
}
