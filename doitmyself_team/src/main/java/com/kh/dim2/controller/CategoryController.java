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
	public Object getProductList(int num, String option, @RequestParam(value="",required = false, defaultValue = "")String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		int limit = 12;//한 번에 보여줄 컨텐츠의 갯수는 12개 
		int startnum = limit *(num-1)+1;
		int endnum = limit+startnum-1;
		map.put("start", startnum);
		map.put("end", endnum);
		map.put("option", option);
		int listcount = categoryService.getProductListcount(map);
		map.put("listcount", listcount);
		List<Product> list = categoryService.getProductList(map);
		map.put("list", list);
		return map;
	}
}
