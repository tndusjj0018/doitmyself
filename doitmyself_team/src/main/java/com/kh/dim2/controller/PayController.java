package com.kh.dim2.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dim2.Service.OrderService;
import com.kh.dim2.Service.PayService;
import com.kh.dim2.domain.Member;
import com.kh.dim2.domain.Order;
import com.kh.dim2.domain.Product;


/*
 * @Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만
 * 모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역할을 
 * 
 */

@Controller
public class PayController {
 @Autowired
 private PayService paysvc;
 @Autowired
 private OrderService ordersvc;
	
	// 회원 정보 조회를 통해 배송지 입력
	@RequestMapping(value = "/pay")
	public ModelAndView loc_info(@RequestParam("USER_ID") String USER_ID, @RequestParam("P_NO") int P_NO, ModelAndView mv) {

		Member m = paysvc.locInfo(USER_ID);
		Product p = paysvc.prdInfo(P_NO);
		
		mv.setViewName("detail/pay");
		mv.addObject("locInfo",m);
	    mv.addObject("prdInfo",p);

		return mv;

	}
	
	@GetMapping(value = "/payComplete")
	   public void payComplete(Order order, HttpServletResponse response, HttpSession session) throws Exception {
	      response.setContentType("text/html; charset=utf-8");
	      PrintWriter out = response.getWriter();
	      int result = ordersvc.insertOrder(order);
	      out.println("<script>");

	      
	      String user_id = session.getAttribute("USER_ID").toString();
	      
	      //주문 테이블에 입력된 경우
	      if(result == 1) {
	         out.println("alert('주문이 완료되었습니다.');");
	         out.println("location.href='/dim2/orderDelivery?USER_ID=" + user_id + "'");
	      } else {
	         out.println("alert('주문에 실패했습니다.');");
	         out.println("location.href='/dim2/home'");
	      }
	      out.println("</script>");
	      out.close();
      
	   }
	

//	@GetMapping(value = "/paycom")
//	public String paycom() throws Exception {
//		return "detail/payComplete";
//		
//	}
		
		

	


}
